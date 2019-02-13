function onUse(cid, item, fromPosition, itemEx, toPosition)
t = {
piece1pos = {x=1344, y=1257, z=9, stackpos=1},
piece2pos = {x=1346, y=1257, z=9, stackpos=1}
}
local tempo = 5*1000 -- tempo para parede voltar
local tempo2 = 4*1000 -- tempo para parede voltar

getpiece1 = getThingfromPos(t.piece1pos)
getpiece2 = getThingfromPos(t.piece2pos)
if item.uid == 42881 and item.itemid == 1945 and getpiece1.itemid == 1304 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"acho que ouvi um barulho, uma passagem deve ter se aberto.")
doCreateItem(1304, t.piece2pos)
addEvent(doCreateItem, tempo, 1304, t.piece1pos)
addEvent(doTransformItem, tempo, item.uid,1945)

addEvent(
    function()
        doRemoveItem(getTileItemById(t.piece2pos, 1304).uid)
    end,
    tempo)


else
doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end
return 1
end