function onLogin(cid)
		registerCreatureEvent(cid, "filogin") 
		registerCreatureEvent(cid, "filogout")

    return true
end


function onLogout(cid)
--LISTA--
			--ver nome na lista
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

			local fila= nomenalista(cid)

					if tonumber(nomenalista(cid)) > 0 then
						local zero = 0
						db.query("UPDATE `players` SET `fila` = "..zero.." WHERE `id` = "..getPlayerGUID(cid).." ;")
						return true
					end
--FIM LISTA--
    return true
end