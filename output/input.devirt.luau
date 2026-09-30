-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local v = ...
local v2 = type
local v3 = pcall
local v4 = xpcall
local v5 = error
local v6 = tostring
local v7 = tonumber
local v8 = ipairs
local v9 = rawget
local v10 = rawset
local v11 = print
local v12 = warn
local v13 = getgenv
local v14 = getfenv
local v15 = identifyexecutor
local v16 = _G
local v17 = game

local function fn(arg, arg2)
	if v2(arg) ~= "table" then
		return arg
	end
	local tbl = {}

	for _, v18 in v8(arg2) do
		local v19, v20 = v3(function()
			return arg[v18]
		end)

		if v19 then
			tbl[v18] = v20
		end
	end

	return tbl
end

local v18 = fn(string, { "byte", "char", "find", "format", "gsub", "lower", "match", "rep", "sub" })
local v19 = fn(table, { "concat", "create", "pack", "unpack" })
local v20 = fn(math, { "ceil", "floor", "max", "min" })
local v21 = fn(os, { "clock", "time" })
local v22 = fn(bit32, { "bxor", "lshift", "rshift" })
local v23 = fn(task, { "wait" })
local v24 = fn(buffer, { "tostring" })
local getService = v17.GetService
local httpService = getService(v17, "HttpService")
local rbxAnalyticsService = getService(v17, "RbxAnalyticsService")
local v25 = loadstring
local jsonEncode = httpService.JSONEncode
local jsonDecode = httpService.JSONDecode
local generateGUID = httpService.GenerateGUID
local getClientId = rbxAnalyticsService.GetClientId
local n = 3
local str = "/v1/auth/challenge"
local str2 = "/v1/auth/script"
local str3 = "/v1/auth/payload"
local str4 = "flowauth-loader-v3-hwid-aliases-v1"
local str5 = "flowauth-loader-key-fingerprint-v3"
local str6 = "flowauth-mac-v3"
local str7 = "flowauth-loader-v3-hash-algorithm-v1"
local str8 = "flowauth-loader-v3-chunked-payload-v1"
local n2 = 67174400
local n3 = v20.ceil(n2 / 3) * 4

local function fn2(arg, arg2)
	if v2(arg) == "function" then
		local v26, v27 = v3(function()
			return arg()
		end)

		if v26 and v2(v27) == "table" then
			return v27
		end
	end

	return arg2
end

local v26 = fn2(v14, v16)
local v27 = fn2(v13, v26)

local function fn3(arg)
	v5("FlowAuth: " .. v6(arg), 0)
end

local function fn4(arg, arg2)
	v11(v18.format("[%s]: %s", arg, arg2))
end

