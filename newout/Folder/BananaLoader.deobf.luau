-- Deobfuscated by deobf (dynamic trace)
-- source: BananaLoader.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: Expected ':' not '.' calling member function HttpGet
--   C:/Users/User/Desktop/EGO/Deobfuscator/newout/Folder/BananaLoader.deobf.luau.harness.luau:5368
--   Script:3 function Do
--   Script:3
--   Script:3
--   Script:3
--   C:/Users/User/Desktop/EGO/Deobfuscator/newout/Folder/BananaLoader.deobf.luau.harness.luau:5373
--   
-- 49 statements recorded in 1.44s
-- HTTP was not contacted; response values are symbolic harness proxies
-- URLs requested:
--   https://raw.githubusercontent.com/x2RunE/Immortal/refs/heads/main/request.lua

-- [deobf] removed 55 lines of the obfuscator's environment/anti-tamper probes
print(0)
local response = game:HttpGet("https://raw.githubusercontent.com/x2RunE/Immortal/refs/heads/main/request.lua")
loadstring(response)()
