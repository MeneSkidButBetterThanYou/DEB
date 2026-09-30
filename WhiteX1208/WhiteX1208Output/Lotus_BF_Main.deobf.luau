-- Deobfuscated by deobf (dynamic trace)
-- source: Lotus_BF_Main.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 2 statements recorded in 0.04s
-- URLs requested:
--   http://api.imt-hub.xyz/files/v2/loaders/vk0w1p345iwv16o0nfxt6p9n2rcbskne.lua

local response = http_request({
	Method = "GET",
	Url = "http://api.imt-hub.xyz/files/v2/loaders/vk0w1p345iwv16o0nfxt6p9n2rcbskne.lua"
})

loadstring(response.Body)()
