function onThink(cid,think,interval,topos)

   if #getPlayersOnline() >= 1 then
     for i = 1,#getPlayersOnline() do
   
		   
		local contadori = 6729
		local contador_dia = 6722 
		local contador_mes = 6723
		local contador_ano = 6724
		
		local valor_da_storage_inicial = getPlayerStorageValue(getPlayersOnline()[i], contadori)
		local valor_da_storage_dia = getPlayerStorageValue(getPlayersOnline()[i],contador_dia)
		local valor_da_storage_mes = getPlayerStorageValue(getPlayersOnline()[i],contador_mes)
		local valor_da_storage_ano = getPlayerStorageValue(getPlayersOnline()[i],contador_ano)
	
	-- if getPlayerStorageValue(getPlayersOnline()[i], contadori) == -1 then
				-- setPlayerStorageValue(getPlayersOnline()[i],contadori,0)
	-- elseif getPlayerStorageValue(getPlayersOnline()[i],contador_dia) == -1 then
					-- setPlayerStorageValue(getPlayersOnline()[i],6722,0)
-- elseif  getPlayerStorageValue(getPlayersOnline()[i],contador_mes) == -1 then
			-- setPlayerStorageValue(getPlayersOnline()[i],6723,0)
-- elseif getPlayerStorageValue(getPlayersOnline()[i],contador_ano) == -1 then
					-- setPlayerStorageValue(getPlayersOnline()[i],6724,0)

-- end

		if valor_da_storage_inicial > 10 then
	
			setPlayerStorageValue(getPlayersOnline()[i],contadori,0)
			setPlayerStorageValue(getPlayersOnline()[i],contador_dia,getPlayerStorageValue(getPlayersOnline()[i],contador_dia)+ 1 )
			doSendMagicEffect(getThingPos(getPlayersOnline()[i]), 28) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.
			doPlayerSendTextMessage(getPlayersOnline()[i], 27, "Voce somou mais 1 dia!")

		
		elseif valor_da_storage_dia > 29 then
			
			setPlayerStorageValue(getPlayersOnline()[i],6722,0)
			setPlayerStorageValue(getPlayersOnline()[i],6723, getPlayerStorageValue(getPlayersOnline()[i],contador_mes)+ 1 )
			doSendMagicEffect(getThingPos(getPlayersOnline()[i]), 29) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.
			doPlayerSendTextMessage(getPlayersOnline()[i], 27, "Voce somou mais 1 mes!")

		
		elseif valor_da_storage_mes > 11 then
			
			setPlayerStorageValue(getPlayersOnline()[i],6723,0)
			setPlayerStorageValue(getPlayersOnline()[i],6724, getPlayerStorageValue(getPlayersOnline()[i],contador_ano) + 1 )
			doSendMagicEffect(getThingPos(getPlayersOnline()[i]), 30) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.	
			doPlayerSendTextMessage(getPlayersOnline()[i], 27, "Voce somou mais 1 ano!")


		end
		   
		doPlayerSetStorageValue(getPlayersOnline()[i],contadori,  getPlayerStorageValue(getPlayersOnline()[i], contadori) + 1)
		-- doPlayerSendTextMessage(getPlayersOnline()[i], 27, ""..getPlayerStorageValue(getPlayersOnline()[i], contadori).."")

		--apenas para testes --
	  -- doPlayerSendTextMessage(getPlayersOnline()[i], 27, "Voce ganhou 1 ponto por estar online!")
	   	   -- doPlayerSendTextMessage(getPlayersOnline()[i], 27, "Voce tem "..getPlayerStorageValue(getPlayersOnline()[i],contadori).."Pontos!")

		   
     end
   end

   return true
end