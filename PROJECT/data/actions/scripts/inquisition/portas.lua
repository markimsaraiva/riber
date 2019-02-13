
function onUse(cid, item, fromPosition, itemEx, toPosition)

local checkpoints = {14771,14772,14773,14774,14775}

if item.aid == 3331 and item.itemid == 5123 then
if getPlayerStorageValue (cid, checkpoints[1]) == 1 then
doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, toPosition, true)

else
doPlayerSendTextMessage(cid,27,"Voce nao tem esse checkpoint marcado!")
end
else if item.aid == 3332 and item.itemid ==  5132  then
if getPlayerStorageValue (cid, checkpoints[2]) == 1 then
doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, toPosition, true)	
				
else
doPlayerSendTextMessage(cid,27,"Voce nao tem esse checkpoint marcado!")
end
else if item.aid == 3333 and item.itemid ==  5132  then
if getPlayerStorageValue (cid, checkpoints[3]) == 1 then
doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, toPosition, true)				
else
doPlayerSendTextMessage(cid,27,"Voce nao tem esse checkpoint marcado!")
end
else if item.aid == 3334 and item.itemid == 5123  then
if getPlayerStorageValue (cid, checkpoints[4]) == 1 then

doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, toPosition, true)					
else
doPlayerSendTextMessage(cid,27,"Voce nao tem esse checkpoint marcado!")
end

else if item.aid == 3335 and item.itemid == 5123  then
if getPlayerStorageValue (cid, checkpoints[5]) == 1 then
doTransformItem(item.uid, item.itemid + 1)
doTeleportThing(cid, toPosition, true)					
else
doPlayerSendTextMessage(cid,27,"Voce nao tem esse checkpoint marcado!")
end
end
end
end
end
end
return true
end



