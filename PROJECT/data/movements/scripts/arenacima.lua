function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

  if not isPlayer(cid) then
   return true
  end


	if (item.actionid == 14001) and ( getPlayerStorageValue(cid,yok) < 1) then
    setPlayerStorageValue(cid,yok,1)
    doPlayerSendCancel(cid, "Bem vindo a Arena Livre!")
                doSendMagicEffect(getThingPos(cid), 30)


  end


  
    if (item.actionid == 14002) and ( getPlayerStorageValue(cid,yok) == 1) then

       setPlayerStorageValue(cid,yok,-1)
    doPlayerSendCancel(cid, "Voce saiu da Arena Livre!")
                doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)

    
  end
--// 
 return true
end