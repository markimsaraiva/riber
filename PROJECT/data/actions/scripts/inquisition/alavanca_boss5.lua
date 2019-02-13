local config = {
message = { "I will return ...  ", " CORRA OU IRA SUMIR EM 30 SEGUNDOS!"},
timeToRemove = 30, -- seconds
teleportId = 1387,
ondevai = { x = 1538, y = 809, z = 15 },
ondenasce = { x = 1550, y = 817, z = 11 },

bosses = {

["Great Latrivan"] = { x = 1538, y = 809, z = 15 }
 
}
} 

local sttorage = 14894

local function removal2(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)

local tempo1 = 30*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL

local tempo2 = 20*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL
local tempo3 = 20*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL
local tempo4 = 20*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL


if item.uid == 3135 and item.itemid == 1945 then
if getGlobalStorageValue(sttorage) == 3 then

doTransformItem(item.uid,item.itemid+1)
doCreatureSay(cid,"Alavanca Mestre ativada",19)
addEvent(doTransformItem, tempo1, item.uid,1945)

	
doCreateTeleport(config.teleportId, config.ondevai, config.ondenasce)
doCreatureSay(cid, config.message[1], TALKTYPE_ORANGE_1)
doCreatureSay(cid, config.message[2], TALKTYPE_ORANGE_1)
addEvent(removal2, config.timeToRemove * 1000, config.ondenasce)
setGlobalStorageValue( sttorage, -1 )
			
    

else
doPlayerSendTextMessage(cid,27,"Voce nao ativou as 4 alavancas!")

end
end



return true
end

