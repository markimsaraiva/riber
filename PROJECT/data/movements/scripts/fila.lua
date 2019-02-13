function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

  if not isPlayer(cid) then
   return true
  end

  local storageee = 823143
  local time = 120 -- segundos
    local fila = nomenalista(cid)


	if (item.actionid == 14005) and (getPlayerGroupId(cid) > 2) then
          if getPlayerStorageValue(cid,storageee) <= os.time() then 
          doTeleportThing(cid, fromPosition,true)
          doBroadcastMessage("A sala de suporte esta aberta e um membro da nossa equipe esta aguardando para te ajudar, digite /suporte e entre agora mesmo na fila!")
          setPlayerStorageValue(cid,storageee,os.time() + time)
            return true
          else
            doPlayerSendTextMessage(cid,18,"espere o cooldown para pisar novamente!")
            doTeleportThing(cid, fromPosition,true)
            return true

          end


    elseif (item.actionid == 14006) then
      local templo = {x = 1112, y = 1062, z = 7}
      local zero = 0
      db.query("UPDATE `players` SET `fila` = "..zero.." WHERE `id` = "..getPlayerGUID(cid).." ;")
      doTeleportThing(cid, templo)
      doSendMagicEffect(getCreaturePosition(cid), 10)
      doPlayerSendTextMessage(cid,18,"Voce foi teleportado para o templo")
      return true

    end


--// 
 return true
end


--VERIFICA nomenalista
function nomenalista(cid)

 local player = db.getResult("SELECT `fila` FROM `players` WHERE id = "..getPlayerGUID(cid)..";")    
            if(player:getID() ~= -1) then
 
                while (true) do

                    fila = player:getDataString("fila")

                    if not(player:next()) then
                        break
                    end
          
                end
            
       player:free()
            end
    return fila

end
--FIM Vernomenalista