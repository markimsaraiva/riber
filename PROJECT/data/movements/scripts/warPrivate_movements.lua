local tableCities = {
	[1] = warPrivate_city1,
	[2] = warPrivate_city2,
	[3] = warPrivate_city3,
	[4] = warPrivate_city4,
	[5] = warPrivate_city5
}

function onStepIn(creature, item, position, fromPosition)
	local player = isPlayer(cid)
	if not player then
		return true
	end

	if setPlayerStorageValue(cid,warPrivate_storage) > 0 then
	    setPlayerStorageValue(cid,warPrivate_UE, 0)
		setPlayerStorageValue(cid,44672, 0)
		setPlayerStorageValue(cid,warPrivate_RUNES, 0)
		player:unregisterEvent("WarPrivateDeath")		
		if (tableCities[setPlayerStorageValue(cid,warPrivate_storage)]) then
			local lib = tableCities[setPlayerStorageValue(cid,warPrivate_storage)]			
			if (setPlayerStorageValue(cid,warPrivate_Guild) == 1) then
				setGlobalStorageValue(lib.war.count1, getGlobalStorageValue(lib.war.count1) - 1)
				doBroadcastMessage("time 1: "..getGlobalStorageValue(lib.war.count1))
			elseif (setPlayerStorageValue(cid,warPrivate_Guild) == 2) then
				setGlobalStorageValue(lib.war.count2, getGlobalStorageValue(lib.war.count2) - 1)
				doBroadcastMessage("time 2: "..getGlobalStorageValue(lib.war.count2))
			end
			setPlayerStorageValue(cid,warPrivate_Guild, 0)
			setPlayerStorageValue(cid,warPrivate_storage, 0)			
		end
		doTeleportThing(cid, getTownTemplePosition(1))
	else 
		doPlayerSendCancel(cid, text)
    	doCreatureSay(cid, "You no are in war.", TALKTYPE_ORANGE_1)

	end

	return true
end