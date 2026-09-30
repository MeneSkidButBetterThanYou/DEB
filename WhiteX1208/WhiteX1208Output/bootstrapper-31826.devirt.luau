-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local n = nil
local n2 = 22
local tbl = nil
local n3 = nil
local v = nil
local body = nil
local n4 = nil
local str = nil
local n5 = nil
local str2 = nil
local activeKey = nil
local n6 = nil
local n7 = nil
local n8 = nil
local n9 = nil
local n10 = nil
local n11 = nil

while true do
	if not (n2 <= 10) then
		if n2 <= 16 then
			if n2 <= 13 then
				if n2 <= 11 then
					activeKey = getgenv().Radiant.ACTIVE_KEY
					n2 = 15
				elseif n2 <= 12 then
					local v2 = table.pack(bit32.band(n8, 4294967295))
					local v3 = table.pack(bit32.band(n9, 4294967295))
					local v4 = table.pack(bit32.band(v2[1], 65535))
					local v5 = table.pack(bit32.rshift(v2[1], 16))
					local v6 = table.pack(bit32.band(v3[1], 65535))
					local n12 = bit32.band(v4[1] * v6[1] + bit32.lshift(bit32.band(v4[1] * bit32.rshift(v3[1], 16) + v5[1] * v6[1], 65535), 16), 4294967295) % 4294967296
					local v7 = table.pack(bit32.band(bit32.bxor(2797400715, n6 + 3127798967), 4294967295))
					local v8 = table.pack(bit32.band(v7[1], 65535))
					local n13 = (n7 + n12 + bit32.band(25319 * v8[1] + bit32.lshift(bit32.band(25319 * bit32.rshift(v7[1], 16) + 56834 * v8[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
					n6 = n4 % 4294967296
					local v9 = table.pack(bit32.band(n6 + 3483871070, 4294967295))
					local v10 = table.pack(bit32.band(v9[1], 65535))
					n7 = 1743066875 + bit32.band(4507 * v10[1] + bit32.lshift(bit32.band(4507 * bit32.rshift(v9[1], 16) + 31914 * v10[1], 65535), 16), 4294967295) % 4294967296
					local v11 = table.pack(bit32.band(bit32.bor(n6 + 3483871070, 3178796577), 4294967295))
					local v12 = table.pack(bit32.band(v11[1], 65535))
					n8 = bit32.band(56522 * v12[1] + bit32.lshift(bit32.band(56522 * bit32.rshift(v11[1], 16) + 1707 * v12[1], 65535), 16), 4294967295) % 4294967296
					n2 = 2
					n9 = 2091520412
					n10 = 3178796577
					n4 = n13
				else
					n4 = n3(n4 + string.byte(v, str), 16777619)
					n2 = 6
				end
			elseif n2 <= 14 then
				local v2 = string.byte(body, n4)
				n4 = n3 * 16
				local flag = v2 < 58

				if flag then
					n2 = 0
					n3 = v2
				else
					n2 = 18
					n3 = v2
					str = flag
				end
			elseif n2 <= 15 then
				n2 = activeKey and 1 or 10
			else
				local v2 = tbl[2]
				local v3 = tbl[4]
				local n12 = tbl[1] + v2
				local flag = v2 <= 0
				local flag2 = not flag
				local flag3 = n12 >= v3
				local flag4 = n12 <= v3
				flag3 = flag and flag3
				flag3 = flag3 or flag2 and flag4
				tbl[1] = n12

				if flag3 then
					n2 = 14
					n4 = n12
				else
					n2 = 21
				end
			end
		elseif n2 <= 19 then
			if n2 <= 17 then
				local v2 = table.pack(bit32.band(n9, 4294967295))
				local v3 = table.pack(bit32.band(v2[1], 65535))
				local n12 = bit32.band(v3[1] * 65535 + bit32.lshift(bit32.band(v3[1] * 65535 + bit32.rshift(v2[1], 16) * 65535, 65535), 16), 4294967295) % 4294967296
				local v4 = bit32.bxor(3635759388, n6 + 3953417790)
				local v5 = table.pack(bit32.band(bit32.bnot(v4), 4294967295))
				local v6 = table.pack(bit32.band(v5[1], 65535))
				n5 = (n7 + n8 + n12 + bit32.band(25736 * v6[1] + bit32.lshift(bit32.band(25736 * bit32.rshift(v5[1], 16) + 47285 * v6[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
				n6 = n4 % 4294967296
				local v7 = table.pack(bit32.band(n6 + 3127798967, 4294967295))
				local v8 = table.pack(bit32.band(v7[1], 65535))
				n7 = 1850663198 + bit32.band(40218 * v8[1] + bit32.lshift(bit32.band(40218 * bit32.rshift(v7[1], 16) + 8701 * v8[1], 65535), 16), 4294967295) % 4294967296
				n9 = bit32.band(n6 + 3127798967, 2797400715)
				n2 = 12
				n8 = 3154429388
			elseif n2 <= 18 then
				n2 = str and 9 or 4
			else
				local v2 = n3(n4 + n4 // 65536, 2246822507)
				v = n3(v2 + v2 // 256, 3266489909)
				n2 = 16
				n3 = 0
				tbl = { 0, 1, tbl, 8, nil }
			end
		elseif n2 <= 20 then
			n4 = (n10 + n11 + bit32.bxor(n6, 2933973557) + bit32.bxor(n7, 2372129226) + bit32.bxor(n8, 1810284895) + bit32.bxor(n9, 1248440564)) % 4294967296
			n6 = n4 % 4294967296
			local v2 = table.pack(bit32.band(n6 + 2254034635, 4294967295))
			local v3 = table.pack(bit32.band(v2[1], 65535))
			n7 = 2174807080 + bit32.band(50508 * v3[1] + bit32.lshift(bit32.band(50508 * bit32.rshift(v2[1], 16) + 45676 * v3[1], 65535), 16), 4294967295) % 4294967296
			n10 = n6 + 2254034635
			n2 = 8
			n8 = 2602988904
			n9 = 1936377230
		elseif n2 <= 21 then
			tbl = tbl[3]
			n2 = 7
		else
			n = 4294967296

			n3 = function(arg, arg2)
				local n12 = 1

				while not (n12 <= 0) do
					local n13 = arg % n
					arg = (n13 % 65536 * arg2 + n13 // 65536 * arg2 % 65536 * 65536) % n
					n12 = 0
				end

				return arg
			end

			v = LUAW_DATA[8]
			body = http_request
			n4 = {}
			local v2 = ACTIVE_KEY

			if v2 then
				n2 = 15
				str = "Url"
				n5 = "https://api.imt-hub.xyz/gate?v=b&s="
				str2 = "&k="
				activeKey = v2
			else
				n2 = 11
				str = "Url"
				n5 = "https://api.imt-hub.xyz/gate?v=b&s="
				str2 = "&k="
			end
		end

		continue
	end

	if not (n2 <= 4) then
		if n2 <= 7 then
			if n2 <= 5 then
				tbl = tbl[2]
				n2 = 19
			elseif n2 <= 6 then
				local v2 = tbl[3]
				local v3 = tbl[5]
				local n12 = tbl[1] + v2
				local flag = v2 <= 0
				local flag2 = not flag
				local flag3 = n12 >= v3
				local flag4 = n12 <= v3
				flag3 = flag and flag3
				flag3 = flag3 or flag2 and flag4
				tbl[1] = n12

				if flag3 then
					n2 = 13
					str = n12
				else
					n2 = 5
				end
			else
				n3 = (n3 - v) % n
				n2 = 3
			end
		elseif n2 <= 8 then
			local v2 = bit32.band(n9, n10)
			local v3 = table.pack(bit32.band(n8, 4294967295))
			local v4 = table.pack(bit32.band(v2, 4294967295))
			local v5 = table.pack(bit32.band(v3[1], 65535))
			local v6 = table.pack(bit32.rshift(v3[1], 16))
			local v7 = table.pack(bit32.band(v4[1], 65535))
			local n12 = bit32.band(v5[1] * v7[1] + bit32.lshift(bit32.band(v5[1] * bit32.rshift(v4[1], 16) + v6[1] * v7[1], 65535), 16), 4294967295) % 4294967296
			local v8 = table.pack(bit32.band(bit32.bxor(1936377230, n6 + 2254034635), 4294967295))
			local v9 = table.pack(bit32.band(v8[1], 65535))
			str = (n7 + n12 + bit32.band(15029 * v9[1] + bit32.lshift(bit32.band(15029 * bit32.rshift(v8[1], 16) + 19859 * v9[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
			n6 = n4 % 4294967296
			local v10 = table.pack(bit32.band(n6 + 3953417790, 4294967295))
			local v11 = table.pack(bit32.band(v10[1], 65535))
			n7 = 1705046020 + bit32.band(39799 * v11[1] + bit32.lshift(bit32.band(39799 * bit32.rshift(v10[1], 16) + 18250 * v11[1], 65535), 16), 4294967295) % 4294967296
			local v12 = table.pack(bit32.band(bit32.bor(n6 + 3953417790, 3635759388), 4294967295))
			local v13 = table.pack(bit32.band(v12[1], 65535))
			n8 = bit32.band(51474 * v13[1] + bit32.lshift(bit32.band(51474 * bit32.rshift(v12[1], 16) + 29034 * v13[1], 65535), 16), 4294967295) % 4294967296
			n2 = 17
			n9 = 1196071800
		elseif n2 <= 9 then
			n3 = n4 + str
			n2 = 16
		else
			n2 = 1
			activeKey = ""
		end

		continue
	end

	if n2 <= 1 then
		if n2 <= 0 then
			str = n3 - 48
			n2 = 18
		else
			n4[str] = n5 .. v .. str2 .. activeKey
			n4.Method = "GET"
			body = body(n4).Body
			n6 = 4289734708
			n7 = 2911573496
			n8 = 1520632387
			n9 = 3861692610
			n10 = 4028180267
			n11 = 2905802259
			n2 = 20
		end

		continue
	end

	if n2 <= 2 then
		local v2 = bit32.bxor(n10, n6 + 3483871070)
		local v3 = table.pack(bit32.band(n9, 4294967295))
		local v4 = table.pack(bit32.band(v2, 4294967295))
		local v5 = table.pack(bit32.band(v3[1], 65535))
		local v6 = table.pack(bit32.rshift(v3[1], 16))
		local v7 = table.pack(bit32.band(v4[1], 65535))
		n4 = (1 - 2 * str) * (1 + (n4 * 67108864 + (n7 + n8 + bit32.band(v5[1] * v7[1] + bit32.lshift(bit32.band(v5[1] * bit32.rshift(v4[1], 16) + v6[1] * v7[1], 65535), 16), 4294967295) % 4294967296) % 4294967296) / 4503599627370496) * 2 ^ (n5 - 1023)
		n2 = 6
		tbl = { 0, tbl, 1, nil, #v + 0 }
		continue
	end

	if not (n2 <= 3) then
		str = n3 - 87
		n2 = 9
		continue
	end

	break
end

return n3
