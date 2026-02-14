local replicatedStorage = game:GetService("ReplicatedStorage")

local privateServerStatus, _ = pcall(function()
    _ = replicatedStorage.PrivateServers.Info.ServerName.Value
    _ = replicatedStorage.PrivateServers.Info.Code.Value
end)

_G.assetStealer.isPrivateServer = privateServerStatus