pedra = {x=1112,y=1068,z=7, stackpos = 1} --- a posição da pedra // nao mexa no stackpos
idpedra = 1111 -- coloque o id da pedra
time = 4 -- tempo em segundos para a pedra aparecer
local storage = 5931
local time_now = os.time()
function onUse(cid, item, fromPosition, itemEx, toPosition)
if getGlobalStorageValue(storage) - time_now >= 0 then
doPlayerSendTextMessage(cid, 18, "A passagem já está liberada!")
else
doRemoveItem(getTileItemById(pedra, idpedra).uid, 1)
doPlayerSendTextMessage(cid, 18, "Você tem ".. time .." segundos para passar antes que a pedra volte!")
addEvent(createPedra, time*1000, pedra, idpedra)
doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
setGlobalStorageValue(storage, time_now+time)
end
return true
end
function createPedra(pos, id)
doCreateItem(id, 1, pos)
end