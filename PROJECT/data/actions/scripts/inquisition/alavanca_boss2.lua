local config = {
message = { "I will return ...  ", " CORRA OU IRA SUMIR EM 30 SEGUNDOS!"},
timeToRemove = 5, -- seconds
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

local tempo1 = 20*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL

local tempo2 = 10*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL
local tempo3 = 20*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL
local tempo4 = 20*1000 -- tempo para ALAVANCA VOLTAR ESTADO NORMAL




 if item.uid == 3132 and item.itemid == 1945 then
 if getPlayerStorageValue (cid, 15890) == 1 then

if getGlobalStorageValue(sttorage) < 3 then

doTransformItem(item.uid,item.itemid+1)
doCreatureSay(cid,"Alavanca 2 ativada",19)
addEvent(doTransformItem, tempo2, item.uid,1945)

setGlobalStorageValue( sttorage , getGlobalStorageValue(sttorage) + 1 )
addEvent(setGlobalStorageValue, tempo2, sttorage , -1 )
	
end	
else
doPlayerSendTextMessage(cid,27,"Voce nao clicou na pedra que dropa do Great Latrivan!")
end
end




return true
end

