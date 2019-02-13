
function onUseWeapon(cid, var)
if getPlayerStorageValue(cid,14041) = -1 then

return doPlayerSendTextMessage(cid,18,"voce nao pode usar mais!") and false

else

	return doPlayerSendTextMessage(cid,18,"muito boa")
end
end
 