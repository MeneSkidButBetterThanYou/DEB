-- Deobfuscated by deobf (dynamic trace)
-- source: Lotus_Kaitun_Levi.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 2 statements recorded in 0.02s
-- URLs requested:
--   https://api.imt-hub.xyz/files/v2/loaders/gyrsoyzr3ups70ze4ter4kciag7lgjjc.lua

local response = http_request({
	Method = "GET",
	Url = "https://api.imt-hub.xyz/files/v2/loaders/gyrsoyzr3ups70ze4ter4kciag7lgjjc.lua"
})

loadstring(response.Body)()
