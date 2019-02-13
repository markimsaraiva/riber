function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=1329, y=1271, z=11, stackpos=1}
local tempo = 60*1000 -- tempo para parede voltar
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 2427 and item.itemid == 1945 and getpiece1.itemid == 6289 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"acho que ouvi um barulho, uma passagem deve ter se aberto.")
addEvent(doCreateItem, tempo, 6289, piece1pos)
addEvent(doTransformItem, tempo, item.uid,1945)
elseif item.uid == 2427 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
addEvent(doCreateItem, 60*1000, item.itemid, piece1pos)
else
doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end
return 1
end