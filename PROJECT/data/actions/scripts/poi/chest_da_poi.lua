--Treasure Chest by Sun--
function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1747 and item.uid == 45002 then
if getPlayerStorageValue (cid,45002) < 1 then

setPlayerStorageValue(cid, 45002, 1)
doPlayerAddItem(cid,2261,1)
doPlayerSendTextMessage(cid, 19, "Voce pegou uma destroy field rune!")
doSendMagicEffect(topos,29)
else
doPlayerSendCancel(cid, "Voce ja pegou a sua Destroy Field!")
end


end

return true
end