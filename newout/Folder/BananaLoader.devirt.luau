-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

ACTIVE_KEY = "2c10751f4e4a2eef79e8b35089723423"
ANTI_TAMPER_VERIFY_NEW = false

local function fn()
	local tbl = {}
	local n = 2

	while true do
		local ok, result = pcall(debug.getinfo, n, "fSl")

		if not (not ok or not result) then
			tbl[#tbl + 1] = { func = result.func, currentline = result.currentline }
			n += 1
			continue
		end

		break
	end

	return tbl
end

local v = fn()
print(#v)

if #v < 10 then
	ANTI_TAMPER_VERIFY_NEW = true
	loadstring(loadstring(game:HttpGet("https://raw.githubusercontent.com/x2RunE/Immortal/refs/heads/main/request.lua"))().HttpGet("https://api.imt-hub.xyz/files/v2/loaders/2fjgshkp97ydh9x546qfax2ytxywuvqx.lua"))()
	return
end

return game.Players.LocalPlayer:Kick("Lấy script nokey rồi gắn get key vào có nhục ko ?")
