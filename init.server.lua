-- Script in serverscriptservice

local part = require(script.part) -- gets the Module script


function SpawnBlock() -- the function which we call
    part.Spawn() -- modulescript so it actually launches
end

SpawnBlock() -- spawns the spawnblock, if you'd like for it to launch if a play joins do

-- game.Players.PlayerAdded:Connect(SpawnBlock)
