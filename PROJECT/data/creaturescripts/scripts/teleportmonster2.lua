
local config = {
message = { "I will return ...  ", " CLIQUE OU IRA SUMIR EM 30 SEGUNDOS!"},
timeToRemove = 30, -- seconds
teleportId = 12708,
bosses = {





["Great Latrivan"] = { x = 1538, y = 809, z = 15 }



 
}
} 

local function removal(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return true
end

function onDeath(cid, corpse, killer)
registerCreatureEvent(cid, "teleportmonster2")


local position = getCreaturePosition(cid)
position.y = position.y + 1


for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then

doCreateItem(12708, position)

doCreatureSay(cid, config.message[1], TALKTYPE_ORANGE_1)

doCreatureSay(cid, config.message[2], TALKTYPE_ORANGE_1)

addEvent(removal, config.timeToRemove * 1000, position)
doSendMagicEffect(position,10)
end
end
return true
end





