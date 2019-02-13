
function onUse(cid, item, fromPosition, itemEx, toPosition)

local checkpoint = {14771,14772,14773,14774,14775}

if item.uid == 3231 and item.itemid == 3706 then
if getPlayerStorageValue (cid, checkpoint[1]) == -1 then

setPlayerStorageValue(cid, checkpoint[1], 1)
doPlayerSendTextMessage(cid, 19, "Voce marcou um checkpoint!!!")
doSendMagicEffect(getThingPos(cid),29)			

else
doPlayerSendTextMessage(cid,27,"Voce ja marcou esse checkpoint!")
end
else if item.uid == 3232 and item.itemid ==  3708  then
if getPlayerStorageValue (cid, checkpoint[2]) == -1 then

setPlayerStorageValue(cid, checkpoint[2], 1)
doPlayerSendTextMessage(cid, 19, "Voce marcou um checkpoint!!!")
doSendMagicEffect(getThingPos(cid),29)			
					

else
doPlayerSendTextMessage(cid,27,"Voce ja marcou esse checkpoint!")
end
else if item.uid == 3233 and item.itemid ==  3705  then
if getPlayerStorageValue (cid, checkpoint[3]) == -1 then

setPlayerStorageValue(cid, checkpoint[3], 1)
doPlayerSendTextMessage(cid, 19, "Voce marcou um checkpoint!!!")
doSendMagicEffect(getThingPos(cid),29)			
					

else
doPlayerSendTextMessage(cid,27,"Voce ja marcou esse checkpoint!")
end
else if item.uid == 3234 and item.itemid == 3705  then
if getPlayerStorageValue (cid, checkpoint[4]) == -1 then

setPlayerStorageValue(cid, checkpoint[4], 1)
doPlayerSendTextMessage(cid, 19, "Voce marcou um checkpoint!!!")
doSendMagicEffect(getThingPos(cid),29)			
					

else
doPlayerSendTextMessage(cid,27,"Voce ja marcou esse checkpoint!")
end

else if item.uid == 3235 and item.itemid == 3707  then
if getPlayerStorageValue (cid, checkpoint[5]) == -1 then

setPlayerStorageValue(cid, checkpoint[5], 1)
doPlayerSendTextMessage(cid, 19, "Voce marcou um checkpoint!!!")
doSendMagicEffect(getThingPos(cid),29)			
					

else
doPlayerSendTextMessage(cid,27,"Voce ja marcou esse checkpoint!")
end
end
end
end
end
end
return true
end


