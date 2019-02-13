function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

  if not isPlayer(cid) then
   return true
  end


local city_storage = {423131,423132,423133,423134}

local cordenadas = {
		city1 = {x= 1096, y=1059 ,z=7},
		city2 = {x= 832,y=1143 ,z=7 },
		city3 = {x= 1319,y=1082 ,z=7 },
		cityglobal = {x=202 ,y=239 ,z=7 }		


	}

	if (item.actionid == 13351) and ( getPlayerStorageValue(cid,city_storage[1]) == -1) then

    doTeleportThing(cid, cordenadas.cityglobal)
    setPlayerStorageValue(cid,city_storage[1],1)
    doPlayerSendCancel(cid, "Voce acessou o TRADE GLOBAL!")
      doSendMagicEffect(getCreaturePosition(cid), 10)
      doSendMagicEffect(getCreaturePosition(cid), math.random(21,24))

 	


  
	elseif (item.actionid == 13352) and ( getPlayerStorageValue(cid,city_storage[2]) == -1) then

    doTeleportThing(cid, cordenadas.cityglobal)
    setPlayerStorageValue(cid,city_storage[2],1)
    doPlayerSendCancel(cid, "Voce acessou o TRADE GLOBAL!")
    doSendMagicEffect(getCreaturePosition(cid), 10)
      doSendMagicEffect(getCreaturePosition(cid), math.random(21,24))

 

	elseif (item.actionid == 13353) and ( getPlayerStorageValue(cid,city_storage[3]) == -1) then

    doTeleportThing(cid, cordenadas.cityglobal)
    setPlayerStorageValue(cid,city_storage[3],1)
    doPlayerSendCancel(cid, "Voce acessou o TRADE GLOBAL!")
    doSendMagicEffect(getCreaturePosition(cid), 10)
      doSendMagicEffect(getCreaturePosition(cid), math.random(21,24))

  


  
    elseif (item.actionid == 13354) and ( getPlayerStorageValue(cid,city_storage[1]) == 1) then
    setPlayerStorageValue(cid,city_storage[1],-1)
    doTeleportThing(cid, cordenadas.city1)
    doPlayerSendCancel(cid, "Voce voltou para sua cidade! 1")
        doSendMagicEffect(getCreaturePosition(cid), 10)
      doSendMagicEffect(getCreaturePosition(cid), math.random(21,24))

  

   elseif (item.actionid == 13354) and ( getPlayerStorageValue(cid,city_storage[2]) == 1) then

    setPlayerStorageValue(cid,city_storage[2],-1)
    doTeleportThing(cid, cordenadas.city2)
    doPlayerSendCancel(cid, "Voce voltou para sua cidade! 2")
        doSendMagicEffect(getCreaturePosition(cid), 10)
      doSendMagicEffect(getCreaturePosition(cid), math.random(21,24))

    

   elseif (item.actionid == 13354) and ( getPlayerStorageValue(cid,city_storage[3]) == 1) then
    setPlayerStorageValue(cid,city_storage[3], -1)
    doTeleportThing(cid, cordenadas.city3)
    doPlayerSendCancel(cid, "Voce voltou para sua cidade! 3")
    doSendMagicEffect(getCreaturePosition(cid), 10)
      doSendMagicEffect(getCreaturePosition(cid), math.random(21,24))


  end
--// 

 return true
end