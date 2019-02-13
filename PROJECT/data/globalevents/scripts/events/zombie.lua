local c = {
	teleportPosition = {x = 1131, y = 1064, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 651, y = 72, z = 6}, -- Where the teleport will take you 
	fromPosition = {x = 615, y = 40, z = 6}, -- top left cornor of the playground
	toPosition = {x = 698, y = 113, z = 6}, -- bottom right cornor of the playground
	availablePos = {},
}

function onTime ()
	doItemSetAttribute(doCreateTeleport(1387, c.teleportToPosition, c.teleportPosition), "aid", 1742)
	doBroadcastMessage("Zombie event starting in 3 minutes! The teleport will be closed when the event start!", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(3, 0)
	addEvent(startEvent, 3 * 60 * 1000)
	return true
end

function startEvent()
	doRemoveItem(getTileItemById(c.teleportPosition, 1387).uid, 1)
	if getGlobalStorageValue(3) > 0 then
		addEvent(spawnZombie, 10 * 1000)
		doBroadcastMessage("Good luck in the zombie event people! The teleport has closed!", MESSAGE_STATUS_WARNING)
	else
		doBroadcastMessage('Zombie Event hasn\'t started beacuse there were not enough players.')
	end
end

function spawnZombie()
	if getGlobalStorageValue(3) > 0 then
		if #c.availablePos == 0 then 
			for xin = c.fromPosition.x, c.toPosition.x do
				for yin = c.fromPosition.y, c.toPosition.y do 
					if isWalkable({x = xin, y = yin, z = c.fromPosition.z}, true, false, false) then
						table.insert(c.availablePos, #c.availablePos + 1, {x = xin, y = yin, z = c.fromPosition.z}) -- Note que não é mais de 1 andar
					end
				end 
			end 
		end 
		pos = c.availablePos[math.random(1, #c.availablePos)]
		doCreateMonster("Event Zombie", pos)
		doSendMagicEffect(pos, CONST_ME_MORTAREA)
		addEvent(spawnZombie, 10 * 1000)
	end
end