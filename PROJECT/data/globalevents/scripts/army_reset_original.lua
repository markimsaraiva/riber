-- ARMY_LEVEL = 2014159  
-- ARMY_EXPERIENCE = 2014160 

configXixiEvent = {
				days = {

					['Sunday'] = {'23:00:00'}
				}	
			}

			local daysOpen = {}
			for k, v in pairs(configXixiEvent.days) do
				table.insert(daysOpen, k)
			end

-- function onThink(cid,think,interval,topos)

	-- db.executeQuery("UPDATE `player_storage` SET `value`= 1 WHERE `key` = 2014159 ;")
	-- db.executeQuery("UPDATE `player_storage` SET `value`= 0 WHERE `key` = 2014160 ;")
      -- db.executeQuery("UPDATE `players` SET `army_level` = 0  WHERE `id` = " .. getPlayerGUID(cid) .. ";")
      -- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "O sistema de patente foi reiniciado, voce e: "..ARMY[#ARMY][3].." agora!")

-- doBroadcastMessage("pronto!")


 -- return true 
-- end

function onThink(interval)
				if isInArray(daysOpen, os.date("%A")) then
					if isInArray(configXixiEvent.days[os.date("%A")], os.date("%X", os.time())) then
												db.executeQuery("UPDATE `player_storage` SET `value`= 1 WHERE `key` = 2014159 ;")
												db.executeQuery("UPDATE `player_storage` SET `value`= 0 WHERE `key` = 2014160 ;")
												db.executeQuery("UPDATE `players` SET `reiniciar_patente` = 5;")
												
												setGlobalStorageValue(PATENTI, 0)
												setGlobalStorageValue(PATENTI, os.time() + TEMPO_PATENTI)


												
						if #getPlayersOnline() >= 1 then
									for i = 1,#getPlayersOnline() do
											
										db.executeQuery("UPDATE `players` SET `army_level` = 0  WHERE `id` = " .. getPlayerGUID(getPlayersOnline()[i]) .. ";")
										doPlayerSendTextMessage(getPlayersOnline()[i], MESSAGE_STATUS_CONSOLE_RED, "O sistema de patente foi reiniciado!")
										
										if valor_da_patente(getPlayersOnline()[i]) == 5 then
										db.executeQuery("UPDATE `players` SET `reiniciar_patente` = 10  WHERE `id` = " .. getPlayerGUID(getPlayersOnline()[i]) .. ";")
										end		
										
											
									end
						 


   
						end

						
							
							
															salvaserv()
	
					end

				end
				return true
			end

 
