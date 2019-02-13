

function onThink(cid, interval)
	if(not isCreature(cid)) then
		return true
	end
if tostring(getPlayerName(cid)) == "Account Manager" then return true end
if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end
if isPlayer(cid) then

local tempo_auxiliar_segundo = 15296 

		if getPlayerStorageValue(cid,tempo_auxiliar_segundo) <= os.time() then
		setPlayerStorageValue(cid, tempo_auxiliar_segundo , os.time() + 1)


local contadori = 6729
		local contador_dia = 6722 
		local contador_mes = 6723
		local contador_ano = 6724
		
		local valor_da_storage_inicial = getPlayerStorageValue(cid, contadori)
		local valor_da_storage_dia = getPlayerStorageValue(cid,contador_dia)
		local valor_da_storage_mes = getPlayerStorageValue(cid,contador_mes)
		local valor_da_storage_ano = getPlayerStorageValue(cid,contador_ano)


		if valor_da_storage_inicial > 59 then
	
			setPlayerStorageValue(cid,contadori,0)
			setPlayerStorageValue(cid,contador_dia,getPlayerStorageValue(cid,contador_dia)+ 1 )
			doSendMagicEffect(getThingPos(cid), 28) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.
			doPlayerSendTextMessage(cid, 27, "Voce somou mais 1 dia!")

		
		elseif valor_da_storage_dia > 29 then
			
			setPlayerStorageValue(cid,6722,0)
			setPlayerStorageValue(cid,6723, getPlayerStorageValue(cid,contador_mes)+ 1 )
			doSendMagicEffect(getThingPos(cid), 29) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.
			doPlayerSendTextMessage(cid, 27, "Voce somou mais 1 mes!")

		
		elseif valor_da_storage_mes > 11 then
			
			setPlayerStorageValue(cid,6723,0)
			setPlayerStorageValue(cid,6724, getPlayerStorageValue(cid,contador_ano) + 1 )
			doSendMagicEffect(getThingPos(cid), 30) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.	
			doPlayerSendTextMessage(cid, 27, "Voce somou mais 1 ano!")


		end
		   
		doPlayerSetStorageValue(cid,contadori,  getPlayerStorageValue(cid, contadori) + 1)
		-- doPlayerSendTextMessage(cid, 27, ""..getPlayerStorageValue(cid, contadori).."")


else return false
	end


	end
	return true
end

