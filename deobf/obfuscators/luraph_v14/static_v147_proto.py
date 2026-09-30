"""Static reader for the section/prototype records in one Luraph v14.7 family.

This file translates the small, data-only readers from the wrapper into Python.
It parses framed records and instruction operands; it never constructs or calls
the Luau VM and never executes a recovered prototype.
"""

from dataclasses import dataclass


MAX_RECORDS = 1_000_000
MAX_RECORD_BYTES = 16 * 1024 * 1024
MAX_RECURSION = 64
U32 = 0xFFFFFFFF


class StaticParseError(ValueError):
    pass


def bxor(*values):
    result = 0
    for value in values:
        result ^= int(value) & U32
    return result & U32


@dataclass
class Cursor:
    data: bytes
    offset: int = 0

    def varint(self):
        value = 0
        multiplier = 1
        shift = 0
        while True:
            if self.offset >= len(self.data):
                raise StaticParseError("truncated varint at byte %d" % self.offset)
            byte = self.data[self.offset]
            self.offset += 1
            value += (byte % 128) * multiplier
            if byte < 128:
                return value
            multiplier *= 128
            shift += 7
            if shift > 56:
                raise StaticParseError("varint exceeds 64-bit limit")

    def take(self, size):
        if not isinstance(size, int) or size < 0 or size > MAX_RECORD_BYTES:
            raise StaticParseError("record length is outside the 16 MiB bound")
        end = self.offset + size
        if end > len(self.data):
            raise StaticParseError("record extends past its containing section")
        result = self.data[self.offset:end]
        self.offset = end
        return result

    def string(self):
        return self.take(self.varint())


def parse_outer_section(data):
    """Mirror wrapper ``d``: section key plus its framed record directory."""
    cursor = Cursor(data)
    body = cursor.string()
    key = cursor.string()
    root_index = cursor.varint()
    count = cursor.varint()
    if count > MAX_RECORDS:
        raise StaticParseError("section directory exceeds record limit")
    rows = []
    for position in range(count):
        item_id = cursor.varint()
        first = cursor.string()
        second = cursor.string()
        descriptor = cursor.varint()
        rows.append({
            "id": item_id or position + 1,
            "first": first,
            "second": second,
            "descriptor": descriptor,
        })
    if cursor.offset != len(data):
        raise StaticParseError("unparsed bytes remain in section directory")
    return {
        "body": body,
        "key": key,
        "root_index": root_index,
        "rows": rows,
    }


def parse_body_pair(data):
    """Mirror wrapper ``D``: extract constant and instruction streams."""
    cursor = Cursor(data)
    constants = cursor.string()
    instructions = cursor.string()
    return {
        "constants": constants,
        "instructions": instructions,
        "trailing_bytes": len(data) - cursor.offset,
    }


