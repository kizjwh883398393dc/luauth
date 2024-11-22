



-- Logging in
local http_request = request

if not http_request then
    game:GetService('Players').LocalPlayer:Kick('Luauth: Exploit dont support Luauth')
    return
end

local Status = Drawing.new("Text")
Status.Size = 32
Status.Position = Vector2.new(20, 20)
Status.Visible = true
Status.Color = Color3.fromRGB(255, 255, 255)
Status.Outline = true
Status.Text = "Status: Connecting to server..."

-- Отправка HTTP-запроса
local response = http_request({
    Url = 'https://snippet.host/dbgnfp/raw',  -- Укажите нужный адрес сервера
    Method = 'GET'
})

-- Проверка ответа от сервера
if response.StatusCode == 200 then
    Status.Text = "Status: WHITELISTED."
	loadstring(game:HttpGet("https://raw.githubusercontent.com/kizjwh883398393dc/luauth/refs/heads/main/v1.lua"))
else
    Status.Text = "Status: NOT WHITELISTED"
end

