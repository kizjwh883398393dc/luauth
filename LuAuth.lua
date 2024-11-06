local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/svkxx/Roblox-Whitelist-Script/main/HWID%20Table%20Example.lua"))() -- We are making a variable for where your HWID / ClientID table is going to be located. (You can use pastebin / github)

local HWID = "19BEA21C-A0D2-4167-9FA5-E1B93934950D" -- NOTE IMPORTANT: I didnt put my HWID / ClientID for privacy reasons. You should replace this with game:GetService("RbxAnalyticsService"):GetClientId()

for i, v in pairs(v1) do
    if v == HWID then
        print("LUAUTH: Your HWID: ", HWID "Is Whitelisted")
    elseif v ~= HWID then
        print("LUAUTH: Your Hwid Is Not Whitelisted. HWID: ", HWID)
    end
end
