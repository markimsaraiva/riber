

function onSay(cid, words, param)
	if(not checkExhausted(cid, 696, 6)) then
		return false
	end
		if not getTilePzInfo(getThingPos(cid)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "{Support System}: Você precisa estar em ProtectZone.")
		return true
	end

	local name = getCreatureName(cid)

--VERIFICA DB
function lista()

	number = 1
	primeiro = ''
 local player = db.getResult("SELECT `fila`,`name`, `level` FROM `players` WHERE group_id < '2' AND `fila` > '0' ORDER BY `fila` ASC ;")    
            if(player:getID() ~= -1) then
 
                while (true) do

                	if number == 1 then
                	  primeiro = player:getDataString("name")
                	end

                    name = player:getDataString("name")
                    level = player:getDataString("level")

                    fila = player:getDataString("fila")
                    number = number + 1


                    if not(player:next()) then
                        break
                    end
					
                end
            
			 player:free()
            end

            if fila == nil then
            	fila = tonumber(0)
            end

	return fila,primeiro,number
  			


end
--FIM VERIFICACAO

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

local b,primeiro,number= lista()

	if param == '' then
		if tonumber(nomenalista(cid)) > 0 then
			doPlayerSendTextMessage(cid,18,"O seu nome ja esta na lista! Aguarde ser chamado! Digite !supportlist para ver a lista de espera. ")
			return true
		else
			local um = 1
			doPlayerSendTextMessage(cid,18,""..b.."")
			db.query("UPDATE `players` SET `fila` = "..b+um.." WHERE `id` = "..getPlayerGUID(cid).." ;")
			  local area_espera = {x = 114, y = 160, z = 6}        
      		  doTeleportThing(cid, area_espera)
      		   doSendMagicEffect(getCreaturePosition(cid), 10)
			doPlayerSendTextMessage(cid,19,"{SUPPORT} Voce foi adicionado a support list! Digite !supportlist para ver a lista de espera. ")

		end
		return true
	end

if param == 'list' then

listaa = ''
numero = 1
 local player = db.getResult("SELECT `fila`,`name`, `level` FROM `players` WHERE group_id < '2' AND `fila` > '0' ORDER BY `fila` ASC LIMIT 20;")    
            if(player:getID() ~= -1) then
 
                while (true) do

                    name = player:getDataString("name")
                    level = player:getDataString("level")

                    fila = player:getDataString("fila")
                    listaa = listaa.. "\n#"..string.format("%5s",numero.."  "..name.." - "..level.." ")
                    numero = numero+ 1


                    if not(player:next()) then
                        break
                    end
					
                end
            
			 player:free()
            end

            if lista == nil then
            	doPlayerSendTextMessage(cid,18,"nao existem players na lista!")
            else

            	local dialog  = "[+] SUPPORT LIST [+]\n"..listaa.."\n\n [+] SUPPORT LIST [+]\n\n"
	return doPlayerPopupFYI(cid, dialog)

			end
end


if param == 'next' then
	if getPlayerGroupId(cid) > 2 then

		if primeiro == '' then
					doPlayerSendCancel(cid,'Nao existem proximos na lista!')
			doSendMagicEffect(getThingPos(cid), 2)
		return true
		else
		
		local cord1 = {x = 119, y = 157, z = 6}
		local cord2 = {x = 124, y = 164, z = 6}
		local tp_templo = {x = 1112, y = 1062, z = 7} 
		 
		-- if (number == 2) and (tonumber(nomenalista(cid))>0 )then
		-- 		local b,primeiro,number= lista()
		-- 		local nextlista = {x = 123, y = 161, z = 6}        

		--         doTeleportThing(getCreatureByName(primeiro), nextlista)
		--         doPlayerSendTextMessage(getCreatureByName(primeiro),19,"{Support} Qual e a sua duvida?")
		--         local zero = 0
		--         db.query("UPDATE `players` SET `fila` = "..zero.." WHERE `id` = "..getPlayerGUID(cid).." ;")
		--         return true
  --   	end


  		local tid = getCreatureByName(primeiro)
		local pos = getCreaturePosition(tid)	
		if isInArea(pos, cord1, cord2) and isPlayer(tid) == true then
			   doTeleportThing(tid, getTownTemplePosition(getPlayerTown(tid)))
               doPlayerSendTextMessage(tid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo!")
               local zero = 0
			   db.query("UPDATE `players` SET `fila` = "..zero.." WHERE `id` = "..getPlayerGUID(tid).." ;")
		end
		



		-- for _, qid in pairs(getPlayersOnline()) do  
		-- if isInArea(getThingPos(qid), cord1, cord2) then 

               
		-- end
		-- end


		local b,primeiro,number= lista()
		local nextlista = {x = 123, y = 161, z = 6}        

		local espera1 = {x = 108, y = 156, z = 6}        
		local espera2 = {x = 117, y = 164, z = 6}        


		if isInArea(pos, espera1, espera2) and isPlayer(tid) == true then
        doTeleportThing(getCreatureByName(primeiro), nextlista)
        doPlayerSendTextMessage(getCreatureByName(primeiro),19,"{Support} Qual e a sua duvida?")
    	end
    	end

	else
		doPlayerSendCancel(cid,'voce nao pode usar esse comando.')
			doSendMagicEffect(getThingPos(cid), 2)
		return true
	end
end




 




 
	return true
end