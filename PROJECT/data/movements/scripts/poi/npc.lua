function onStepIn(cid, item, position, fromPosition)


if getPlayerStorageValue(cid, 26990)  == 1 then
  doSendMagicEffect(getThingPos(cid),29)
   else
   
    doTeleportThing(cid, fromPosition, true)
      
   doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
   
   doPlayerPopupFYI(cid, "Responda a Pergunta!!!")
   
end
return true
end