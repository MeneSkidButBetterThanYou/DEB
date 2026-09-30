-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local n = nil
local n2 = 5
local tbl = nil
local n3 = nil
local v = nil
local n4 = nil
local n5 = nil
local n6 = nil
local str = nil
local activeKey = nil
local n7 = nil
local n8 = nil
local n9 = nil
local n10 = nil
local n11 = nil
local n12 = nil
local n13 = nil
local body

while true do
	if not (n2 <= 10) then
		if n2 <= 16 then
			if n2 <= 13 then
				if n2 <= 11 then
					local v2 = n3(n4 + n4 // 65536, 2246822507)
					v = n3(v2 + v2 // 256, 3266489909)
					n2 = 10
					n3 = 0
					tbl = { tbl, nil, 0, 1, 8 }
				elseif n2 <= 12 then
					n4 = (n12 + bit32.bxor(n7, n13) + bit32.bxor(n8, 2933973557) + bit32.bxor(n9, 2372129226) + bit32.bxor(n10, 1810284895) + bit32.bxor(n11, 1248440564)) % 4294967296
					n7 = n4 % 4294967296
					local v2 = table.pack(bit32.band(n7 + 450186175, 4294967295))
					local v3 = table.pack(bit32.band(v2[1], 65535))
					n8 = 1336427424 + bit32.band(2998 * v3[1] + bit32.lshift(bit32.band(2998 * bit32.rshift(v2[1], 16) + 5413 * v3[1], 65535), 16), 4294967295) % 4294967296
					n2 = 17
					n9 = 3585468564
					n10 = 3840300656
					n11 = 450186175
				else
					n4 = n3(n4 + string.byte(v, n5), 16777619)
					n2 = 18
				end
			elseif n2 <= 14 then
				n3 = (n3 - v) % n
				n2 = 0
			elseif n2 <= 15 then
				n2 = activeKey and 4 or 2
			else
				n3 = n4 + n5
				n2 = 10
			end
		elseif n2 <= 19 then
			if n2 <= 17 then
				local v2 = bit32.band(n10, n7 + n11)
				local v3 = table.pack(bit32.band(n9, 4294967295))
				local v4 = table.pack(bit32.band(v2, 4294967295))
				local v5 = table.pack(bit32.band(v3[1], 65535))
				local v6 = table.pack(bit32.rshift(v3[1], 16))
				local v7 = table.pack(bit32.band(v4[1], 65535))
				local n14 = bit32.band(v5[1] * v7[1] + bit32.lshift(bit32.band(v5[1] * bit32.rshift(v4[1], 16) + v6[1] * v7[1], 65535), 16), 4294967295) % 4294967296
				local v8 = table.pack(bit32.band(bit32.bxor(3840300656, n7 + 450186175), 4294967295))
				local v9 = table.pack(bit32.band(v8[1], 65535))
				n5 = (n8 + n14 + bit32.band(62539 * v9[1] + bit32.lshift(bit32.band(62539 * bit32.rshift(v8[1], 16) + 60122 * v9[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
				n7 = n4 % 4294967296
				local v10 = table.pack(bit32.band(n7 + 187200106, 4294967295))
				local v11 = table.pack(bit32.band(v10[1], 65535))
				n8 = 3360982702 + bit32.band(3485 * v11[1] + bit32.lshift(bit32.band(3485 * bit32.rshift(v10[1], 16) + 2088 * v11[1], 65535), 16), 4294967295) % 4294967296
				n10 = bit32.band(3577313542, n7 + 187200106)
				n2 = 20
				n9 = 4021281990
			elseif n2 <= 18 then
				local v2 = tbl[2]
				local v3 = tbl[4]
				local n14 = tbl[3] + v2
				local flag = v2 <= 0
				local flag2 = not flag
				local flag3 = n14 >= v3
				local flag4 = n14 <= v3
				flag3 = flag and flag3
				flag3 = flag3 or flag2 and flag4
				tbl[3] = n14

				if flag3 then
					n2 = 13
					n5 = n14
				else
					n2 = 22
				end
			else
				n5 = n3 - 48
				n2 = 7
			end
		elseif n2 <= 20 then
			local v2 = table.pack(bit32.band(n9, 4294967295))
			local v3 = table.pack(bit32.band(n10, 4294967295))
			local v4 = table.pack(bit32.band(v2[1], 65535))
			local v5 = table.pack(bit32.rshift(v2[1], 16))
			local v6 = table.pack(bit32.band(v3[1], 65535))
			local n14 = bit32.band(v4[1] * v6[1] + bit32.lshift(bit32.band(v4[1] * bit32.rshift(v3[1], 16) + v5[1] * v6[1], 65535), 16), 4294967295) % 4294967296
			local v7 = table.pack(bit32.band(bit32.bxor(3577313542, n7 + 187200106), 4294967295))
			local v8 = table.pack(bit32.band(v7[1], 65535))
			n6 = (n8 + n14 + bit32.band(62052 * v8[1] + bit32.lshift(bit32.band(62052 * bit32.rshift(v7[1], 16) + 63447 * v8[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
			n7 = n4 % 4294967296
			local v9 = table.pack(bit32.band(n7 + 439207601, 4294967295))
			local v10 = table.pack(bit32.band(v9[1], 65535))
			n8 = 1392451889 + bit32.band(28075 * v10[1] + bit32.lshift(bit32.band(28075 * bit32.rshift(v9[1], 16) + 13539 * v10[1], 65535), 16), 4294967295) % 4294967296
			local v11 = table.pack(bit32.band(bit32.bor(3858593939, n7 + 439207601), 4294967295))
			local v12 = table.pack(bit32.band(v11[1], 65535))
			n9 = bit32.band(9386 * v12[1] + bit32.lshift(bit32.band(9386 * bit32.rshift(v11[1], 16) + 38457 * v12[1], 65535), 16), 4294967295) % 4294967296
			n2 = 8
			n10 = 887319980
		elseif n2 <= 21 then
			activeKey = getgenv().Radiant.ACTIVE_KEY
			n2 = 15
		else
			tbl = tbl[5]
			n2 = 11
		end

		continue
	end

	if not (n2 <= 4) then
		if n2 <= 7 then
			if n2 <= 5 then
				n = 4294967296

				n3 = function(arg, arg2)
					local n14 = 0

					while n14 <= 0 do
						local n15 = arg % n
						arg = (n15 % 65536 * arg2 + n15 // 65536 * arg2 % 65536 * 65536) % n
						n14 = 1
					end

					return arg
				end

				v = LUAW_DATA[8]
				body = http_request
				n4 = {}
				local v2 = ACTIVE_KEY

				if v2 then
					n2 = 15
					n5 = "Url"
					n6 = "http://api.imt-hub.xyz/gate?v=b&s="
					str = "&k="
					activeKey = v2
				else
					n2 = 21
					n5 = "Url"
					n6 = "http://api.imt-hub.xyz/gate?v=b&s="
					str = "&k="
				end
			elseif n2 <= 6 then
				tbl = tbl[1]
				n2 = 14
			else
				n2 = n5 and 16 or 9
			end
		elseif n2 <= 8 then
			local v2 = bit32.bxor(3858593939, n7 + 439207601)
			local v3 = table.pack(bit32.band(n10, 4294967295))
			local v4 = table.pack(bit32.band(v2, 4294967295))
			local v5 = table.pack(bit32.band(v3[1], 65535))
			local v6 = table.pack(bit32.rshift(v3[1], 16))
			local v7 = table.pack(bit32.band(v4[1], 65535))
			local n14 = (n8 + n9 + bit32.band(v5[1] * v7[1] + bit32.lshift(bit32.band(v5[1] * bit32.rshift(v4[1], 16) + v6[1] * v7[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
			n7 = n4 % 4294967296
			local v8 = table.pack(bit32.band(n7 + 958146300, 4294967295))
			local v9 = table.pack(bit32.band(v8[1], 65535))
			n8 = 2490660171 + bit32.band(20951 * v9[1] + bit32.lshift(bit32.band(20951 * bit32.rshift(v8[1], 16) + 32168 * v9[1], 65535), 16), 4294967295) % 4294967296
			local v10 = table.pack(bit32.band(bit32.band(49099181, n7 + 958146300), 4294967295))
			local v11 = table.pack(bit32.band(v10[1], 65535))
			n9 = bit32.band(23634 * v11[1] + bit32.lshift(bit32.band(23634 * bit32.rshift(v10[1], 16) + 1199 * v11[1], 65535), 16), 4294967295) % 4294967296
			n2 = 1
			n10 = 2186784298
			n11 = 49099181
			n12 = 958146300
			n4 = n14
		elseif n2 <= 9 then
			n5 = n3 - 87
			n2 = 16
		else
			local v2 = tbl[4]
			local v3 = tbl[5]
			local n14 = tbl[3] + v2
			local flag = v2 <= 0
			local flag2 = not flag
			local flag3 = n14 >= v3
			local flag4 = n14 <= v3
			flag = flag and flag3
			flag4 = flag2 and flag4
			flag4 = flag or flag4
			tbl[3] = n14

			if flag4 then
				n2 = 3
				n4 = n14
			else
				n2 = 6
			end
		end

		continue
	end

	if not (n2 <= 1) then
		if n2 <= 2 then
			n2 = 4
			activeKey = ""
		elseif n2 <= 3 then
			local v2 = string.byte(body, n4)
			n4 = n3 * 16
			local flag = v2 < 58

			if flag then
				n2 = 19
				n3 = v2
			else
				n2 = 7
				n3 = v2
				n5 = flag
			end
		else
			n4[n5] = n6 .. v .. str .. activeKey
			n4.Method = "GET"
			body = body(n4).Body
			n7 = 1939555844
			n8 = 1043568767
			n9 = 616334525
			n10 = 1427062209
			n11 = 239906202
			n12 = 1753771072
			n2 = 12
			n13 = 3495817888
		end

		continue
	end

	if not (n2 <= 0) then
		local v2 = bit32.bxor(n11, n7 + n12)
		local v3 = table.pack(bit32.band(n10, 4294967295))
		local v4 = table.pack(bit32.band(v2, 4294967295))
		local v5 = table.pack(bit32.band(v3[1], 65535))
		local v6 = table.pack(bit32.rshift(v3[1], 16))
		local v7 = table.pack(bit32.band(v4[1], 65535))
		n4 = (1 - 2 * n5) * (1 + (n4 * 67108864 + (n8 + n9 + bit32.band(v5[1] * v7[1] + bit32.lshift(bit32.band(v5[1] * bit32.rshift(v4[1], 16) + v6[1] * v7[1], 65535), 16), 4294967295) % 4294967296) % 4294967296) / 4503599627370496) * 2 ^ (n6 - 1023)
		n2 = 18
		tbl = { nil, 1, 0, #v + 0, tbl }
		continue
	end

	break
end

return n3
