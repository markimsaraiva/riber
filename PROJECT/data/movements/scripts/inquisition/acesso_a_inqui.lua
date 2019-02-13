function onStepIn(cid, item, position, fromPosition)


if getPlayerStorageValue(cid, 32125)  == 1 then
  doSendMagicEffect(getThingPos(cid),29)
   else
   
    doTeleportThing(cid, fromPosition, true)
      
   doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
   
   doPlayerPopupFYI(cid, "Voce tem que ter concluido a POI (quest itens 4 geracao) para acessar este portal!!!")
   
end
return true
end