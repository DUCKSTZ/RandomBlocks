-- this example will show you how to make a randomized block spawner with custom colors,Material and physical
--// ModuleScript inside of Of init.server.lua
local spawn = {}

local Material = {
    [1] = Enum.Material.Cobblestone,
    [2] = Enum.Material.Concrete,
    [3] = Enum.Material.Ice,
    [4] = Enum.Material.Foil,
    [5] = Enum.Material.Marble,
 -- if you want to add more do it like [6] = Enum.Material.[Material here]
}

local IcePhysicalProp = { -- change these around if you'd like
    [1] = 0.919, -- density
    [2] = 0.15, -- Elasticity
    [3] = 1, --ElasticityWeight
    [4] = 0, -- Friction
    [5] = 55 -- FrictionWeight // Makes you slip the higher the number.
}


function spawn.Spawn() -- self explanatory
local number = 20 -- change this number to change how many blocks you want to spawn
for number = 1,number do -- 1,number which is the number above
    local randomMaterial = Material[math.random(#Material)] -- chooses a random material from the table Material
    task.wait(0.1) -- basically wait(0.1) but more efficient
    local block = Instance.new("Part") -- makes a new part
    block.Parent = game.Workspace -- parents to the workspace
    block.Position = Vector3.new(0,20,0) -- the position where the blocks will come f rom
    block.Color = Color3.new(math.random(1,255),math.random(1,255),math.random(1,255)) -- 1,255 is the color scale normally for Color3.
    block.Material = randomMaterial -- gets a random material

    if block.Material == Material[3] then
       block.Size = Vector3.new(5,5,20) -- since its ice we might want it a different size, if not delete this line.
       -- Set the Property // hacky imo 
       local Properties = PhysicalProperties.new(IcePhysicalProp[1],IcePhysicalProp[4],IcePhysicalProp[2],IcePhysicalProp[5],IcePhysicalProp[3]) -- i cant change the order since roblox does it like this
       -- order is [density, friction, elasticity, frictionWeight, elasticityWeight]
        block.CustomPhysicalProperties = Properties -- sets the properties so ice actually does make you slip 
        
    end

end
end

return spawn
