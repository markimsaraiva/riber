function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerEffectLevel(cid) == 100 then
		return doPlayerSendCancel(cid, "Voc� j� est� no n�vel m�ximo de efeito!")
	end
    if doRemoveItem(item.uid) then
        if item.itemid == 10133 then
			local ammount = 0
			if isKnight(cid) then
				setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 105)
				ammount = 105
			elseif isSorcerer(cid) or isDruid(cid) then
				setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 35)
				ammount = 35
			elseif isPaladin(cid) then
				setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 70)
				ammount = 70
			end
			doPlayerAddEffectLevel(cid)
			doPlayerSendTextMessage(cid, 25, "Voc� upou 1 n�vel de efeito. Voc� recebeu mais "..ammount.." de HP extra. N�vel: ["..getPlayerEffectLevel(cid).."/100]")
			doSendMagicEffect(getCreaturePosition(cid), 29)
		elseif item.itemid == 10134 then
			local ammount = 0
			if isKnight(cid) then
				setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 35)
				ammount = 35
			elseif isDruid(cid) or isSorcerer(cid) then
				setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 210)
				ammount = 210
			elseif isPaladin(cid) then
				setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 105)
				ammount = 105
			end
			doPlayerAddEffectLevel(cid)
			doPlayerSendTextMessage(cid, 25, "Voc� upou 1 n�vel de efeito. Voc� recebeu mais "..ammount.." de MP extra. N�vel: ["..getPlayerEffectLevel(cid).."/100]")
			doSendMagicEffect(getCreaturePosition(cid), 30)
		end
	end
    return true
end