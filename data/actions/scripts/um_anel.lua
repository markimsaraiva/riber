function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 922066) == -1 then
		doPlayerSetStorageValue(cid, 922066, 1)
		doPlayerAddItem(cid,7697,1)
		doBroadcastMessage(getCreatureName(cid).." conseguiu completar a quest da New Promotion!! Parab�ns guerreiro!")
		doSendMagicEffect(getThingPos(cid), 28)
	else
		doPlayerSendCancel(cid, "Voc� j� pegou!")
	end
	return true
end