function onUse(cid, item, fromPosition, itemEx, toPosition)
 
    if getPlayerStorageValue(cid, 25578) == 0 then
            doPlayerSetStorageValue(cid, 25578, 1)
                 doSendMagicEffect(getCreaturePosition(cid), 13)
            doCreatureSay(cid, "*creeek*", TALKTYPE_ORANGE_1)
              doPlayerSendCancel(cid, "You unlocked the prison cell.")

    else
            doCreatureSay(cid, "*crrrk* It's stuck.", TALKTYPE_ORANGE_1)
    end
 
end