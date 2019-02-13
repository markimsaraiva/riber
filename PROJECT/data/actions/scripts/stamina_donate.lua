
function onUse(cid, item, frompos, item2, topos)


if item.aid == getPlayerGUID(cid) then
   doCreatureSay(cid, "Ahhhh!!", TALKTYPE_ORANGE_1)
   doPlayerSendTextMessage(cid,22,"Voce encheu sua Stamina!")

-- if item.itemid == 12505 then
-- doBroadcastMessage(" item ok")
-- end


	doPlayerSetStamina(cid, 2520)
	doSendMagicEffect(frompos, 1)
	-- doRemoveItem(item.uid, 1)
	else
	  doPlayerSendTextMessage(cid,22,"Esse refil de Stamina Donate nao te pertence!")
	  	doSendMagicEffect(frompos, CONST_ME_POFF)


	end
return 1
end