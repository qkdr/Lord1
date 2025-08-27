-- SERVICES
local Players            = game:GetService("Players")
local HttpService        = game:GetService("HttpService")
local RunService         = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")

-- LOCAL VARIABLES
local Player   = Players.LocalPlayer
local isStudio = RunService:IsStudio()

-- 🔽 Load Luna library
local Luna = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true
))()

-- 🪟 Create the window
local Window = Luna:CreateWindow({
    Name            = "Thronix Scripts | Thronix Scripts ",
    Subtitle        = "Free Version",
    LogoID          = "82795327169782",
    LoadingEnabled  = true,
    LoadingTitle    = "Thronix Scripts | Thronix Scripts ",
    LoadingSubtitle = "Loading...",
    TabSize         = 140,
    Acrylic         = true,
    DarkMode        = true,
    ImageSource     = "Material",
    KeySystem       = false,
})

-- ✅ Home tab
Window:CreateHomeTab({
    Icon               = 2,
    SupportedExecutors = {"Krnl", "Fluxus", "Electron", "Delta"},
    DiscordInvite      = "nebula",
})

-- ◼️ Random Scripts tab
local RandomTab = Window:CreateTab({
    Name        = "Random Scripts",
    Icon        = "search",
    ImageSource = "Material",
    ShowTitle   = true,
})

local function addRandomScript(name, url, desc)
    RandomTab:CreateButton({
        Name        = name,
        Description = desc or "",
        Callback    = function()
            loadstring(game:HttpGet(url, true))()
        end,
    })
    RandomTab:CreateDivider()
end

-- Add random scripts
addRandomScript("Wisl'i Universal Script",
    "https://raw.githubusercontent.com/wisl884/wisl-i-Universal-Project1/main/Wisl'i%20Universal%20Project.lua"
)
addRandomScript("Aimbot Script",
    "https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua"
)
addRandomScript("Daniel Hub Aimbot",
    "https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"
)
addRandomScript("ESP Script",
    "https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP"
)
addRandomScript("Animation Recorder Script",
    "https://raw.githubusercontent.com/Mautiku/ehh/main/sussy's%20animation%20logger.txt"
)
addRandomScript("Chatbot Script",
    "https://raw.githubusercontent.com/Guerric9018/chatbothub/main/ChatbotHub.lua"
)
addRandomScript("Global Dance GUI Script",
    "https://raw.githubusercontent.com/ocfi/aqua-hub-is-a-skid-lol/refs/heads/main/animatrix"
)
addRandomScript("Executor Tests Panel",
    "https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/ExecutorTestsPanel.lua",
    "Press F9 while running tests"
)
addRandomScript("Free Camera",
    "https://zxfolix.github.io/freecamV2.txt",
    "Requires keyboard script and press P to control"
)
addRandomScript("Hitbox Expander",
    "https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"
)
addRandomScript("Shaders Script",
    "https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua"
)
addRandomScript("Fly Script",
    "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"
)
addRandomScript("Sirius Script",
    "https://sirius.menu/sirius"
)
addRandomScript("Script searcher from ScriptSearcher site",
    "https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"
)
addRandomScript("Teleport to Players Script",
    "https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/stare"
)
addRandomScript("Express Hub Script",
    "https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"
)

-- ◼️ Additional sections inside Random tab
RandomTab:CreateDivider({Text = "Performance"})
RandomTab:CreateSection("Performance")
addRandomScript("FPS Script",
    "https://pastefy.app/c63s1M4w/raw"
)

RandomTab:CreateDivider({Text = "Developer Tools"})
RandomTab:CreateSection("Developer Tools")
addRandomScript("Dex Script",
    "https://github.com/OfficiallyMelon/BetterDecompiler/raw/main/dex_betterdecompiler.lua"
)
addRandomScript("SaveInstance (copies the whole game)",
    "https://raw.githubusercontent.com/24rr/tmpignore/refs/heads/main/32423sadf133"
)
addRandomScript("Venox webhook tools script",
    "https://raw.githubusercontent.com/venoxhh/universalscripts/main/webhook_tools"
)

RandomTab:CreateDivider({Text = "Admin Scripts"})
RandomTab:CreateSection("Admin Scripts")
addRandomScript("Infinite Yield",
    "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
)
addRandomScript("NamelessAdmin",
    "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"
)
addRandomScript("Orca",
    "https://raw.githubusercontent.com/richie0866/orca/master/public/snapshot.lua"
)