def _read_ie(cursor):
    value = cursor.varint()
    if value % 2 == 0:
        return value // 2
    return -((value + 1) // 2)


def _read_qqh(cursor):
    first = cursor.varint()
    second = _read_ie(cursor)
    if first is None:
        first = bxor(12269, 844)
    return {
        21357: bxor(first, 844),
        20561: (second if second is not None else 104) - 104,
    }


def parse_h_record(data, record_index=None, depth=0, tag_schedule=None):
    """Mirror wrapper ``h`` for one decrypted instruction record."""
    if depth > MAX_RECURSION:
        raise StaticParseError("nested record recursion exceeds limit")
    cursor = Cursor(data)
    first = cursor.varint()
    initial = bxor(first or 0, 20847)
    r_value = initial
    type_tag = initial
    if record_index is not None:
        n = (((record_index + 15912) * 207) + 6103) % 65535
        r_value -= n
        offset, multiplier, addend, modulus = tag_schedule or (11445, 779, 22743, 65535)
        n = (((record_index + offset) * multiplier) + addend) % modulus
        type_tag = bxor(initial + n, 25214)
    else:
        type_tag = bxor(initial + 7614, 25214)

    result = {1: type_tag}
    if r_value == 15175:
        count = cursor.varint()
        if count > MAX_RECORDS:
            raise StaticParseError("nested record array exceeds record limit")
        values = []
        marked = False
        for _ in range(count):
            item = cursor.string()
            parsed = parse_h_record(item, None, depth + 1, tag_schedule)
            values.append(parsed)
            if parsed.get(31321):
                marked = True
        result[9] = values
        if marked:
            result[31321] = 1
        return result

    flag_word = cursor.varint()
    h_value = 22743
    if record_index is not None:
        h_value = (((record_index + 11445) * 779) + 22743) % 65535
    flags = bxor(flag_word if flag_word is not None else h_value, h_value)
    order = (flags // 16) % 10
    mask = flags % 16

    a = d = i_value = r = None

    def take_kind(kind):
        nonlocal a, d, i_value, r
        if kind == 4:
            a = _read_qqh(cursor)
        elif kind == 8:
            i_value = cursor.string()
        elif kind == 1:
            r = _read_ie(cursor) - 6
        elif kind == 2:
            d = _read_qqh(cursor)

    layouts = (
        (4, 8, 1, 2), (1, 2, 4, 8), (2, 4, 8, 1), (2, 4, 1, 8),
        (8, 4, 2, 1), (2, 1, 8, 4), (1, 2, 4, 8), (1, 4, 8, 2),
        (4, 8, 1, 2), (1, 8, 2, 4),
    )
    for kind in layouts[order]:
        if mask & kind:
            take_kind(kind)

    fallback = {21357: 12269, 20561: 0}
    result[5] = (r if r is not None else 0) + 7
    result[3] = {1: a if a is not None else fallback,
                 2: d if d is not None else fallback,
                 3: initial % 23}
    if a is not None and a.get(21357) in (32629, 32300):
        result[31321] = 1
    if d is not None and d.get(21357) in (32629, 32300):
        result[31321] = 1
    if i_value:
        result[7] = i_value
    result["record_bytes"] = cursor.offset
    return result


def decode_instruction_stream(data, key, tag_schedule=None):
    """Mirror ``gNckC`` with the wrapper's per-record byte transforms."""
    if not key:
        raise StaticParseError("instruction stream has an empty key")
    cursor = Cursor(data)
    records = []
    while cursor.offset < len(data):
        if len(records) >= MAX_RECORDS:
            raise StaticParseError("instruction count exceeds record limit")
        size = cursor.varint()
        if size is None or size < 0 or size > MAX_RECORD_BYTES:
            raise StaticParseError("instruction record size is outside limits")
        body_offset = cursor.offset
        raw = cursor.take(size)
        index = len(records) + 1
        key_sum = (index - 2) + (((index * 733) + 12566) % len(key))
        mixed = ((index * 871) + 22928) % 256
        d = (((index + 109) % 4) * 2) + 17
        i_value = ((index * 29) + 27185) + mixed
        clear = bytearray(size)
        for position, value in enumerate(raw, 1):
            key_index = (key_sum + position) % len(key)
            key_byte = key[key_index]
            phase = (((index + 14310) * 953) + position) % 3
            if phase == 0:
                mask = (i_value + (position * d) + ((position % 3) * mixed)) % 256
            elif phase == 1:
                mask = (i_value + (position * (d + 2)) + ((position % 5) * mixed)
                        + (((position * position) + index) % 251)) % 256
            else:
                mask = (i_value + (position * (d + 4))
                        + bxor((position * mixed) % 256, (index + position) % 256)) % 256
            clear[position - 1] = bxor(value, mask, key_byte) & 0xFF
        record = parse_h_record(bytes(clear), index, tag_schedule=tag_schedule)
        record.update({"index": index, "offset": body_offset,
                       "encoded_bytes": size})
        records.append(record)
    return records


def _qXplJ(data, key):
    """Port this wrapper family's keyed byte transform, operating on bytes only."""
    if not key:
        raise StaticParseError("constant decoder has an empty key")
    seed = 173
    for position, value in enumerate(key, 1):
        seed = (seed * 131 + value + position) % 65536
    previous = (len(key) * 13) % 256
    output = bytearray(len(data))
    for position, value in enumerate(data, 1):
        key_byte = key[(position - 1) % len(key)]
        mask = (seed + seed // 256 + key_byte + previous) % 256
        output[position - 1] = value ^ mask
        previous = value
        seed = (seed + key_byte * 17 + position * 11 + previous * 7) % 65536
    return bytes(output)


def _decode_index_map(data, key):
    """Mirror the wrapper's n(v, key): remap sequential constant slots."""
    if not data:
        return []
    decoded = _qXplJ(data, key)
    cursor = Cursor(decoded)
    result = []
    while cursor.offset < len(decoded):
        if len(result) >= MAX_RECORDS:
            raise StaticParseError("constant index map exceeds record limit")
        encoded = cursor.varint()
        index = len(result) + 1
        mask = bxor(index * 161 + 29000, key[(index - 1) % len(key)])
        result.append(bxor(encoded, mask))
    return result


def _parse_constant_directory(data):
    """Mirror MB: return each record's one-based starting offset and fields."""
    cursor = Cursor(data)
    rows = []
    while cursor.offset < len(data):
        if len(rows) >= MAX_RECORDS:
            raise StaticParseError("constant record directory exceeds record limit")
        start = cursor.offset
        fields = [cursor.varint() for _ in range(8)]
        # MB skips four packed byte slices after the eight varints.
        skip = sum(fields[1:5])
        next_offset = cursor.offset + skip
        if next_offset <= start or next_offset > len(data):
            raise StaticParseError("constant record has an invalid packed-slice boundary")
        rows.append({"offset": start + 1, "fields": fields})
        cursor.offset = next_offset
    return rows


def _read_constant_fields(data, offset):
    cursor = Cursor(data, offset - 1)
    return [cursor.varint() for _ in range(8)]


def _evQUG(index, count, key_level=0):
    """Mirror the deterministic secondary key used by this v14.7 sample."""
    if count <= 0:
        return 0
    level = min(max(key_level, 0), count)
    first = bxor(
        ((level + 17649 + 15) * 749 + index * 847 + count + 9960 + 61 * 3) % 65536,
        ((count + 19646 + 100) * 423 + index + 12) % 65536,
    )
    second = bxor(
        (first + (((index + 8616 + 211) * 927) % 65536)) % 65536,
        (count + 8185 + 167) % 65536,
    )
    return bxor(
        (second + level * 891 + 15013 + 162) % 65536,
        (index + level + 53145 + 134) % 65536,
    ) % 65536


def _decode_constant_record(data, key, offset, index, key_level=None):
    """Decode one SxtvY record. No strings are parsed or evaluated as code."""
    cursor = Cursor(data, offset - 1)
    fields = [cursor.varint() for _ in range(8)]
    payload_base = cursor.offset + 1
    original_i, a, first_size, second_size, r, x, d, h = fields
    if a < 0 or r < 0 or first_size < 0 or second_size < 0:
        raise StaticParseError("constant record has a negative range")
    if first_size + second_size <= 0:
        raise StaticParseError("constant record has no encoded bytes")
    if not key:
        raise StaticParseError("constant record key is empty")

    key_variant = (bxor(h, 2496) % 6) + 1
    seed_selector = bxor(x, 19412)
    seed_count = bxor(d, 16834)
    layout = bxor(original_i, 3489) % 6
    if key_level is None:
        # The offline parser has no executed PC from which to recover kl. Use
        # the stable saturated value; reports preserve this as an assumption.
        key_level = seed_count
    if layout == 0:
        first_start, second_start = payload_base + a, payload_base + a + first_size
    elif layout == 1:
        first_start, second_start = payload_base, payload_base + first_size + a + r
    elif layout == 2:
        first_start, second_start = payload_base + second_size + r + a, payload_base
    elif layout == 3:
        first_start, second_start = payload_base + r, payload_base + r + first_size + a
    elif layout == 4:
        first_start, second_start = payload_base, payload_base + first_size + r
    else:
        first_start, second_start = payload_base + second_size + a, payload_base

    use_secondary = seed_selector % 4 >= 2 and seed_count > 0
    seed = _evQUG(index, seed_count, key_level) if use_secondary else 0

    def decode_segment(start, length, mask_start):
        if length <= 0:
            return b""
        end = start + length - 1
        if start < 1 or end > len(data):
            raise StaticParseError("constant byte slice extends past its record stream")
        clear = bytearray(length)
        for position in range(1, length + 1):
            absolute_index = start + position - 1
            mask_index = mask_start + position - 1
            cipher = data[absolute_index - 1]
            key_index = ((mask_index + index * 155 + 16620) % len(key))
            key_byte = key[key_index]
            mask = (((index + 16217) * 775) + mask_index * 449
                    + (layout * 19) + 26018) % 256
            value = cipher ^ key_byte ^ mask
            if use_secondary:
                byte_mask = (seed + index * 31 + position * 475 + 16834) % 256
                if key_variant == 1:
                    extra = byte_mask
                elif key_variant == 2:
                    extra = bxor(byte_mask, (seed + position * 687 + index * 13
                                             + seed_count * 5 + 45879) % 256)
                elif key_variant == 3:
                    extra = (byte_mask + position * 29 + index * 11
                             + seed_count * 3 + 45879) % 256
                elif key_variant == 4:
                    mixed = (((length - position + 1) * 687 + seed_count + 3530) % 256)
                    extra = bxor((seed + mixed + index * 19) % 256,
                                 (byte_mask + position * 3) % 256)
                elif key_variant == 5:
                    extra = (byte_mask + ((position % 5) + 1) * 17
                             + seed_count * 7 + 45879) % 256
                else:
                    extra = bxor((byte_mask + position * 13 + index * 9
                                  + seed_count * 23) % 256,
                                 (seed + position + 45879) % 256)
                value ^= extra
            clear[position - 1] = value & 0xFF
        return bytes(clear)

    clear = decode_segment(first_start, first_size, 1)
    if second_size:
        second_key = decode_segment(second_start, second_size, first_size + 1)
        clear = _qXplJ(clear, second_key)

    if not clear:
        return {"type": "string", "value": "", "raw": ""}
    type_tag = clear[-1]
    body = bytes((value + 174) & 0xFF for value in clear[:-1])
    text = body.decode("latin-1")
    if type_tag == 11:
        try:
            value = int(text, 10)
        except ValueError:
            try:
                value = float(text)
            except ValueError:
                return {"type": "number", "value": None, "raw": text}
        return {"type": "number", "value": value, "raw": text}
    if type_tag == 7:
        return {"type": "boolean", "value": text == "true", "raw": text}
    if type_tag == 6:
        return {"type": "nil", "value": None, "raw": text}
    if type_tag == 4:
        return {"type": "string", "value": text, "raw": text}
    return {"type": "unknown-%d" % type_tag, "value": text, "raw": text}


def decode_constant_stream(data, key):
    """Decode the statically encoded constant pool for the supplied wrapper."""
    stream = Cursor(data)
    index_map = stream.string()
    records = stream.string()
    if stream.offset != len(data):
        raise StaticParseError("trailing bytes in constant pool envelope")
    directory = _parse_constant_directory(records)
    mapped = _decode_index_map(index_map, key)
    if not mapped:
        mapped = list(range(1, len(directory) + 1))

    constants = []
    for constant_index, directory_index in enumerate(mapped, 1):
        if len(constants) >= MAX_RECORDS:
            raise StaticParseError("constant pool exceeds record limit")
        item = {"index": constant_index, "directory_index": directory_index}
        if directory_index <= 0 or directory_index > len(directory):
            item["error"] = "directory index is outside the constant record table"
        else:
            row = directory[directory_index - 1]
            item["record_offset"] = row["offset"]
            try:
                item.update(_decode_constant_record(
                    records, key, row["offset"], constant_index
                ))
            except (StaticParseError, ValueError, IndexError) as exc:
                item["error"] = str(exc)
        constants.append(item)

    return {
        "index_map_bytes": len(index_map),
        "record_stream_bytes": len(records),
        "record_count": len(directory),
        "constant_count": len(constants),
        "key_context_mode": "kl saturated at each record's seed-count bound",
        "constants": constants,
    }


def summarize_section(section_bytes, tag_schedule=None):
    """Parse the section directory and decrypt its instruction records."""
    outer = parse_outer_section(section_bytes)
    body = parse_body_pair(outer["body"])
    instructions = decode_instruction_stream(body["instructions"], outer["key"], tag_schedule)
    constants = decode_constant_stream(body["constants"], outer["key"])
    return {
        "key_bytes": len(outer["key"]),
        "root_index": outer["root_index"],
        "directory_rows": len(outer["rows"]),
        "body_bytes": len(outer["body"]),
        "constant_stream_bytes": len(body["constants"]),
        "instruction_stream_bytes": len(body["instructions"]),
        "instruction_count": len(instructions),
        "instructions": instructions,
        "constant_index_map_bytes": constants["index_map_bytes"],
        "constant_record_stream_bytes": constants["record_stream_bytes"],
        "constant_record_count": constants["record_count"],
        "constant_count": constants["constant_count"],
        "constant_key_context_mode": constants["key_context_mode"],
        "constants": constants["constants"],
        "directory": outer["rows"],
    }
