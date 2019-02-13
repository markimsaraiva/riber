function onSay(cid, words, param, channel)
        if os.time() > getPlayerStorageValue(cid, 14001) then
                setPlayerStorageValue(cid, 14001, os.time()+1)
                local file = io.open('report_players.txt','a')
                file:write(getCreatureName(cid)..": "..tostring(param).."\n")
                file:close()
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING,'Voce Reportou o bug com sucesso!')
		
			if #getPlayersOnline() >= 1 then
			for i = 1, #getPlayersOnline() do
			if getPlayerAccess(getPlayersOnline()[i]) >= 3 then
			doPlayerSendTextMessage(getPlayersOnline()[i],19,"Um novo Player Reportou Bug!")
			end

			end
			end
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING,'Voce nao pode mandar outra mensagem ainda. Falta(m) '..(math.ceil((getPlayerStorageValue(cid, 14001)-os.time())/60)+1)..' minuto(s) para voce poder mandar uma nova mensagem.')
        end
return true
end