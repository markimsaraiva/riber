function onUse(cid, item, fromPosition, itemEx, toPosition)
 
    if getPlayerStorageValue(cid, 15901) == 0 then
            doPlayerSetStorageValue(cid, 15901, 1)
                 doSendMagicEffect(getCreaturePosition(cid), 13)
            doCreatureSay(cid, "*creeek*", TALKTYPE_ORANGE_1)
              doPlayerSendCancel(cid, "Voce ativou a alavanca.")
			 doPlayerSendTextMessage(cid, 18,"QUEST LOG UPDATE!")
			 doSendAnimatedText(getCreaturePosition(cid), "Quest UP!", 35)
    else
            doCreatureSay(cid, "*crrrk* It's stuck.", TALKTYPE_ORANGE_1)
    end
 
end