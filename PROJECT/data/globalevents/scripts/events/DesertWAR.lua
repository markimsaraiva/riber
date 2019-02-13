function onTime ()

	create_tp_desert()
	doBroadcastMessage("Desert WAR starting in 3 minutes! The teleport will be closed when the event start!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(4, 0)
	setGlobalStorageValue(5, 0)
	addEvent(startDesert, 3 * 60 * 1000)
	return true
end

function startDesert()

remove_tp_desert()
	if getGlobalStorageValue(4) > 0 and getGlobalStorageValue(5) > 0 then
		doBroadcastMessage("Good luck in the desert war event people! The teleport has closed!", MESSAGE_STATUS_WARNING)		
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("Desert War hasn\'t started beacuse there were not enough players.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end