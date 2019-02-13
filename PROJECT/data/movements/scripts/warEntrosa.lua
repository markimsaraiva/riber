function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

  if not isPlayer(cid) then
   return true
  end



	if (item.actionid == 13331) and ( getPlayerStorageValue(cid,war_carlin_log) < 1) then

    doTeleportThing(cid, fromPosition,true)
    doPlayerSendCancel(cid, "Voce NAO esta em war!")

  
  end


  
    if (item.actionid == 13341) and ( getPlayerStorageValue(cid,war_carlin_log) == 1) then

    doTeleportThing(cid, fromPosition,true)
    doPlayerSendCancel(cid, "Voce ESTA em war! digite [/warcarlin exit] para sair!")
    

  end
--// 
 return true
end