local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/kizjwh883398393dc/luauth/refs/heads/main/Luauth.lua"))()

local HWID = loadstring(game:HttpGet("https://raw.githubusercontent.com/kizjwh883398393dc/luauth/refs/heads/main/v1.lua"))()

for i, v in pairs(v1) do
    if v == HWID then
        print("LUAUTH: Your HWID: ", HWID "Is Whitelisted")
    elseif v ~= HWID then
        print("LUAUTH: Your Hwid Is Not Whitelisted. HWID: ", HWID)
    end
end
