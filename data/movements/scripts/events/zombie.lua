function onStepIn(cid, item, position, fromPosition)
	if getPlayerAccess(cid) < 4 then
		setGlobalStorageValue(3, getGlobalStorageValue(3)+1)
		doRemoveCondition(cid, CONDITION_POISON)
		doRemoveCondition(cid, CONDITION_FIRE)
		doPlayerPopupFYI(cid, "-BR-\nVoc� entrou! Aguarde o �nicio do evento. Voc� precisa desviar dos zombies o m�ximo que puder. O player que sobreviver mais tempo ganha a recompensa.\n\n-ENG-\nYou entered! Wait for the event start. You need to dodge the zombies as much as possible. The player who survive longer earn reward.")
	end
	return true
end