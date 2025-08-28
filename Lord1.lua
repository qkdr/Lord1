local games = {
    [116495829188952] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [4924922222] = "https://raw.githubusercontent.com/qkdr/Lord1/Thronix/heads/main/Final.lua",
    [109983668079237] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [18668065416] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [126884695634066] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [7711635737] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [79546208627805] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [104715542330896] = "https://raw.githubusercontent.com/qkdr/Thronix1/refs/heads/main/Final.lua",
    [73934517857372] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [95137717383780] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [12137249458] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [12824140164] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [86082995079744] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [113995904598360] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [137169781303029] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua", 
    [129954712894461] = "https://raw.githubusercontent.com/qkdr/Thronix1/refs/heads/main/Final.lua",
    [114501358617756] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua", 
    [88730406335204] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua", 
    [14259168147] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua", 
    [117957332897543] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua", 
    [18626211593] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua",
    [126625214460461] = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/Final.lua", 
    [83962596228244] = "https://raw.githubusercontent.com/qkdr/Lord1/refThronixads/main/Final.lua"
}

local defaultScript = "https://raw.githubusercontent.com/qkdr/Lord1/refs/heads/main/beginning.lua"

local scriptURL = games[game.PlaceId] or defaultScript

getgenv().uiSize = UDim2.fromOffset(580, 400)

loadstring(game:HttpGet(scriptURL))()
