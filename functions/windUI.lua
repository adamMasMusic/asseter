local assetStealer = {
    windUI = nil,
    window = nil
}

local RunService = game:GetService("RunService")

local cloneref = (cloneref or clonereference or function(instance) return instance end)
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

local WindUI

do
    local ok, result = pcall(function()
        return require("./src/Init")
    end)
    
    if ok then
        WindUI = result
    else 
        if cloneref(game:GetService("RunService")):IsStudio() then
            WindUI = require(cloneref(ReplicatedStorage:WaitForChild("WindUI"):WaitForChild("Init")))
        else
            WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
        end
    end
end

local Window = WindUI:CreateWindow({
    Title = "Asset Stealer for ER:LC",
    Author = "by adam_mas",
    Folder = "assetStealer",
    Icon = "lucide:car",
    NewElements = true,
    
    HideSearchBar = true,
    
    OpenButton = {
        Title = "Open asset stealer",
        CornerRadius = UDim.new(1,0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = true,
        Scale = 0.5,
        
        Color = ColorSequence.new(
            Color3.fromHex("#2b0ae6"), 
            Color3.fromHex("#46109b")
        )
    },
    Topbar = {
        Height = 44,
        ButtonsType = "Default",
    },
})

assetStealer.window = Window
assetStealer.windUI = WindUI

_G.assetStealer = assetStealer