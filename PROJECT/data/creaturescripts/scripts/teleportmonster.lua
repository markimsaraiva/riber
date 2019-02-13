
local config = {
message = { "I will return ...  ", " O TELEPORT FECHARA EM 30 SEGUNDOS!"},
timeToRemove = 30, -- seconds
teleportId = 1387,
bosses = {
["Lord Bazir"] = { x = 1316, y = 1181, z = 12 },
["Great Ushuriel"] = { x = 1463, y = 924, z = 12 },
["Great Zugurosh"] = { x = 1377, y = 956, z = 14 },
["Great Madareth"] = { x = 1323, y = 834, z = 11 },


["Great Annihilon"] = { x = 1594, y = 769, z = 14 },
["Great Hellgorak"] = { x = 1617, y = 642, z = 12 }


 
}
} 

local function removal(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return true
end

-- local function temporizador(pos,text,type)

-- local contagem =  30
-- setGlobalStorageValue(35353, contagem)
-- local coco = getGlobalStorageValue(35353)

-- if coco == 0 then

 -- stopEvent(temporizador)
-- else if getGlobalStorageValue(35353) == 30 then

-- doSendAnimatedText(pos, "30", 19)
   -- setGlobalStorageValue(35353, 29 )
  	-- addEvent(temporizador,1000,cid,pos,text,type)
-- else if getGlobalStorageValue(35353) == 29 then

-- doSendAnimatedText(pos, "29", 19)
   -- setGlobalStorageValue(35353, 28)
  	-- addEvent(temporizador,1000,cid,pos,text,type)
	

-- end

-- end
 
 -- end
 -- return true
 -- end
 
function onDeath(cid, corpse, killer)
registerCreatureEvent(cid, "teleportmonster")


local position = getCreaturePosition(cid)
position.y = position.y + 1


for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then

-- if contagem == 0 then
  -- stopEvent(temporizador)
-- else
   -- addEvent(temporizador,100,position,text,type)

-- end

doCreateTeleport(config.teleportId, pos, position)
doCreatureSay(cid, config.message[1], TALKTYPE_ORANGE_1)

doCreatureSay(cid, config.message[2], TALKTYPE_ORANGE_1)

addEvent(removal, config.timeToRemove * 1000, position)
doSendMagicEffect(position,10)
end
end
return true
end