RandomTab:CreateDivider({Text = "Copy Scripts"})
RandomTab:CreateSection("Copy Scripts")
addRandomScript("Copy skins that work on all maps",
    "https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Copy%20Avatar",
    "Note: not visible to others"
)
addRandomScript("Faces Script",
    "https://raw.githubusercontent.com/scripthubekitten/fakelimitedsv2/main/fakelimitedsv2"
)

-- ◼️ FE Scripts tab (dynamic search)
local FETab = Window:CreateTab({
    Name        = "FE Scripts",
    Icon        = "visibility",
    ImageSource = "Material",
    ShowTitle   = true,
})

FETab:CreateSection("FE Scripts search results")
do
    local query = "FE Scripts"
    local url   = "https://scriptblox.com/api/script/search?q=" .. HttpService:UrlEncode(query)
    local ok, res = pcall(function() return game:HttpGet(url, true) end)
    if ok then
        local data = HttpService:JSONDecode(res)
        if data.result and #data.result.scripts > 0 then
            for _, s in ipairs(data.result.scripts) do
                local title = s.title or "Untitled"
                local slug  = s.slug or ""
                FETab:CreateButton({
                    Name        = title,
                    Description = "Run this script",
                    Callback    = function()
                        local fetchUrl = "https://scriptblox.com/api/script/" .. slug
                        local ok2, info = pcall(function() return game:HttpGet(fetchUrl, true) end)
                        if ok2 then
                            local tbl = HttpService:JSONDecode(info)
                            if tbl.script and tbl.script.script then
                                loadstring(tbl.script.script)()
                                Luna:Notification({ Title="✅ Executed", Content=title, Icon="check_circle" })
                            else
                                Luna:Notification({ Title="⚠️ Unavailable", Content="Protected or missing" })
                            end
                        else
                            Luna:Notification({ Title="❌ Load Failed", Content="Could not contact ScriptBlox" })
                        end
                    end,
                })
                FETab:CreateDivider()
            end
        else
            Luna:Notification({ Title="❌ No Results", Content="No scripts found for " .. query })
        end
    else
        Luna:Notification({ Title="❌ Connection Error", Content="Check your internet" })
    end
end

-- ◼️ Misc Hacks tab
local HackTab = Window:CreateTab({
    Name        = "Misc Hacks",
    Icon        = "search",
    ImageSource = "Material",
    ShowTitle   = true,
})

HackTab:CreateButton({
    Name     = "Synapse X Hack",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua", true))()
    end,
})
HackTab:CreateSection("PC Hacks")
HackTab:CreateButton({
    Name     = "Krnl Hack",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/refs/heads/main/KRNL%20UI%20Remake.lua", true))()
    end,
})
HackTab:CreateButton({
    Name     = "Old Delta Hack",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Other-Stuff/main/ExecutorInternal.lua", true))()
    end,
})
HackTab:CreateButton({
    Name     = "Electron Script",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Electron-UI-Remake-13807", true))()
    end,
})
HackTab:CreateDivider({Text = "Copy Scripts"})
HackTab:CreateSection("Android hacks that work for everyone")
local function addHackCopy(name, url)
    HackTab:CreateButton({
        Name     = name,
        Callback = function()
            loadstring(game:HttpGet(url, true))()
        end,
    })
    HackTab:CreateDivider()
end
addHackCopy("Arceus X V3 Hack",
    "https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3.lua"
)
addHackCopy("Delta Hack",
    "https://raw.githubusercontent.com/ElijahGamingRBLX/Roblox-Executor/master/DeltaExecutor.lua"
)
addHackCopy("iOS UI Hack",
    "https://raw.githubusercontent.com/TableDevelopments/public/master/ui.lua"
)
addHackCopy("Cubix Hack",
    "https://raw.githubusercontent.com/1dontgiveaf/testscript69/main/Cubix.lua"
)
addHackCopy("Krypton Hack",
    "https://raw.githubusercontent.com/anyahubs/executer/main/Krypton(UI).txt"
)

-- ◼️ Player Behavior tab
local BehaviorTab = Window:CreateTab({
    Name        = "Player Behavior",
    Icon        = "directions_run",
    ImageSource = "Material",
    ShowTitle   = true,
})

