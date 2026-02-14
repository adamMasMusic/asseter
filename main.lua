--create windUI
loadstring(game:HttpGet("https://github.com/adamMasMusic/asseter/raw/refs/heads/main/functions/windUI.lua"))
repeat task.wait() until _G.assetStealer
--check if they are in private server
loadstring(game:HttpGet("https://github.com/adamMasMusic/asseter/raw/refs/heads/main/functions/privateServerCheck.lua"))
--compression shit
loadstring(game:HttpGet("https://github.com/adamMasMusic/asseter/raw/refs/heads/main/functions/zlib.lua"))
--erlc has modules???
loadstring(game:HttpGet("https://github.com/adamMasMusic/asseter/raw/refs/heads/main/functions/erlcModules.lua"))
--settings, category map
loadstring(game:HttpGet("https://github.com/adamMasMusic/asseter/raw/refs/heads/main/functions/details.lua"))
--load functions
loadstring(game:HttpGet("https://github.com/adamMasMusic/asseter/raw/refs/heads/main/functions/functions.lua"))