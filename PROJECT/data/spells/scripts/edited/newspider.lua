local poisonpowder = createConditionObject(CONDITION_POISON)
setConditionParam(poisonpowder, CONDITION_PARAM_DELAYED,1)
local damageTable = {
	
	{4,-3},
	{9,-2},
	{20,-1}
}

for i = 1, #damageTable do
    local t = damageTable[i]
addDamageCondition(poisonpowder, t[1], 4000, t[2])
end


local arr = {
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}


local area = createCombatArea(arr)


function onCastSpell(cid, var)
mayNotMove(cid, 1)
addEvent(function()
               if isCreature(cid) then
doAreaCombatHealth(cid, 1, getThingPos(cid), area, -1, -30, 20)
doAreaCombatCondition(cid, getThingPos(cid), area, poisonpowder, 255) 
doSendMagicEffect(getThingPos(cid), 16)
doRemoveCreature(cid)
               end
          end, 2000)
return true
end