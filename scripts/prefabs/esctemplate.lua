
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),

}
local prefabs = {}

-- Custom starting items
local start_inv = {
	"hammer",
}

local mob_list = {
	"pigman",
	"bunnyman",
	"bearger",
	"killerbee",
	"deerclops",
	"hound",
	"firehound",
	"icehound",
	"mosquito",
	"spider",
	"spider_warrior",
	"spiderqueen",
	"tallbird",
	"leif",
	"tentacle",
}

local spawned = 0;

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when reviving from ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "esctemplate_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "esctemplate_speed_mod")
end

local function spawn_mobs(inst, data)
	local x,y,z = inst.Transform:GetWorldPosition()
	local size = table.getn(mob_list)
	
	local rand = math.random(1, size)	
	local spawn = mob_list[rand]	
	SpawnPrefab(spawn).Transform:SetPosition(x - 8,y,z)
	
	rand = math.random(1, size)
	spawn = mob_list[rand]
	SpawnPrefab(spawn).Transform:SetPosition(x + 8,y,z) 	
	
	spawned = spawned + 2
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)
	inst:ListenForEvent("playeractivated", spawn_mobs)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "esctemplate.tex" )
end


local function entitydeathfn(inst, data)
	--TheWorld:PushEvent("ms_setseason", "winter")	
	inst.components.talker:Say("I'LL KILL YOU ALL :D")
	spawned = spawned - 1
	
	if spawned < 15 then
		spawn_mobs(inst, data)
	end
end
local function OnHitOther(inst, data)
    local other = data.target
    if other and other.components.freezable then
        other.components.freezable:AddColdness(2)
        other.components.freezable:SpawnShatterFX()
	end
	
	local x,y,z = inst.Transform:GetWorldPosition()
	
	local ice11 = SpawnPrefab("icespike_fx_4")
	ice11.Transform:SetRotation(math.random(0, 360))
	ice11.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice21 = SpawnPrefab("icespike_fx_4")
	ice21.Transform:SetRotation(math.random(0, 360))
	ice21.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice31 = SpawnPrefab("icespike_fx_4")
	ice31.Transform:SetRotation(math.random(0, 360))
	ice31.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))

	local ice41 = SpawnPrefab("icespike_fx_4")
	ice41.Transform:SetRotation(math.random(0, 360))
	ice41.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))

	
	local ice12 = SpawnPrefab("icespike_fx_3")
	ice12.Transform:SetRotation(math.random(0, 360))
	ice12.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice22 = SpawnPrefab("icespike_fx_3")
	ice22.Transform:SetRotation(math.random(0, 360))
	ice22.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))	
	
	local ice32 = SpawnPrefab("icespike_fx_3")
	ice32.Transform:SetRotation(math.random(0, 360))
	ice32.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))

	local ice42 = SpawnPrefab("icespike_fx_3")
	ice42.Transform:SetRotation(math.random(0, 360))
	ice42.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))

	
	local ice13 = SpawnPrefab("icespike_fx_2")
	ice13.Transform:SetRotation(math.random(0, 360))
	ice13.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice23 = SpawnPrefab("icespike_fx_2")
	ice23.Transform:SetRotation(math.random(0, 360))
	ice23.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice33 = SpawnPrefab("icespike_fx_2")
	ice33.Transform:SetRotation(math.random(0, 360))
	ice33.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice43 = SpawnPrefab("icespike_fx_2")
	ice43.Transform:SetRotation(math.random(0, 360))
	ice43.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice14 = SpawnPrefab("icespike_fx_1")
	ice14.Transform:SetRotation(math.random(0, 360))
	ice14.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))

	local ice24 = SpawnPrefab("icespike_fx_1")
	ice24.Transform:SetRotation(math.random(0, 360))
	ice24.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice34 = SpawnPrefab("icespike_fx_1")
	ice34.Transform:SetRotation(math.random(0, 360))
	ice34.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
	local ice44 = SpawnPrefab("icespike_fx_1")
	ice44.Transform:SetRotation(math.random(0, 360))
	ice44.Transform:SetPosition(math.random(x - 8, x + 8), y, math.random(z - 8,z + 8))
	
   
end


-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	inst:ListenForEvent("entity_death", function(world, data) entitydeathfn(inst, data) end, TheWorld)
	inst:ListenForEvent("onhitother", OnHitOther)
	--inst.components.combat:SetRange(8)
	inst.components.combat:SetAreaDamage(9, 2)
	-- Stats	
	inst.components.health:SetMaxHealth(500)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("esctemplate", prefabs, assets, common_postinit, master_postinit, start_inv)