local function fn5(arg)
	local v28 = v19.create(#arg)

	for i = 1, #arg do
		v28[i] = v18.format("%02x", v18.byte(arg, i))
	end

	return v19.concat(v28)
end

local function fn6(arg, arg2)
	local v28 = v18.gsub(v6(arg or ""), "[^ -~]", "")
	local v29

	if arg2 and #v28 > arg2 then
		v29 = v18.sub(v28, 1, arg2)
	else
		v29 = v28
	end

	return v29
end

local function fn7(arg)
	local v28 = v19.create(#arg)

	for i = 1, #arg do
		local v29 = v6(arg[i])
		v28[i] = #v29 .. ":" .. v29 .. ","
	end

	return v19.concat(v28)
end

local function fn8(arg, arg2)
	if v2(arg) ~= "table" then
		return nil
	end

	local v28, v29 = v3(function()
		return arg[arg2]
	end)

	if v28 then
		return v29
	end
	return nil
end

local function fn9(arg)
	return fn8(v27, arg) or fn8(v26, arg) or fn8(v16, arg)
end

local crypt = fn9("crypt")

local function fn10(arg, arg2)
	local v28 = fn8(arg, arg2)
	if v2(v28) == "function" then
		return v28
	end
	return nil
end

local tbl = {
	sha256 = {
		32,
		"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
		"248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1",
		{ "sha256", "SHA256", "sha-256", "SHA-256" },
	},
	sha384 = {
		48,
		"cb00753f45a35e8bb5a03d699ac65007272c32ab0eded1631a8b605a43ff5bed8086072ba1e7cc2358baeca134c825a7",
		"3391fdddfc8dc7393707a65b1b4709397cf8b1d162af05abfe8f450de5f36bc6b0455a8520bc4e6f5fe95b1fe3c8452b",
		{ "sha384", "SHA384", "sha-384", "SHA-384" },
	},
	blake2b256 = {
		32,
		"bddd813c634239723171ef3fee98579b94964e3bb1cb3e427262c8c068d52319",
		"5f7a93da9c5621583f22e49e8e91a40cbba37536622235a380f434b9f68e49c4",
		{ "blake2b256", "blake2b-256", "BLAKE2B256", "BLAKE2B-256" },
	},
	blake2b512 = {
		64,
		"ba80a53f981c4d0d6a2797b69f12f6e94c212f14685ac4b74b12bb6fdbffa2d17d87c5392aab792dc252d5de4533cc9518d38aa8dbf1925ab92386edd4009923",
		"7285ff3e8bd768d69be62b3bf18765a325917fa9744ac2f582a20850bc2b1141ed1b3e4528595acc90772bdf2d37dc8a47130b44f33a02e8730e5ad8e166e888",
		{ "blake2b512", "blake2b", "BLAKE2B512", "BLAKE2B" },
	},
}

local syn = fn9("syn")
local v28 = fn8(syn, "crypt")
local v29 = fn8(syn, "crypto")
local v30 = fn10(crypt, "hash")
local v31 = fn8(crypt, "custom")
local v32 = fn8(v28, "custom")
local v33 = fn8(v29, "custom")
local tbl2 = {}
local tbl3 = { (fn10(v31, "hash")) }
local tbl4 = { (fn10(v32, "hash")) }
local tbl5 = { (fn10(v33, "hash")) }
tbl2[1] = tbl3
tbl2[2] = tbl4
tbl2[3] = tbl5
local tbl6 = {}
local tbl7 = { (fn10(v28, "hash")) }
local tbl8 = { (fn10(v29, "hash")) }
local tbl9 = { (fn9("hash")) }
tbl6[1] = { v30 }
tbl6[2] = tbl7
tbl6[3] = tbl8
tbl6[4] = tbl9

local function fn11(arg, arg2)
	if v2(arg) == "buffer" then
		local v34, v35 = v3(v24.tostring, arg)
		if not v34 then
			return nil
		end
		arg = v35
	end

	if v2(arg) ~= "string" then
		return nil
	end

	if #arg == arg2 * 2 and v18.match(arg, "^%x+$") then
		return v18.lower(arg)
	end

	if #arg == arg2 then
		return fn5(arg)
	end
	return nil
end

local function fn12(arg)
	local v34 = tbl[arg]
	local v35 = v34[1]
	local v36 = v34[2]
	local v37 = v34[3]
	local v38 = v34[4]
	local tbl10 = {}

	for _, v39 in v8(tbl6) do
		local v40 = v39[1]

		for _, v41 in v8(v38) do
			tbl10[#tbl10 + 1] = { v40, v41, false }
			tbl10[#tbl10 + 1] = { v40, v41, true }
		end
	end

	for _, v39 in v8(tbl2) do
		local v40 = v39[1]

		for _, v41 in v8(v38) do
			tbl10[#tbl10 + 1] = { v40, v41, true }
			tbl10[#tbl10 + 1] = { v40, v41, false }
		end
	end

	tbl10[#tbl10 + 1] = { fn10(crypt, arg) }
	tbl10[#tbl10 + 1] = { fn10(v28, arg) }
	tbl10[#tbl10 + 1] = { fn10(v29, arg) }
	tbl10[#tbl10 + 1] = { fn9(arg) }

	for _, v39 in v8(tbl6) do
		tbl10[#tbl10 + 1] = { v39[1] }
	end

	for _, v39 in v8(tbl10) do
		local v40 = v39[1]
		local v41 = v39[2]
		local flag = v39[3] == true
		if v2(v40) ~= "function" then
			continue
		end

		local function fn13(arg2)
			local v42, v43

			if v41 and flag then
				v42, v43 = v3(v40, v41, arg2)
			elseif v41 then
				v42, v43 = v3(v40, arg2, v41)
			else
				v42, v43 = v3(v40, arg2)
			end

			if not v42 then
				return nil
			end
			return fn11(v43, v35)
		end

		if fn13("abc") == v36 and fn13("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq") == v37 then
			return fn13, function()
				return fn13("abc") == v36 and fn13("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq") == v37
			end
		end
	end

	return nil
end

local sha256, v34 = fn12("sha256")
local str9 = sha256 and "sha256" or nil

if not sha256 then
	sha256, v34 = fn12("sha384")
	str9 = sha256 and "sha384" or nil
end

if not sha256 then
	sha256, v34 = fn12("blake2b256")
	str9 = sha256 and "blake2b256" or nil
end

if not sha256 then
	sha256, v34 = fn12("blake2b512")
	str9 = sha256 and "blake2b512" or nil
end

if not sha256 then
	fn3("no verified native SHA-256, SHA-384, or BLAKE2b is available; runtime 3.9-private-transport")
end

local function fn13(arg, arg2)
	local v35 = sha256(str6 .. "|key|" .. arg)
	return sha256(v35 .. "|o|" .. sha256(v35 .. "|i|" .. arg2))
end

local v35 = nil
local flag = false
local syn2 = fn9("syn")
local v36 = fn8(syn2, "crypt")
local v37 = fn8(syn2, "crypto")
local tbl10 = {}
local tbl11 = { (fn10(crypt, "base64decode")) }
local tbl12 = { (fn10(crypt, "base64_decode")) }
local tbl13 = { (fn10(fn8(crypt, "base64"), "decode")) }
local tbl14 = { (fn9("base64decode")) }
local tbl15 = { (fn9("base64_decode")) }
local tbl16 = { (fn10(fn9("base64"), "decode")) }
local tbl17 = { (fn10(v36, "base64decode")) }
local tbl18 = { (fn10(v36, "base64_decode")) }
local tbl19 = { (fn10(fn8(v36, "base64"), "decode")) }
local tbl20 = { (fn10(v37, "base64decode")) }
local tbl21 = { (fn10(v37, "base64_decode")) }
local tbl22 = { (fn10(fn8(v37, "base64"), "decode")) }
tbl10[1] = tbl11
tbl10[2] = tbl12
tbl10[3] = tbl13
tbl10[4] = tbl14
tbl10[5] = tbl15
tbl10[6] = tbl16
tbl10[7] = tbl17
tbl10[8] = tbl18
tbl10[9] = tbl19
tbl10[10] = tbl20
tbl10[11] = tbl21
tbl10[12] = tbl22

for _, v38 in v8(tbl10) do
	local v39 = v38[1]
	local rmxvd0F1dGgh, v40 = v3(v39, "Rmxvd0F1dGgh")

	if rmxvd0F1dGgh and v40 == "FlowAuth!" then
		v35 = v39
		local rmxvdwBBdXRo, v41 = v3(v39, "RmxvdwBBdXRo")
		flag = rmxvdwBBdXRo and v41 == "Flow\0Auth"
		break
	end
end

if not v35 then
	fn3("this executor does not expose a base64 decoder; it cannot run FlowAuth")
end

local function fn14()
	if not v34() then
		fn3("native hash integrity changed")
	end

	local rmxvd0F1dGgh, v38 = v3(v35, "Rmxvd0F1dGgh")

	if not rmxvd0F1dGgh or v38 ~= "FlowAuth!" then
		fn3("native decoder integrity changed")
	end

	if flag then
		local rmxvdwBBdXRo, v39 = v3(v35, "RmxvdwBBdXRo")

		if not rmxvdwBBdXRo or v39 ~= "Flow\0Auth" then
			fn3("native decoder integrity changed")
		end
	end
end

local v38 = nil
local lz4decompress = fn9("lz4decompress") or fn10(crypt, "lz4decompress")
local lz4compress = fn9("lz4compress") or fn10(crypt, "lz4compress")

if flag and v2(lz4decompress) == "function" and v2(lz4compress) == "function" then
	local v39 = v18.rep("FlowAuth\0", 64)
	local v40, v41 = v3(lz4compress, v39)

	if v40 and v2(v41) == "string" then
		local v42, v43 = v3(lz4decompress, v41, #v39)

		if v42 and v43 == v39 then
			v38 = lz4decompress
		end
	end
end

local tbl23 = {}
local tbl24 = {}

local function fn15(arg)
	if v2(arg) == "function" and not tbl24[arg] then
		tbl24[arg] = true
		tbl23[#tbl23 + 1] = arg
	end
end

local request = fn9("request")
fn15(request)
local httpRequest = fn9("http_request")
fn15(httpRequest)
local httpRequest2 = fn9("httpRequest")
fn15(httpRequest2)
local httprequest = fn9("httprequest")
fn15(httprequest)
local v39 = fn10(fn9("http"), "request")
fn15(v39)
local v40 = fn10(fn9("syn"), "request")
fn15(v40)

if #tbl23 == 0 then
	fn3("this executor does not expose an HTTP request function")
end

local function fn16(arg)
	if v2(arg) == "string" then
		return arg
	end

	if v2(arg) == "buffer" and v2(v24) == "table" then
		local v41, v42 = v3(v24.tostring, arg)
		if v41 and v2(v42) == "string" then
			return v42
		end
	end

	return nil
end

local function fn17(arg)
	local v41 = fn16(arg)
	if v41 then
		return 200, v41
	end

	if v2(arg) ~= "table" then
		return 0, nil
	end
	local n4 = v7(arg.StatusCode or arg.status_code or arg.Status or arg.status or 0) or 0
	local success = arg.Success

	if success == nil then
		success = arg.success
	end

	if n4 == 0 and success == true then
		n4 = 200
	elseif success == false and n4 < 400 then
		n4 = 500
	end

	return n4, fn16(arg.Body or arg.body or arg.ResponseBody or arg.response_body)
end

local function fn18(arg, arg2)
	if v2(arg) ~= "table" then
		return
	end

	for _, v41 in v8(arg2) do
		v3(v10, arg, v41, nil)
	end
end

local function fn19(arg, arg2)
	if v2(arg) ~= "table" then
		return arg
	end
	local tbl25 = {}

	for _, v41 in v8(arg2) do
		tbl25[v41] = arg[v41]
	end

	return tbl25
end

local function fn20(arg)
	if v2(arg) ~= "table" then
		return nil
	end

	local v41 = fn19(arg, {
		"error",
		"challenge_id",
		"challenge",
		"hash_algorithm",
		"credential_mode",
		"protocol",
		"encoding",
		"payload",
		"payload_digest",
		"payload_proof",
		"source_bytes",
		"loader_hash",
		"execution_id",
		"chunk",
	})

	v41.context = fn19(arg.context, { "project_id", "script_id", "lease_required", "start_required", "heartbeat_interval_ms" })
	v41.lease = fn19(arg.lease, { "heartbeat_token" })
	local payloadChunks = arg.payload_chunks

	if v2(payloadChunks) == "table" then
		v41.payload_chunks = { chunk_count = payloadChunks.chunk_count }
		local tokens = payloadChunks.tokens

		if v2(tokens) == "table" then
			local tokens2 = {}

			for i = 1, v20.min(#tokens, 65) do
				tokens2[i] = tokens[i]
			end

			v41.payload_chunks.tokens = tokens2
		end
	end

	return v41
end

local wait = fn10(v23, "wait") or fn9("wait")
local v41 = nil

local function fn21(arg, arg2, arg3)
	local function fn22()
		return {
			Url = arg,
			Method = "POST",
			Redirect = false,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json",
				["X-FlowAuth-Protocol"] = v6(3),
			},
			Body = arg2,
		}
	end

	local tbl25 = {}

	if v41 then
		tbl25[1] = v41
	end

	for _, v42 in v8(tbl23) do
		if v42 ~= v41 then
			tbl25[#tbl25 + 1] = v42
		end
	end

	local n4 = arg3 and v20.max(3, #tbl25) or 1
	local v42 = v21.clock()
	local n5 = 0
	local str10 = nil
	local str11

	for i = 1, n4 do
		local v43

		if i > 1 and v21.clock() - v42 >= 20 then
			str11 = v18.match(arg, "/auth/([a-z]+)") or "connection"

			if n5 > 0 then
				fn3("server returned an unreadable response during " .. str11 .. " (HTTP " .. v6(n5) .. "). Run the loader again.")
			end

			v43 = fn3
			str10 = str10 or "no request implementation responded"
			v43("could not reach the server during " .. str11 .. ": " .. v6(str10) .. ". Run the loader again.")
			return
		end

		local v44 = tbl25[(i - 1) % #tbl25 + 1]
		local v45 = fn22()
		local headers = v45.Headers
		local v46, v47 = v3(v44, v45)
		fn18(v45, { "Body", "Headers" })
		fn18(headers, { "Content-Type", "Accept", "X-FlowAuth-Protocol" })
		local v48

		if v46 then
			local v49, v50
			v49, n5, v50 = v3(fn17, v47)
			fn18(v47, { "Body", "body", "ResponseBody", "response_body" })

			if not v49 then
				v50 = nil
				n5 = 0
			end

			if v50 and #v50 > n3 + 65536 then
				fn3("server response exceeded the payload limit")
			end

			local flag2 = v50 and v50 ~= ""
			v48 = nil

			if flag2 then
				local v51

				v51, v48 = v3(function()
					return fn20(jsonDecode(httpService, v50))
				end)

				local flag3 = v51 and v2(v48) == "table"
				local v52 = nil

				if not flag3 then
					v48 = v52
				end
			end

			str10 = "invalid response"
		else
			v48 = nil
			n5 = 0
			str10 = "native request failed"
		end

		local flag2 = not v46 or n5 == 0 or n5 == 408 or n5 == 500 or n5 == 502 or n5 == 503 or n5 == 504 or n5 >= 520 and n5 <= 524 or n5 >= 200 and n5 < 300 and not v48
		if v48 and not flag2 then
			v41 = v44
			return n5, v48
		end

		if not arg3 or not flag2 or i == n4 or v21.clock() - v42 >= 20 then
			if v48 then
				return n5, v48
			end
			str11 = v18.match(arg, "/auth/([a-z]+)") or "connection"

			if n5 > 0 then
				fn3("server returned an unreadable response during " .. str11 .. " (HTTP " .. v6(n5) .. "). Run the loader again.")
			end

			v43 = fn3
			str10 = str10 or "no request implementation responded"
			v43("could not reach the server during " .. str11 .. ": " .. v6(str10) .. ". Run the loader again.")
			return
		end

		if v2(wait) == "function" then
			v3(wait, v20.min(0.35 * i, 0.7))
		end
	end

	str11 = v18.match(arg, "/auth/([a-z]+)") or "connection"

	if n5 > 0 then
		fn3("server returned an unreadable response during " .. str11 .. " (HTTP " .. v6(n5) .. "). Run the loader again.")
	end

	fn3("could not reach the server during " .. str11 .. ": " .. v6(str10 or "no request implementation responded") .. ". Run the loader again.")
end

local tbl25 = {
	invalid_key = "The script key is invalid. Copy a fresh loader from Discord.",
	key_revoked = "The script key was revoked.",
	key_paused = "The script key is paused.",
	key_expired = "The script key expired.",
	hwid_mismatch = "This key is linked to another device. Reset its HWID in Discord, then run the loader again.",
	blacklisted = "This device is blocked from the project.",
	premium_required = "This script requires a valid project key.",
	no_script_for_game = "No script is configured for this experience.",
	nonce_reused = "This loader request was already used. Run it again.",
	challenge_rejected = "This authentication challenge expired or was already used. Run the loader again.",
	instance_limit_reached = "This key has reached its active execution limit. Close the other session and wait a minute.",
	incompatible_executor = "This executor is unsupported. Use a reliable or medium-tier executor.",
	payload_too_large = "This protected script exceeds the loader size limit.",
	payload_unavailable = "The protected payload handoff expired. Run the loader again.",
	rate_limited = "Too many authorization attempts. Wait a minute and try again.",
}

local function fn22(arg, arg2, arg3)
	arg2 = v2(arg2) == "string" and v18.match(arg2, "^[a-z][a-z0-9_]*$") and arg2 or "http_" .. v6(arg3)
	v5(arg .. ": [FlowAuthError:" .. arg2 .. "] " .. (tbl25[arg2] or arg2), 0)
end

local function fn23()
	local v42 = v18.char(95, 98, 115, 100, 97, 116, 97, 48)
	local v43 = v9(v27, v42) or v9(v16, v42)

	if v2(v43) ~= "table" or v2(v43[1]) ~= "string" then
		fn3("loader payload is missing; run the loader script from FlowAuth")
	end

	if v2(v27) == "table" then
		v3(v10, v27, v42, nil)
	end

	if v2(v16) == "table" then
		v3(v10, v16, v42, nil)
	end

	local v44 = v43[1]
	local n4 = v43[2] % 4294967296
	local v45 = v19.create(#v44)

	for i = 1, #v44 do
		local v46 = v22.bxor(n4, v22.lshift(n4, 13) % 4294967296)
		local v47 = v22.bxor(v46, v22.rshift(v46, 17))
		n4 = v22.bxor(v47, v22.lshift(v47, 5) % 4294967296)
		v45[i] = v18.char(v22.bxor(v18.byte(v44, i), n4 % 256))
	end

	local v46 = v19.concat(v45)
	local tbl26 = {}
	local n5 = 1

	while n5 <= #v46 do
		local v47 = v18.find(v46, ":", n5, true)

		if v47 then
			local v48 = v7(v18.sub(v46, n5, v47 - 1))

			if v48 then
				tbl26[#tbl26 + 1] = v18.sub(v46, v47 + 1, v47 + v48)
				n5 = v47 + v48 + 1
				continue
			end
		end

		break
	end

	return tbl26
end

local function fn24(arg)
	if v2(arg) ~= "string" then
		arg = v9(v27, "script_key")
	end

	if v2(arg) ~= "string" then
		arg = v9(v16, "script_key")
	end

	if v2(v27) == "table" then
		v3(v10, v27, "script_key", nil)
	end

	if v2(v16) == "table" then
		v3(v10, v16, "script_key", nil)
	end

	if v2(arg) ~= "string" then
		return ""
	end
	return (v18.gsub(arg, "^%s*(.-)%s*$", "%1"))
end

local function fn25(arg)
	if v2(arg) ~= "string" then
		return nil
	end
	local v42 = v18.gsub(v18.gsub(arg, "^%s+", ""), "%s+$", "")
	local v43 = v18.gsub(v18.lower(v42), "[%s_-]+", "")
	if #v42 < 8 or #v42 > 512 or v18.find(v42, "[^ -~]") ~= nil or v43 == "none" or v43 == "nil" or v43 == "null" or v43 == "undefined" or v43 == "unknown" or v43 == "na" or v18.match(v43, "^0+$") ~= nil or v18.match(v43, "^f+$") ~= nil then
		return nil
	end
	return v42
end

local function fn26()
	local getHwid = v2(gethwid) == "function" and gethwid or fn9("get_hwid")
	local v42 = nil

	if v2(getHwid) == "function" then
		local v43, v44 = v3(getHwid)
		v42 = nil

		if v43 then
			v42 = fn25(v44)
		end
	end

	local v43, v44 = v3(getClientId, rbxAnalyticsService)
	local v45 = nil

	if v43 then
		v45 = fn25(v44)
	end

	local v46 = v45 or v42

	if not v46 then
		fn3("could not obtain a stable device identifier")
	end

	local tbl26 = {}

	if v45 and v42 and v42 ~= v46 then
		tbl26[#tbl26 + 1] = v42
	end

	if v45 then
		v3(function()
			local localPlayer = getService(v17, "Players").LocalPlayer
			localPlayer = localPlayer and v7(localPlayer.UserId) or 0

			if localPlayer > 0 then
				tbl26[#tbl26 + 1] = v46 .. ":" .. v6(v20.floor(localPlayer))
			end
		end)
	end

	return v46, tbl26
end

local function fn27(arg)
	fn14()
	local v42 = v21.clock()
	local v43 = fn23()
	local str10 = v43[1] or ""
	local str11 = v43[2] or ""
	local str12 = v43[3] or ""

	if str10 == "" or str11 == "" or str12 == "" then
		fn3("loader payload is incomplete; copy a fresh loader")
	end

	fn4("FlowAuth", "[1/3] Preparing runtime...")
	local flag2 = fn24(arg)
	local v44, v45 = fn26()
	local str13 = flag2 ~= "" and sha256(str5 .. "|" .. flag2) or ""
	fn4("FlowAuth", "[2/3] Connecting to server...")

	local v46, v47 = fn21(str11 .. str, jsonEncode(httpService, {
		protocol = n,
		hash_algorithm = str9,
		hwid = v44,
		loader_hash = str10,
		key_fingerprint = str13,
		[v18.char(108, 97, 117, 110, 99, 104, 95, 116, 105, 99, 107, 101, 116)] = str12,
	}), true)

	fn14()

	if v46 < 200 or v46 >= 300 or v47.error then
		fn22("FlowAuth", v47.error, v46)
	end

	if v2(v47.challenge_id) ~= "string" or v2(v47.challenge) ~= "string" then
		fn3("server returned an invalid authentication challenge")
	end

	if v47.hash_algorithm ~= str9 then
		fn3("server selected an unexpected hash algorithm")
	end

	local credentialMode = v47.credential_mode or str13 ~= "" and "key" or "loader"

	if credentialMode ~= "key" and credentialMode ~= "loader" or flag2 ~= "" and credentialMode ~= "key" or flag2 == "" and credentialMode ~= "loader" then
		fn3("server changed the credential mode; omit the key for a keyless loader")
	end

	flag2 = credentialMode == "key" and flag2 or str10
	local v48 = v18.sub(sha256(v6(v21.clock()) .. "|" .. v6(v21.time()) .. "|" .. generateGUID(httpService, false) .. "|" .. v44), 1, 48)
	local v49 = v6(v17.PlaceId or 0)
	local v50 = v6(v17.GameId or 0)
	local v51 = v6(v17.CreatorId or 0)
	local v52 = fn6(v17.CreatorType, 32)
	local str14 = ""

	if v2(v15) == "function" then
		local v53, v54 = v3(v15)

		if v53 then
			str14 = fn6(v54, 64)
		end
	end

	local flag3 = v38 ~= nil
	local tbl26 = {}
	local v53 = v6(3)
	local challengeId = v47.challenge_id
	local challenge = v47.challenge
	local str15 = flag3 and "1" or "0"
	tbl26[1] = "flowauth-loader-v3-auth-proof"
	tbl26[2] = v53
	tbl26[3] = challengeId
	tbl26[4] = challenge
	tbl26[5] = str13
	tbl26[6] = v44
	tbl26[7] = v48
	tbl26[8] = v49
	tbl26[9] = v50
	tbl26[10] = v51
	tbl26[11] = v52
	tbl26[12] = str10
	tbl26[13] = str14
	tbl26[14] = str15

	if #v45 > 0 then
		tbl26[#tbl26 + 1] = str4
		tbl26[#tbl26 + 1] = v6(#v45)

		for _, v54 in v8(v45) do
			tbl26[#tbl26 + 1] = v54
		end
	end

	if str9 ~= "sha256" then
		tbl26[#tbl26 + 1] = str7
		tbl26[#tbl26 + 1] = str9
	end

	tbl26[#tbl26 + 1] = str8
	tbl26[#tbl26 + 1] = "1"

	local v54, v55 = fn21(str11 .. str2, jsonEncode(httpService, {
		protocol = n,
		hash_algorithm = str9,
		key_fingerprint = str13,
		challenge_id = v47.challenge_id,
		proof = fn13(flag2, fn7(tbl26)),
		hwid = v44,
		nonce = v48,
		place_id = v49,
		game_id = v50,
		creator_id = v51,
		creator_type = v52,
		loader_hash = str10,
		executor = str14,
		supports_lz4 = flag3,
		supports_chunked_payload = true,
		hwid_aliases = v45,
	}))

	if v54 < 200 or v54 >= 300 or v55.error then
		fn22("FlowAuth", v55.error, v54)
	end

	fn14()

	if v55.protocol ~= n or v55.hash_algorithm ~= str9 then
		fn3("server returned an unsupported payload format")
	end

	local sourceBytes = v55.source_bytes
	local payloadDigest = v55.payload_digest
	local n4 = #sha256("")

	if v2(sourceBytes) ~= "number" or sourceBytes < 1 or sourceBytes > n2 or sourceBytes % 1 ~= 0 or v2(payloadDigest) ~= "string" or #payloadDigest ~= n4 or not v18.match(payloadDigest, "^[a-f0-9]+$") then
		fn3("server returned invalid payload integrity metadata")
	end

	local context = v55.context

	if v55.loader_hash ~= str10 or v2(v55.execution_id) ~= "string" or #v55.execution_id < 1 or #v55.execution_id > 128 or v2(context) ~= "table" then
		fn3("server returned an unbound payload")
	end

	local lease = v2(v55.lease) == "table" and v55.lease or {}
	local payloadProof = v55.payload_proof
	local flag4 = v2(payloadProof) ~= "string" or #payloadProof ~= n4

	if not flag4 then
		local v56 = fn13
		local v57 = fn7
		local tbl27 = {}
		local v58 = v6(3)
		local v59 = str9
		local challengeId2 = v47.challenge_id
		local executionId = v55.execution_id
		local v60 = v6(v55.encoding)
		local v61 = v6(sourceBytes)
		local v62 = v6(context.project_id)
		local v63 = v6(context.script_id)
		local v64 = v6(context.lease_required)
		local v65 = v6(context.start_required)
		local v66 = v6(context.heartbeat_interval_ms)
		local heartbeatToken = lease.heartbeat_token or ""
		local v67 = table.pack(v6(heartbeatToken))
		tbl27[1] = "flowauth-loader-v3-payload-proof-v1"
		tbl27[2] = v58
		tbl27[3] = v59
		tbl27[4] = challengeId2
		tbl27[5] = v48
		tbl27[6] = executionId
		tbl27[7] = str10
		tbl27[8] = v60
		tbl27[9] = v61
		tbl27[10] = payloadDigest
		tbl27[11] = v62
		tbl27[12] = v63
		tbl27[13] = v64
		tbl27[14] = v65
		tbl27[15] = v66

		do
			local values = table.pack(table.unpack(v67, 1, v67.n))
			table.move(values, 1, values.n, 16, tbl27)
		end

		flag4 = payloadProof ~= v56(flag2, v57(tbl27))
	end

	if flag4 then
		fn3("payload response authentication failed")
	end

	local payload = v55.payload

	if v2(payload) ~= "string" then
		local payloadChunks = v55.payload_chunks
		local tokens = v2(payloadChunks) == "table" and payloadChunks.tokens or nil
		local n5 = v2(tokens) == "table" and #tokens or 0

		if n5 < 1 or n5 > 64 or v7(payloadChunks.chunk_count) ~= n5 then
			fn3("server returned an unsupported payload format")
		end

		local v56 = v19.create(n5)
		local n6 = 0

		for k, token in v8(tokens) do
			if v2(token) ~= "string" or #token ~= 43 or v18.match(token, "^[A-Za-z0-9_-]+$") == nil then
				fn3("server returned an invalid payload handoff")
			end

			local v57, v58 = fn21(str11 .. str3, jsonEncode(httpService, { protocol = n, token = token }))

			if v57 < 200 or v57 >= 300 or v58.error then
				fn22("FlowAuth", v58.error, v57)
			end

			if v58.protocol ~= n or v2(v58.chunk) ~= "string" then
				fn3("server returned an invalid payload handoff")
			end

			n6 += #v58.chunk

			if n6 > n3 then
				fn3("payload exceeded its size limit")
			end

			v56[k] = v58.chunk
			tokens[k] = false
		end

		payload = v19.concat(v56)
	end

	fn14()

	if #payload > n3 or sha256(payload) ~= payloadDigest then
		fn3("payload failed its integrity check")
	end

	local v56, v57 = v3(v35, payload)

	if not v56 or v2(v57) ~= "string" then
		fn3("payload could not be decoded")
	end

	local v58

	if v55.encoding == "lz4+base64" then
		if not v38 then
			fn3("server sent a compressed payload this executor cannot decode")
		end

		local v59
		v59, v58 = v3(v38, v57, sourceBytes)

		if not v59 or v2(v58) ~= "string" or #v58 ~= sourceBytes then
			fn3("payload could not be decompressed")
		end
	elseif v55.encoding ~= "base64" then
		fn3("server returned an unsupported payload encoding")
		v58 = v57
	else
		v58 = v57
	end

	if #v58 ~= sourceBytes then
		fn3("payload decoded length mismatch")
	end

	fn14()
	v27.FLOW_PROJECT_ID = context.project_id
	v27.FLOW_SCRIPT_ID = context.script_id
	v27.FLOW_EXECUTION_ID = v55.execution_id
	local v59, v60 = v25(v58, "=FlowAuth")

	if not v59 then
		fn3("script compilation failed: " .. v6(v60))
	end

	fn4("FlowAuth", "[3/3] Successfully authenticated!")
	fn4("FlowAuth", v18.format("Authenticated in %.3fs", v21.clock() - v42))
	return v59()
end

local v42 = v

local v43 = v19.pack(v4(function()
	v42 = nil
	return fn27(v42)
end, function(arg)
	return v6(arg)
end))

if not v43[1] then
	local v44 = v18.gsub(v6(v43[2] or "FlowAuth stopped"), "[\r\n]+", " ")
	local v45

	if #v44 > 600 then
		v45 = v18.sub(v44, 1, 600)
	else
		v45 = v44
	end

	v12("[FlowAuth] " .. v45)
	v5(v45, 0)
end

return v19.unpack(v43, 2, v43.n)
