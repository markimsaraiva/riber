BOMB_ITEMID = 10571
BARREL_ITEMID = 9468
POWERUP_ITEMID = {10571, 8304, 2195}
PLAYER_SPEED = 100
MAX_PLAYER_SPEED = 200
SPAWN_POSITIONS = {
	Position(1000, 1000, 7),
	Position(1001, 1002, 7)
}

local BOMB_CROSS1X1 = {
	{0, 1, 0},
	{1, 3, 1},
	{0, 1, 0}
}

local BOMB_CROSS2X2 = {
	{0, 0, 1, 0, 0},
	{0, 0, 1, 0, 0},
	{1, 1, 3, 1, 1},
	{0, 0, 1, 0, 0},
	{0, 0, 1, 0, 0}
}

local BOMB_CROSS3X3 = {
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{1, 1, 1, 3, 1, 1, 1},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}

function Player.resetVariables(self)
	-- add back the speed
	local changeSpeed = Self.changeSpeed
	changeSpeed(self, -self:getSpeed())
	changeSpeed(self, self:getBaseSpeed())

	-- remove mute condition
	self:removeCondition(CONDITION_MUTED, CONDITIONID_DEFAULT)

	-- bomb level
	self:setStorageValue(1000, -1)

	-- teleport
	self:teleportTo(self:getTown():getTemplePosition())
end

local condition = Condition(CONDITION_MUTED, CONDITIONID_DEFAULT)
function Player.setVariables(self)
	-- change speed
	self:changeSpeed(-self:getSpeed() + PLAYER_SPEED)

	-- add mute
	condition:setTicks(24 * 60 * 1000)
	self:addCondition(condition)

	-- bomb level
	self:setStorageValue(1000, 1)
end

function Position.executeBomb(self)
	local tile = Tile(self)
	if not tile then
		return false
	end

	local barrelItem = tile:getItemById(BARREL_ITEMID)
	if barrelItem then
		self:sendMagicEffect(CONST_ME_HITBYFIRE)

		if math.random(100) >= 80 then
			local powerItem = barrelItem:transform(POWERUP_ITEMID[math.random(#POWERUP_ITEMID)])
			if powerItem then
				barrelItem:setAttribute(ITEM_ATTRIBUTE_ACTIONID, 7000)
			end
		else
			barrelItem:remove()
		end
	end

	local topCreature = tile:getTopCreature()
	if topCreature then
		print("Dead: ".. topCreature:getName())
	end

	return true
end

function onTargetTile_bombOne(creature, position)
	return position:executeBomb()
end

function onTargetTile_bombTwo(creature, position)
	return position:executeBomb()
end

function onTargetTile_bombThree(creature, position)
	return position:executeBomb()
end

local bombOne = Combat()
bombOne:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
bombOne:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile_bombOne")
bombOne:setArea(createCombatArea(BOMB_CROSS1X1))

local bombTwo = Combat()
bombTwo:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
bombTwo:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile_bombTwo")
bombTwo:setArea(createCombatArea(BOMB_CROSS2X2))

local bombThree = Combat()
bombThree:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
bombThree:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile_bombThree")
bombThree:setArea(createCombatArea(BOMB_CROSS3X3))

local function executeBomb(cid, position, time)
	local player = Player(cid)
	if not player then
		return
	end

	player:say((time == 0 and "BOOM!" or time), TALKTYPE_MONSTER_SAY, false, 0, position)
	if time == 0 then
		local bombItem = Tile(position):getItemById(BOMB_ITEMID)
		if bombItem then
			bombItem:remove()
		end

		local bombLevel = player:getStorageValue(1000)
		local bomb = bombOne:execute(player, positionToVariant(position))
		if bomb == 2 then
			bomb = bombTwo:execute(player, positionToVariant(position))
		elseif bomb == 3 then
			bomb = bombThree:execute(player, positionToVariant(position))
		end

		return bomb
	end

	addEvent(executeBomb, 1000, cid, position, time - 1)
end

function onSay(player, words, param)
	local playerPosition = player:getPosition()
	local bomb = Game.createItem(BOMB_ITEMID, 1, playerPosition)
	if bomb then
		executeBomb(player:getId(), playerPosition, 3, 3, 3)
	end

	return false
end
