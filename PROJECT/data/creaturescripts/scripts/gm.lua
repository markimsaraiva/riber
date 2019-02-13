function onLogin(cid)
	registerCreatureEvent(cid, "gamemaster")


	if getPlayerGroupId(cid) == 2 then 
		local tempo_tutor = 1117421
		local time = 15*60

		if getPlayerStorageValue(cid,tempo_tutor) < os.time() then
		setPlayerStorageValue(cid, tempo_tutor , os.time() + time)
		doBroadcastMessage("O Tutor "..getCreatureName(cid).." esta online!")
		end

		return true 

	elseif getPlayerGroupId(cid) >= 3 then 
		local tempo_gm = 127421
		local time = 5*60

		if getPlayerStorageValue(cid,tempo_gm) < os.time() then
		setPlayerStorageValue(cid,tempo_gm , os.time() + time)
		doBroadcastMessage("O GM "..getCreatureName(cid).." esta online!")
		end
		return true 		
	end


return true 
end

function onThink(cid, interval)
	if(not isCreature(cid)) then
		return true
	end
	if getPlayerGroupId(cid) < 2 then return true end
	if tostring(getPlayerName(cid)) == "Account Manager" then return true end
	if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end


local tempo_aux = 719421

		if getPlayerStorageValue(cid,tempo_aux) < os.time() then
		setPlayerStorageValue(cid, tempo_aux , os.time() + 3)
			--doPlayerSendTextMessage(cid,18, "online")

			--for i = 1,#getPlayersOnline() do
			-- doPlayerSendTextMessage(cid,18, "online: "..getCreatureName(getPlayersOnline()[i]).."")
			--if tostring(topilvl()) == getCreatureName(getPlayersOnline()[i]) then
					if getPlayerGroupId(cid) == 2 then 
								doSendMagicEffect(getCreaturePosition(cid), config.efeito)

						doSendAnimatedText(getCreaturePosition(cid), "[Tutor]", TEXTCOLOR_LIGHTBLUE)
						doSendMagicEffect(getCreaturePosition(cid), 30)
					elseif getPlayerGroupId(cid) >= 3 then
						doSendAnimatedText(getCreaturePosition(cid), "[GM]", TEXTCOLOR_LIGHTBLUE)
						doSendMagicEffect(getCreaturePosition(cid), 30)
					end

				--break
			--end

		--else 
	--return true

		end
	
	return true
end


		function topilvl()
			 local player = db.getResult("SELECT `name` FROM `players` WHERE group_id < '2' ORDER BY `level` DESC LIMIT 1;")    
			            if(player:getID() ~= -1) then
			 
			                while (true) do

			                    top = player:getDataString("name")
			               

			                    if not(player:next()) then
			                        break
			                    end
								
			                end
			            
			            end
						 player:free()
			     
			 


						 return top
		end 