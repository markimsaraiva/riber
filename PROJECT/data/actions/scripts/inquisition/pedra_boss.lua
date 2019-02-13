--Treasure Chest by Sun--
function onUse(cid, item, frompos, item2, topos)

if item.itemid == 12707 then
if isInRange(getThingPos(cid), {x=1339,y=807,z=11}, {x=1561,y=825,z=11}) then

if getPlayerStorageValue (cid,15890) == -1 then

setPlayerStorageValue(cid, 15890, 1)

doPlayerSendTextMessage(cid, 19, "Agora voce ja tem acesso as alavancas do lado esquerdo!")
doSendMagicEffect(topos,29)
else
doPlayerSendCancel(cid, "Voce ja liberou as alavancas do lado esquerdo!")
end


end
end
return true
end