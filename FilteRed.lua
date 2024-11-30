--[[
Version: 1.0.3
Last Update: 30 / 11 / 2024 | Day / Month / Year
]]--

--// Source
function obfuscate(source, VarName, WaterMark)
    warn("Filtered: OBFUSCATING...")

    local Variable = VarName or "FilterPass_"
    local WM

    if source == nil then
        source = [[print("Hello World!")]]
    end

    local ticks = tick()

    if typeof(WaterMark) == "string" and WaterMark ~= nil then
        WM = "    "..tostring(WaterMark).." | Filtered | Obfuscator By Prouding"
    else
        WM = "    ".."WaterMark".." | Filtered | Obfuscator By Prouding"
    end

    WM = "--[[".."\n".. tostring(WM) .."\n".."]]--".."\n\n"

    local function random_string(length)
        local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
        local code = ""

        for i = 1, length do
            if math.random(1, 2) == 1 then
                code = code .. letters[math.random(1, 26)]:upper()
            else
                code = code .. letters[math.random(1, 26)]
            end
        end
        return code
    end

    local function add_binary(number)
        local topic = {
            "Filtered Obfuscator",
            "Stop Trying!",
            "SayNoToDeobfuscate",
            "Obfuscated By Filtered",
            "No Source Code",
            "Skid Detected!",
            "XDXDXDXD",
            random_string(math.random(50, 150)),
        }

        local s = ""
        for i = 1, number do
            local str = [[local ]]..Variable..random_string(math.random(10, 12))..[[ = ]]..'"'..string_to_binary(topic[math.random(1, #topic)])..'"'.."; "
            s = s..str
        end

        return s
    end

-- Функция для добавления мусора из кода
local function add_junk_code(number)
    local junk_code = ""
    for i = 1, number do
        local junk_var_name = Variable .. random_string(math.random(10, 14))
        -- Генерация зашифрованного кода
        junk_code = junk_code .. [[local ]] .. junk_var_name .. [[ = loadstring("return function() return ']] .. string.rep("junk ", math.random(1, 3)) .. [[' end")()]]
    end
    return junk_code
end

    local Random_Variable = {
        TableByte = random_string(math.random(15, 20)),
        Table_concat = random_string(math.random(15, 20)),
        Loadstring = random_string(math.random(15, 20)),
    }

    local troll_func = [[function() ]]..add_binary(math.random(30, 50))..[[ end]]
    local troll_var = [[local ]]..Variable..random_string(math.random(15, 20))..[[ = ]]..troll_func

    local SourceByte = ""
    for i = 1, #source do 
        SourceByte = SourceByte .. '"\\' .. string.byte(source, i) .. '", ' 
    end
    local TableByte = [[local ]]..Variable..Random_Variable.TableByte..[[ = {]]..SourceByte..[[}]]
    
    local Loadstring = [[local ]]..Variable..Random_Variable.Loadstring..[[ = loadstring(table.concat({"\114", "\101", "\116", "\117", "\114", "\110", "\32", "\102", "\117", "\110", "\99", "\116", "\105", "\111", "\110", "\40", "\98", "\121", "\116", "\101", "\41", "\10", "\32", "\32", "\32", "\32", "\105", "\102", "\32", "\116", "\121", "\112", "\101", "\111", "\102", "\40", "\98", "\121", "\116", "\101", "\41", "\32", "\61", "\61", "\32", "\34", "\116", "\97", "\98", "\108", "\101", "\34", "\32", "\116", "\104", "\101", "\110", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\108", "\111", "\97", "\100", "\115", "\116", "\114", "\105", "\110", "\103", "\40", "\116", "\97", "\98", "\108", "\101", "\46", "\99", "\111", "\110", "\99", "\97", "\116", "\40", "\98", "\121", "\116", "\101", "\41", "\41", "\40", "\41", "\10", "\32", "\32", "\32", "\32", "\101", "\108", "\115", "\101", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\98", "\121", "\116", "\101", "\32", "\61", "\32", "\123", "\98", "\121", "\116", "\101", "\125", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\108", "\111", "\97", "\100", "\115", "\116", "\114", "\105", "\110", "\103", "\40", "\116", "\97", "\98", "\108", "\101", "\46", "\99", "\111", "\110", "\99", "\97", "\116", "\40", "\98", "\121", "\116", "\101", "\41", "\41", "\40", "\41", "\10", "\32", "\32", "\32", "\32", "\101", "\110", "\100", "\10", "\101", "\110", "\100", "\10",}))()]]
    
    local func = {
        [1] = Variable..Random_Variable.Loadstring,
        [2] = Variable..Random_Variable.TableByte,
    }

    local fake_code = function(number, range)
        local t = {}
        for i = 1, number do
            local create_Var = Variable..random_string(math.random(15, 20))
            local random_code = "return "..tostring(random_(math.clamp(1000, string.len(source) / 2, string.len(source))))
            local byte = ""
            for x = 1, #random_code do 
                byte = byte..'"\\'..string.byte(random_code, x)..'", ' 
            end
            
            local fake = [[local ]]..create_Var..[[ = {]]..byte..[[}; ]]..[[local ]]..create_Var.." = "..func[1]..[[(]]..create_Var..[[); ]]
            table.insert(t, fake)
        end
        return table.concat(t, "\n") -- Changed to return code as a joined string
    end

    local obfuscated = WM..troll_var.."; "..Loadstring.."; "..fake_code(math.random(2, 4))..TableByte.."; "..add_junk_code(math.random(5, 10)).."; "..[[local ]]..Variable..random_string(math.random(15, 20)).." = "..func[1].."("..func[2]..")".."; "..fake_code(math.random(2, 4))
    setclipboard(obfuscated)
    warn("Done obfuscate in "..tostring(tick() - ticks).." seconds")
    return obfuscated
end

--// Обфускатор
return function(source, CustomVarName, WaterMark)
    task.spawn(function()
        obfuscate(source, CustomVarName, WaterMark)
    end)
end