BehaviorTab:CreateSection("Walk Speed")
BehaviorTab:CreateSlider({
    Name         = "Walk Speed",
    Range        = {16, 300},
    Increment    = 1,
    CurrentValue = 16,
    Callback     = function(value)
        local char = Players.LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = value end
    end,
}, "WalkSpeedSlider")

BehaviorTab:CreateSection("Jump Power")
BehaviorTab:CreateSlider({
    Name         = "Jump Power",
    Range        = {50, 300},
    Increment    = 1,
    CurrentValue = 50,
    Callback     = function(value)
        local char = Players.LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = value end
    end,
}, "JumpPowerSlider")

BehaviorTab:CreateSection("Toggle Atmosphere (Day/Night)")
BehaviorTab:CreateToggle({
    Name    = "Enable Night Mode",
    Default = false,
    Callback = function(isNight)
        local L = game:GetService("Lighting")
        if isNight then
            L.ClockTime      = 20
            L.Brightness     = 1
            L.FogEnd         = 100
            L.OutdoorAmbient = Color3.fromRGB(50,50,70)
            L.Ambient        = Color3.fromRGB(30,30,50)
        else
            L.ClockTime      = 8
            L.Brightness     = 2
            L.FogEnd         = 1000
            L.OutdoorAmbient = Color3.fromRGB(128,128,128)
            L.Ambient        = Color3.fromRGB(128,128,128)
        end
    end,
}, "DayNightToggle")

-- ◼️ Map Scripts tab: Dead Rails (prevents duplicate on multiple presses)
do
    -- Get current map name
    local okInfo, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    local mapName = (okInfo and info and info.Name) and info.Name or tostring(game.PlaceId)

    -- Create tab with dynamic name
    local MapTab = Window:CreateTab({
        Name        = "Map Scripts: " .. mapName,
        Icon        = "visibility",
        ImageSource = "Material",
        ShowTitle   = true,
    })

    -- loading state tracker
    local loaded = false

    -- function to search for scripts by name
    local function runSearch(tab, query)
        local url = "https://scriptblox.com/api/script/search?q=" .. HttpService:UrlEncode(query)
        local ok, res = pcall(function() return game:HttpGet(url, true) end)
        if not ok then
            Luna:Notification({ Title="❌ Connection Failed", Content="Check your internet" })
            return 0
        end
        local data = HttpService:JSONDecode(res)
        if not (data.result and #data.result.scripts > 0) then
            return 0
        end
        for _, s in ipairs(data.result.scripts) do
            local title = s.title or "Untitled"
            local slug  = s.slug or ""
            tab:CreateButton({
                Name        = title,
                Description = "Run this script",
                Callback    = function()
                    local fetchUrl = "https://scriptblox.com/api/script/" .. slug
                    local ok2, info2 = pcall(function() return game:HttpGet(fetchUrl, true) end)
                    if ok2 then
                        local tbl = HttpService:JSONDecode(info2)
                        if tbl.script and tbl.script.script then
                            loadstring(tbl.script.script)()
                            Luna:Notification({ Title="✅ Executed", Content=title, Icon="check_circle" })
                        else
                            Luna:Notification({ Title="⚠️ Unavailable", Content="Protected or missing" })
                        end
                    else
                        Luna:Notification({ Title="❌ Load Failed", Content="Could not contact ScriptBlox" })
                    end
                end,
            })
            tab:CreateDivider()
        end
        return #data.result.scripts
    end

    -- Button to show/update scripts using the map name (prevents duplicates)
    MapTab:CreateButton({
        Name        = "🔍 Show scripts for " .. mapName,
        Description = "Click to display scripts for the current map",
        Callback    = function()
            if not loaded then
                local added = runSearch(MapTab, mapName)
                if added > 0 then
                    Luna:Notification({
                        Title   = "✅ Scripts Added",
                        Content = tostring(added) .. " scripts for " .. mapName,
                    })
                else
                    Luna:Notification({
                        Title   = "⚠️ No Results",
                        Content = "No scripts found for " .. mapName,
                    })
                end
                loaded = true
            else
                Luna:Notification({
                    Title   = "⚠️ No more",
                    Content = "You've already displayed all scripts for " .. mapName,
                })
            end
        end,
    })
    MapTab:CreateDivider()
end
