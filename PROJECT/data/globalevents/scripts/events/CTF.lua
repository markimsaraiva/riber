function onTime ()
create_tp_ctf( )
	doBroadcastMessage("CTF Event starting in 4 minutes! The teleport will be closed when the event start!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(6, 0)
	setGlobalStorageValue(7, 0)
	setGlobalStorageValue(8, 0)
	setGlobalStorageValue(9, 0)
	setGlobalStorageValue(10, 0)
	setGlobalStorageValue(11, 0)
	setGlobalStorageValue(12, 0)	
	addEvent(startCtf, 4 * 60 * 1000)
	return true
end

function startCtf()
	remove_tp_ctf( )
	if getGlobalStorageValue(6) > 4 and getGlobalStorageValue(7) > 0 then
		doBroadcastMessage("Good luck in the CTF Event people! The teleport has closed!", MESSAGE_STATUS_WARNING)		
		addEvent(endCtf, 30 * 60 * 1000)
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("CTF Event hasn\'t started beacuse there were not enough players.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
				doPlayerSetTown(cid, 1)
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			setPlayerStorageValue(cid, 71, 0)
			setPlayerStorageValue(cid, 72, 0)
			doRemoveCondition(cid, CONDITION_OUTFIT)
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end

function endCtf()
	if getGlobalStorageValue(10) == 1 then
		return false
	end
	
	if getGlobalStorageValue(9) > getGlobalStorageValue(8) then
		doBroadcastMessage("CTF Event encerrado! Time vermelho foi o vencedor! "..getGlobalStorageValue(9).." X "..getGlobalStorageValue(8)..". Recompensa: "..exp_ctf.."kk de ExP e "..coin_ctf.." Event Coins.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 72) == 1 then
			recompensa_ctf( cid )
			end
		end
	elseif getGlobalStorageValue(8) > getGlobalStorageValue(9) then
		doBroadcastMessage("CTF Event encerrado! Time verde foi o vencedor! "..getGlobalStorageValue(8).." X "..getGlobalStorageValue(9)..". Recompensa: "..exp_ctf.."kk de ExP e "..coin_ctf.." Event Coins.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 then
				recompensa_ctf(cid)
			end
		end
	elseif getGlobalStorageValue(8) == getGlobalStorageValue(9) then
		doBroadcastMessage("CTF Event encerrado! Empate de "..getGlobalStorageValue(8).." X "..getGlobalStorageValue(9).."! Todos participantes irão ganhar uma parte da recompensa: "..empate_ctf.."kk de ExP e "..coinempate_ctf.." Event Coins.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
			empatado_ctf( cid )
			end
		end
	end
	
	for _, cid in ipairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, 71) == 1 or getPlayerStorageValue(cid, 72) == 1 then
			doPlayerSetTown(cid, 1)
			setPlayerStorageValue(cid, 71, 0)
			setPlayerStorageValue(cid, 72, 0)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doRemoveCondition(cid, CONDITION_INFIGHT)
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doPlayerSave(cid)
		end
		if getPlayerStorageValue(cid, 82) >= os.time() then
		setPlayerStorageValue(cid, 82, 0)

esquerda_verde()
	end
	if getPlayerStorageValue(cid, 83) >= os.time() then
	setPlayerStorageValue(cid, 83, 0)
direita_red()

	end
	end
	return true
end