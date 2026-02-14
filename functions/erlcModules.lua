local replicatedStorage = game:GetService("ReplicatedStorage")

local ERLCModules = {
    vehiclesModule = require(replicatedStorage.Modules.Vehicles),
    getVehicleSpawnData = require(replicatedStorage.Remotes.Vehicles.GetVehicleSpawnData),
    liveryDenialReasons = require(replicatedStorage.Modules.LiveryDenialReasons)
}

_G.assetStealer.ERLCModules = ERLCModules