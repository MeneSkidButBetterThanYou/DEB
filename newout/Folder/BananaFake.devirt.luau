-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local n = nil
local n2 = 11
local tbl = nil
local str = nil
local str2 = nil
local str3 = nil
local n3 = nil
local n4 = nil
local fn = nil
local n5 = nil
local n6 = nil
local n7 = nil
local n8 = nil
local n9 = nil
local n10 = nil
local n11 = nil
local n12 = nil
local n13 = nil
local n14 = nil
local n15 = nil

while true do
	if not (n2 <= 19) then
		if n2 <= 29 then
			if n2 <= 24 then
				if n2 <= 21 then
					if n2 <= 20 then
						n5 = n3 - 87
						n2 = 16
					else
						n2 = n5 and 16 or 20
					end
				elseif n2 <= 22 then
					n4 = (1 - 2 * fn) * (1 + n4) * 2 ^ (n5 - 1023)

					fn = function(arg, arg2)
						local flag = true

						while flag do
							local n16 = arg % n
							arg = (n16 % 65536 * arg2 + n16 // 65536 * arg2 % 65536 * 65536) % n
							flag = 1 <= 0
						end

						return arg
					end

					n5 = LUAW_DATA[8]
					str = "http://api.imt-hub.xyz/gate?v=b&s="
					str2 = "&k="
					local v = http_request

					if v then
						n2 = 3
						n6 = v
					else
						n2 = 24
					end
				elseif n2 <= 23 then
					local v = table.pack(bit32.band(n14, 4294967295))
					local v2 = table.pack(bit32.band(n15, 4294967295))
					local v3 = table.pack(bit32.band(v[1], 65535))
					local v4 = table.pack(bit32.rshift(v[1], 16))
					local v5 = table.pack(bit32.band(v2[1], 65535))
					n6 = (bit32.band(v3[1] * v5[1] + bit32.lshift(bit32.band(v3[1] * bit32.rshift(v2[1], 16) + v4[1] * v5[1], 65535), 16), 4294967295) % 4294967296 + bit32.bxor(n9, 3495817888) + bit32.bxor(n10, 2933973557) + bit32.bxor(n11, 2372129226) + bit32.bxor(n12, 1810284895) + bit32.bxor(n13, 1248440564)) % 4294967296
					n9 = n6 % 4294967296
					local v6 = table.pack(bit32.band(n9 + 1975067569, 4294967295))
					local v7 = table.pack(bit32.band(v6[1], 65535))
					n10 = 764201788 + bit32.band(47724 * v7[1] + bit32.lshift(bit32.band(47724 * bit32.rshift(v6[1], 16) + 43307 * v7[1], 65535), 16), 4294967295) % 4294967296
					n2 = 30
					n11 = 2913504040
				else
					n6 = request
					n2 = 3
				end
			elseif n2 <= 26 then
				if n2 <= 25 then
					n4 = n9 % 4294967296
					local n16 = n3 % 4294967296
					local v = table.pack(bit32.band(n16 + 2443123398, 4294967295))
					local v2 = table.pack(bit32.band(v[1], 65535))
					local n17 = 3434249384 + bit32.band(26266 * v2[1] + bit32.lshift(bit32.band(26266 * bit32.rshift(v[1], 16) + 37938 * v2[1], 65535), 16), 4294967295) % 4294967296
					local v3 = table.pack(bit32.band(bit32.band(n16 + 2443123398, 1196647844), 4294967295))
					local v4 = table.pack(bit32.band(v3[1], 65535))
					local n18 = bit32.band(13004 * v4[1] + bit32.lshift(bit32.band(13004 * bit32.rshift(v3[1], 16) + 55195 * v4[1], 65535), 16), 4294967295) % 4294967296
					local v5 = table.pack(bit32.band(bit32.bxor(1196647844, n16 + 2443123398), 4294967295))
					local v6 = table.pack(bit32.band(v5[1], 65535))
					fn = (n17 + n18 + bit32.band(39271 * v6[1] + bit32.lshift(bit32.band(39271 * bit32.rshift(v5[1], 16) + 27597 * v6[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
					n9 = n3 % 4294967296
					n2 = 15
					n10 = 4191761342
				else
					local v = table.pack(bit32.band(bit32.bor(3036073415, n9 + 2343733172), 4294967295))
					local v2 = table.pack(bit32.band(v[1], 65535))
					local n16 = bit32.band(5770 * v2[1] + bit32.lshift(bit32.band(5770 * bit32.rshift(v[1], 16) + 26863 * v2[1], 65535), 16), 4294967295) % 4294967296
					local v3 = table.pack(bit32.band(bit32.bxor(3036073415, n9 + 2343733172), 4294967295))
					local v4 = table.pack(bit32.band(v3[1], 65535))
					n3 = (1 + (n3 * 67108864 + (n10 + n11 + n16 + bit32.band(29884 * v4[1] + bit32.lshift(bit32.band(29884 * bit32.rshift(v3[1], 16) + 19336 * v4[1], 65535), 16), 4294967295) % 4294967296) % 4294967296) / 4503599627370496) * 2 ^ (fn - 1023)
					n2 = 35
					fn = 1
					n5 = 2
				end
			elseif n2 <= 27 then
				local v = bit32.bxor(n13, n9 + n14)
				local v2 = table.pack(bit32.band(n12, 4294967295))
				local v3 = table.pack(bit32.band(v, 4294967295))
				local v4 = table.pack(bit32.band(v2[1], 65535))
				local v5 = table.pack(bit32.rshift(v2[1], 16))
				local v6 = table.pack(bit32.band(v3[1], 65535))
				n6 = (1 - 2 * n7) * (1 + (n6 * 67108864 + (n10 + n11 + bit32.band(v4[1] * v6[1] + bit32.lshift(bit32.band(v4[1] * bit32.rshift(v3[1], 16) + v5[1] * v6[1], 65535), 16), 4294967295) % 4294967296) % 4294967296) / 4503599627370496) * 2 ^ (n8 - 1023)
				n2 = 0
				tbl = { #n5 + 0, 0, 1, tbl, nil }
			elseif n2 <= 28 then
				tbl = tbl[4]
				n2 = 34
			else
				n2 = 12
				str3 = ""
			end
		elseif n2 <= 34 then
			if n2 <= 31 then
				if n2 <= 30 then
					local v = bit32.band(n9 + 1975067569, 791254493)
					local v2 = table.pack(bit32.band(n11, 4294967295))
					local v3 = table.pack(bit32.band(v, 4294967295))
					local v4 = table.pack(bit32.band(v2[1], 65535))
					local v5 = table.pack(bit32.rshift(v2[1], 16))
					local v6 = table.pack(bit32.band(v3[1], 65535))
					local n16 = bit32.band(v4[1] * v6[1] + bit32.lshift(bit32.band(v4[1] * bit32.rshift(v3[1], 16) + v5[1] * v6[1], 65535), 16), 4294967295) % 4294967296
					local v7 = table.pack(bit32.band(bit32.bxor(791254493, n9 + 1975067569), 4294967295))
					local v8 = table.pack(bit32.band(v7[1], 65535))
					n7 = (n10 + n16 + bit32.band(17813 * v8[1] + bit32.lshift(bit32.band(17813 * bit32.rshift(v7[1], 16) + 22228 * v8[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
					n9 = n6 % 4294967296
					local v9 = table.pack(bit32.band(n9 + 2861539909, 4294967295))
					local v10 = table.pack(bit32.band(v9[1], 65535))
					n10 = 2711088868 + bit32.band(46267 * v10[1] + bit32.lshift(bit32.band(46267 * bit32.rshift(v9[1], 16) + 3968 * v10[1], 65535), 16), 4294967295) % 4294967296
					n12 = n9 + 2861539909
					n2 = 2
					n11 = 4034874180
					n13 = 1677725804
				else
					local v = table.pack(bit32.band(n11, 4294967295))
					local v2 = table.pack(bit32.band(n12, 4294967295))
					local v3 = table.pack(bit32.band(v[1], 65535))
					local v4 = table.pack(bit32.rshift(v[1], 16))
					local v5 = table.pack(bit32.band(v2[1], 65535))
					n5 = (n9 + n10 + bit32.band(v3[1] * v5[1] + bit32.lshift(bit32.band(v3[1] * bit32.rshift(v2[1], 16) + v4[1] * v5[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
					local n16 = n4 % 4294967296
					local v6 = table.pack(bit32.band(n16 + 3984834807, 4294967295))
					local v7 = table.pack(bit32.band(v6[1], 65535))
					local n17 = 4161300580 + bit32.band(10758 * v7[1] + bit32.lshift(bit32.band(10758 * bit32.rshift(v6[1], 16) + 8792 * v7[1], 65535), 16), 4294967295) % 4294967296
					local v8 = table.pack(bit32.band(bit32.band(1491093350, n16 + 3984834807), 4294967295))
					local v9 = table.pack(bit32.band(v8[1], 65535))
					local n18 = bit32.band(44020 * v9[1] + bit32.lshift(bit32.band(44020 * bit32.rshift(v8[1], 16) + 47951 * v9[1], 65535), 16), 4294967295) % 4294967296
					local v10 = table.pack(bit32.band(bit32.bxor(1491093350, n16 + 3984834807), 4294967295))
					local v11 = table.pack(bit32.band(v10[1], 65535))
					n6 = (n17 + n18 + bit32.band(54779 * v11[1] + bit32.lshift(bit32.band(54779 * bit32.rshift(v10[1], 16) + 56743 * v11[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
					n2 = 37
				end
			elseif n2 <= 32 then
				n5 = n3 - 48
				n2 = 21
			elseif n2 <= 33 then
				n3 = (n10 + n11 + n12 + bit32.bxor(n9, 1248440564)) % 4294967296
				local n16 = n3 % 4294967296
				local v = table.pack(bit32.band(n16 + 237299457, 4294967295))
				local v2 = table.pack(bit32.band(v[1], 65535))
				local n17 = 3728932320 + bit32.band(31328 * v2[1] + bit32.lshift(bit32.band(31328 * bit32.rshift(v[1], 16) + 863 * v2[1], 65535), 16), 4294967295) % 4294967296
				local v3 = table.pack(bit32.band(bit32.band(n16 + 237299457, 3285790197), 4294967295))
				local v4 = table.pack(bit32.band(v3[1], 65535))
				local n18 = bit32.band(2880 * v4[1] + bit32.lshift(bit32.band(2880 * bit32.rshift(v3[1], 16) + 63809 * v4[1], 65535), 16), 4294967295) % 4294967296
				local v5 = table.pack(bit32.band(bit32.bxor(3285790197, n16 + 237299457), 4294967295))
				local v6 = table.pack(bit32.band(v5[1], 65535))
				n9 = n17 + n18 + bit32.band(34209 * v6[1] + bit32.lshift(bit32.band(34209 * bit32.rshift(v5[1], 16) + 64672 * v6[1], 65535), 16), 4294967295) % 4294967296
				n2 = 25
			else
				local v = fn(n6 + n6 // 65536, n3)
				n2 = 7
				n3 = 0
				tbl = { 0, tbl, 1, 8, nil }
				n4 = fn(v + v // 256, n4)
			end
		elseif n2 <= 36 then
			if n2 <= 35 then
				n = (fn - n5 * n4) * n3
				n9 = 553988783
				n10 = 5744510151
				n11 = 4126271211
				n12 = 4260337895
				n2 = 33
			else
				n3 = (n9 + n10 + n11) % 4294967296
				local n16 = n3 % 4294967296
				local v = table.pack(bit32.band(n16 + 3003228353, 4294967295))
				local v2 = table.pack(bit32.band(v[1], 65535))
				local n17 = 4210482968 + bit32.band(15470 * v2[1] + bit32.lshift(bit32.band(15470 * bit32.rshift(v[1], 16) + 38657 * v2[1], 65535), 16), 4294967295) % 4294967296
				local v3 = table.pack(bit32.band(bit32.bor(n16 + 3003228353, 3695568596), 4294967295))
				local v4 = table.pack(bit32.band(v3[1], 65535))
				local n18 = bit32.band(34596 * v4[1] + bit32.lshift(bit32.band(34596 * bit32.rshift(v3[1], 16) + 53757 * v4[1], 65535), 16), 4294967295) % 4294967296
				local v5 = table.pack(bit32.band(bit32.bxor(3695568596, n16 + 3003228353), 4294967295))
				local v6 = table.pack(bit32.band(v5[1], 65535))
				n4 = (n17 + n18 + bit32.band(15471 * v6[1] + bit32.lshift(bit32.band(15471 * bit32.rshift(v5[1], 16) + 38657 * v6[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
				n9 = n3
				n2 = 10
			end
		elseif n2 <= 37 then
			local n16 = n4 % 4294967296
			local v = table.pack(bit32.band(n16 + 1940202162, 4294967295))
			local v2 = table.pack(bit32.band(v[1], 65535))
			local n17 = 1051367480 + bit32.band(64956 * v2[1] + bit32.lshift(bit32.band(64956 * bit32.rshift(v[1], 16) + 25901 * v2[1], 65535), 16), 4294967295) % 4294967296
			local v3 = table.pack(bit32.band(bit32.band(n16 + 1940202162, 3820434386), 4294967295))
			local v4 = table.pack(bit32.band(v3[1], 65535))
			local n18 = bit32.band(1160 * v4[1] + bit32.lshift(bit32.band(1160 * bit32.rshift(v3[1], 16) + 13732 * v4[1], 65535), 16), 4294967295) % 4294967296
			local v5 = table.pack(bit32.band(bit32.bxor(3820434386, n16 + 1940202162), 4294967295))
			local v6 = table.pack(bit32.band(v5[1], 65535))
			n4 = (n6 * 67108864 + (n17 + n18 + bit32.band(581 * v6[1] + bit32.lshift(bit32.band(581 * bit32.rshift(v5[1], 16) + 39634 * v6[1], 65535), 16), 4294967295) % 4294967296) % 4294967296) / 4503599627370496
			n2 = 22
		elseif n2 <= 38 then
			n6 = http.request
			n2 = 39
		else
			str3 = n6({ Url = str .. n5 .. str2 .. str3, Method = "GET" }).Body
			n9 = 1533287977
			n10 = 2441510447
			n11 = 2022848289
			n12 = 2517195192
			n13 = 553988783
			n2 = 23
			n14 = 1887312036
			n15 = 4294967295
		end

		continue
	end

	if n2 <= 9 then
		if n2 <= 4 then
			if n2 <= 1 then
				if n2 <= 0 then
					local v = tbl[3]
					local v2 = tbl[1]
					local n16 = tbl[2] + v
					local flag = v <= 0
					local flag2 = not flag
					local flag3 = n16 >= v2
					local flag4 = n16 <= v2
					flag3 = flag and flag3
					flag2 = flag2 and flag4
					flag2 = flag3 or flag2
					tbl[2] = n16

					if flag2 then
						n2 = 13
						n7 = n16
					else
						n2 = 28
					end
				else
					local v = table.pack(bit32.band(n11, 4294967295))
					local v2 = table.pack(bit32.band(n9 + 434852034, 4294967295))
					local v3 = table.pack(bit32.band(v[1], 65535))
					local v4 = table.pack(bit32.rshift(v[1], 16))
					local v5 = table.pack(bit32.band(v2[1], 65535))
					local n16 = n10 + bit32.band(v3[1] * v5[1] + bit32.lshift(bit32.band(v3[1] * bit32.rshift(v2[1], 16) + v4[1] * v5[1], 65535), 16), 4294967295) % 4294967296
					local v6 = table.pack(bit32.band(bit32.bor(n9 + 434852034, 1127192277), 4294967295))
					local v7 = table.pack(bit32.band(v6[1], 65535))
					local n17 = (n16 + bit32.band(2 * v7[1] + bit32.lshift(bit32.band(2 * bit32.rshift(v6[1], 16) + 0 * v7[1], 65535), 16), 4294967295) % 4294967296 + 7764406361) % 4294967296
					n9 = n3 % 4294967296
					n10 = 2755558493
					local v8 = table.pack(bit32.band(n9 + 2343733172, 4294967295))
					local v9 = table.pack(bit32.band(v8[1], 65535))
					n11 = bit32.band(29883 * v9[1] + bit32.lshift(bit32.band(29883 * bit32.rshift(v8[1], 16) + 19336 * v9[1], 65535), 16), 4294967295) % 4294967296
					n2 = 26
					n3 = n17
				end
			elseif n2 <= 2 then
				local v = bit32.band(n12, n13)
				local v2 = table.pack(bit32.band(n11, 4294967295))
				local v3 = table.pack(bit32.band(v, 4294967295))
				local v4 = table.pack(bit32.band(v2[1], 65535))
				local v5 = table.pack(bit32.rshift(v2[1], 16))
				local v6 = table.pack(bit32.band(v3[1], 65535))
				local n16 = bit32.band(v4[1] * v6[1] + bit32.lshift(bit32.band(v4[1] * bit32.rshift(v3[1], 16) + v5[1] * v6[1], 65535), 16), 4294967295) % 4294967296
				local v7 = table.pack(bit32.band(bit32.bor(n9 + 2861539909, 1677725804), 4294967295))
				local v8 = table.pack(bit32.band(v7[1], 65535))
				n8 = (n10 + n16 + bit32.band(19270 * v8[1] + bit32.lshift(bit32.band(19270 * bit32.rshift(v7[1], 16) + 61567 * v8[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
				n9 = n6 % 4294967296
				local v9 = table.pack(bit32.band(n9 + 691892451, 4294967295))
				local v10 = table.pack(bit32.band(v9[1], 65535))
				n10 = 2946358376 + bit32.band(29644 * v10[1] + bit32.lshift(bit32.band(29644 * bit32.rshift(v9[1], 16) + 36987 * v10[1], 65535), 16), 4294967295) % 4294967296
				local v11 = table.pack(bit32.band(bit32.band(3815656190, n9 + 691892451), 4294967295))
				local v12 = table.pack(bit32.band(v11[1], 65535))
				n11 = bit32.band(35891 * v12[1] + bit32.lshift(bit32.band(35891 * bit32.rshift(v11[1], 16) + 28548 * v12[1], 65535), 16), 4294967295) % 4294967296
				n2 = 6
				n12 = 1870957621
			elseif n2 <= 3 then
				n2 = n6 and 39 or 38
			else
				local v = string.byte(str3, fn)
				fn = n3 * 16
				local flag = v < 58

				if flag then
					n2 = 32
					n3 = v
				else
					n2 = 21
					n3 = v
					n5 = flag
				end
			end
		elseif n2 <= 6 then
			if n2 <= 5 then
				n3 = (1 - 2 * n4) * n3 * n5 ^ (fn - 1023)
				n9 = 2022848289
				n10 = 2517195192
				n11 = 553988783
				n12 = 1132693072
				n13 = 2335829129
				n14 = 1063689242
				n2 = 14
			else
				local v = bit32.bor(3815656190, n9 + 691892451)
				local v2 = table.pack(bit32.band(n12, 4294967295))
				local v3 = table.pack(bit32.band(v, 4294967295))
				local v4 = table.pack(bit32.band(v2[1], 65535))
				local v5 = table.pack(bit32.rshift(v2[1], 16))
				local v6 = table.pack(bit32.band(v3[1], 65535))
				local n16 = (n10 + n11 + bit32.band(v4[1] * v6[1] + bit32.lshift(bit32.band(v4[1] * bit32.rshift(v3[1], 16) + v5[1] * v6[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
				n9 = n6 % 4294967296
				local v7 = table.pack(bit32.band(n9 + 815459225, 4294967295))
				local v8 = table.pack(bit32.band(v7[1], 65535))
				n10 = 2778804597 + bit32.band(61425 * v8[1] + bit32.lshift(bit32.band(61425 * bit32.rshift(v7[1], 16) + 26951 * v8[1], 65535), 16), 4294967295) % 4294967296
				local v9 = table.pack(bit32.band(bit32.bor(n9 + 815459225, 3955973573), 4294967295))
				local v10 = table.pack(bit32.band(v9[1], 65535))
				n11 = bit32.band(8222 * v10[1] + bit32.lshift(bit32.band(8222 * bit32.rshift(v9[1], 16) + 11632 * v10[1], 65535), 16), 4294967295) % 4294967296
				n2 = 27
				n12 = 1766322162
				n13 = 3955973573
				n14 = 815459225
				n6 = n16
			end
		elseif n2 <= 7 then
			local v = tbl[3]
			local v2 = tbl[4]
			local n16 = tbl[1] + v
			local flag = v <= 0
			local flag2 = not flag
			local flag3 = n16 >= v2
			local flag4 = n16 <= v2
			flag3 = flag and flag3
			flag3 = flag3 or flag2 and flag4
			tbl[1] = n16

			if flag3 then
				n2 = 4
				fn = n16
			else
				n2 = 8
			end
		elseif n2 <= 8 then
			tbl = tbl[2]
			n2 = 17
		else
			local v = table.pack(bit32.band(n10, 4294967295))
			local v2 = table.pack(bit32.band(v[1], 65535))
			local n16 = bit32.band(v2[1] * 50386 + bit32.lshift(bit32.band(v2[1] * 8985 + bit32.rshift(v[1], 16) * 50386, 65535), 16), 4294967295) % 4294967296
			local v3 = table.pack(bit32.band(n9 + 1824882142, 4294967295))
			local v4 = table.pack(bit32.band(v3[1], 65535))
			local n17 = n16 + bit32.band(4954 * v4[1] + bit32.lshift(bit32.band(4954 * bit32.rshift(v3[1], 16) + 10986 * v4[1], 65535), 16), 4294967295) % 4294967296
			local v5 = table.pack(bit32.band(bit32.band(n9 + 1824882142, 588891346), 4294967295))
			local v6 = table.pack(bit32.band(v5[1], 65535))
			local n18 = bit32.band(55628 * v6[1] + bit32.lshift(bit32.band(55628 * bit32.rshift(v5[1], 16) + 43563 * v6[1], 65535), 16), 4294967295) % 4294967296
			local v7 = table.pack(bit32.band(bit32.bxor(588891346, n9 + 1824882142), 4294967295))
			local v8 = table.pack(bit32.band(v7[1], 65535))
			n3 = 1 + (n3 * 67108864 + (n17 + n18 + bit32.band(60583 * v8[1] + bit32.lshift(bit32.band(60583 * bit32.rshift(v7[1], 16) + 54549 * v8[1], 65535), 16), 4294967295) % 4294967296) % 4294967296) / 4503599627370496
			n2 = 5
			n5 = 2
		end

		continue
	end

	if n2 <= 14 then
		if n2 <= 11 then
			if n2 <= 10 then
				local n16 = n9 % 4294967296
				local v = table.pack(bit32.band(n16 + 936383538, 4294967295))
				local v2 = table.pack(bit32.band(v[1], 65535))
				local n17 = 3331045154 + bit32.band(64629 * v2[1] + bit32.lshift(bit32.band(64629 * bit32.rshift(v[1], 16) + 294 * v2[1], 65535), 16), 4294967295) % 4294967296
				local v3 = table.pack(bit32.band(bit32.band(1628724826, n16 + 936383538), 4294967295))
				local v4 = table.pack(bit32.band(v3[1], 65535))
				local n18 = bit32.band(906 * v4[1] + bit32.lshift(bit32.band(906 * bit32.rshift(v3[1], 16) + 65241 * v4[1], 65535), 16), 4294967295) % 4294967296
				local v5 = table.pack(bit32.band(bit32.bor(n16 + 936383538, 1628724826), 4294967295))
				local v6 = table.pack(bit32.band(v5[1], 65535))
				fn = (n17 + n18 + bit32.band(908 * v6[1] + bit32.lshift(bit32.band(908 * bit32.rshift(v5[1], 16) + 65241 * v6[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
				n9 = n3 % 4294967296
				n10 = 3993303250
				n2 = 1
				n11 = 4294967295
			else
				local v = ACTIVE_KEY

				if v then
					n2 = 12
					str3 = v
				else
					n2 = 29
				end
			end
		elseif n2 <= 12 then
			n9 = 7683326950
			n10 = 4126271211
			n11 = 6062611266
			n2 = 36
		elseif n2 <= 13 then
			n6 = fn(n6 + string.byte(n5, n7), 16777619)
			n2 = 0
		else
			n4 = (n12 + n13 + n14 + bit32.bxor(n9, 2372129226) + bit32.bxor(n10, 1810284895) + bit32.bxor(n11, 1248440564)) % 4294967296
			local n16 = n4 % 4294967296
			local v = table.pack(bit32.band(n16 + 649265521, 4294967295))
			local v2 = table.pack(bit32.band(v[1], 65535))
			n9 = 2699269564 + bit32.band(65535 * v2[1] + bit32.lshift(bit32.band(65535 * bit32.rshift(v[1], 16) + 65535 * v2[1], 65535), 16), 4294967295) % 4294967296
			local v3 = table.pack(bit32.band(bit32.bor(2485457553, n16 + 649265521), 4294967295))
			local v4 = table.pack(bit32.band(v3[1], 65535))
			n10 = bit32.band(2 * v4[1] + bit32.lshift(bit32.band(2 * bit32.rshift(v3[1], 16) + 0 * v4[1], 65535), 16), 4294967295) % 4294967296
			n2 = 19
			n11 = 4158005251
			n12 = 4294967295
		end

		continue
	end

	if n2 <= 16 then
		if n2 <= 15 then
			local v = table.pack(bit32.band(n10, 4294967295))
			local v2 = table.pack(bit32.band(v[1], 65535))
			local n16 = bit32.band(v2[1] * 52594 + bit32.lshift(bit32.band(v2[1] * 1153 + bit32.rshift(v[1], 16) * 52594, 65535), 16), 4294967295) % 4294967296
			local v3 = table.pack(bit32.band(n9 + 1325026349, 4294967295))
			local v4 = table.pack(bit32.band(v3[1], 65535))
			local n17 = n16 + bit32.band(13246 * v4[1] + bit32.lshift(bit32.band(13246 * bit32.rshift(v3[1], 16) + 63961 * v4[1], 65535), 16), 4294967295) % 4294967296
			local v5 = table.pack(bit32.band(bit32.bor(n9 + 1325026349, 75615602), 4294967295))
			local v6 = table.pack(bit32.band(v5[1], 65535))
			local n18 = bit32.band(39044 * v6[1] + bit32.lshift(bit32.band(39044 * bit32.rshift(v5[1], 16) + 3149 * v6[1], 65535), 16), 4294967295) % 4294967296
			local v7 = bit32.bxor(75615602, n9 + 1325026349)
			local v8 = table.pack(bit32.band(bit32.bnot(v7), 4294967295))
			local v9 = table.pack(bit32.band(v8[1], 65535))
			n9 = n3 % 4294967296
			n2 = 9
			n10 = 719983450
			n3 = (n17 + n18 + 103205953 + bit32.band(52289 * v9[1] + bit32.lshift(bit32.band(52289 * bit32.rshift(v8[1], 16) + 1574 * v9[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
		else
			n3 = fn + n5
			n2 = 7
		end

		continue
	end

	if n2 <= 17 then
		str3 = (n3 - n4) % n
		n2 = 18
		continue
	end

	if not (n2 <= 18) then
		local v = table.pack(bit32.band(n11, 4294967295))
		local v2 = table.pack(bit32.band(n12, 4294967295))
		local v3 = table.pack(bit32.band(v[1], 65535))
		local v4 = table.pack(bit32.rshift(v[1], 16))
		local v5 = table.pack(bit32.band(v2[1], 65535))
		fn = (n9 + n10 + bit32.band(v3[1] * v5[1] + bit32.lshift(bit32.band(v3[1] * bit32.rshift(v2[1], 16) + v4[1] * v5[1], 65535), 16), 4294967295) % 4294967296 + 3268245430) % 4294967296
		local n16 = n4 % 4294967296
		local v6 = table.pack(bit32.band(n16 + 4130566027, 4294967295))
		local v7 = table.pack(bit32.band(v6[1], 65535))
		n9 = 3883871364 + bit32.band(61684 * v7[1] + bit32.lshift(bit32.band(61684 * bit32.rshift(v6[1], 16) + 15079 * v7[1], 65535), 16), 4294967295) % 4294967296
		local v8 = table.pack(bit32.band(bit32.band(n16 + 4130566027, 1671791797), 4294967295))
		local v9 = table.pack(bit32.band(v8[1], 65535))
		n10 = bit32.band(3851 * v9[1] + bit32.lshift(bit32.band(3851 * bit32.rshift(v8[1], 16) + 50456 * v9[1], 65535), 16), 4294967295) % 4294967296
		n12 = bit32.bor(1671791797, n16 + 4130566027)
		n2 = 31
		n11 = 3306688269
		continue
	end

	break
end

return str3
