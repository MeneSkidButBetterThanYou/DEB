ACTIVE_KEY = 'f952a93a3d0712034a792521e6390f02';
local raw = http_request({
    Url = 'https://api.imt-hub.xyz/files/v2/loaders/gyrsoyzr3ups70ze4ter4kciag7lgjjc.lua',
    Method = 'GET'
}).Body
loadstring(raw)()
