function onUse(cid, item, fromPosition, itemEx, toPosition)
 
    if getPlayerStorageValue(cid, 15902) == 0 then
            doPlayerSetStorageValue(cid, 15902, 1)
                 doSendMagicEffect(getCreaturePosition(cid), 13)
            doCreatureSay(cid, "*creeek*", TALKTYPE_ORANGE_1)
    
			 doPlayerSendTextMessage(cid, 22,"QUEST LOG UPDATE!")
			  doSendAnimatedText(getCreaturePosition(cid), "Quest UP!", 35)
    else
            doCreatureSay(cid, "*crrrk* It's stuck.", TALKTYPE_ORANGE_1)
    end
 
end