function onCastSpell(cid, var)
local pos = getPlayerPosition(cid)
local maxsummon = 3 


local summons = getCreatureSummons(cid)


local possible = {


{x = pos.x, y = pos.y - 2, z = pos.z, stackpos = 0},
{x = pos.x, y = pos.y + 2, z = pos.z, stackpos = 0},
{x = pos.x - 2, y = pos.y, z = pos.z, stackpos = 0},
{x = pos.x + 2, y = pos.y, z = pos.z, stackpos = 0},
{x = pos.x - 2, y = pos.y - 1, z = pos.z, stackpos = 0},
{x = pos.x + 2, y = pos.y - 1, z = pos.z, stackpos = 0},
{x = pos.x + 2, y = pos.y + 1, z = pos.z, stackpos = 0},
{x = pos.x - 2, y = pos.y + 1, z = pos.z, stackpos = 0},
{x = pos.x - 1, y = pos.y - 2, z = pos.z, stackpos = 0},
{x = pos.x + 1, y = pos.y - 2, z = pos.z, stackpos = 0},
{x = pos.x + 1, y = pos.y + 2, z = pos.z, stackpos = 0},
----
{x = pos.x, y = pos.y - 1, z = pos.z, stackpos = 0},
{x = pos.x, y = pos.y + 1, z = pos.z, stackpos = 0},
{x = pos.x - 1, y = pos.y, z = pos.z, stackpos = 0},
{x = pos.x + 1, y = pos.y, z = pos.z, stackpos = 0},
{x = pos.x - 1, y = pos.y + 1, z = pos.z, stackpos = 0},
{x = pos.x - 1, y = pos.y - 1, z = pos.z, stackpos = 0},
{x = pos.x + 1, y = pos.y - 1, z = pos.z, stackpos = 0},
{x = pos.x + 1, y = pos.y + 1, z = pos.z, stackpos = 0},
------
{x = pos.x - 1, y = pos.y + 2, z = pos.z, stackpos = 0}


} 


summonpos = 0


if(table.maxn(summons) < maxsummon) then 


for i = 1, #possible do
if isWalkable(possible[i], true, false, true) then
summonpos = possible[i]
end
end


if summonpos ~= 0 then
doConvinceCreature(cid, doCreateMonster("Clone Spider", summonpos))
doSendMagicEffect(pos, 12)
doSendMagicEffect(summonpos, 10)
doCreatureSay(cid, "Volatile Spiderling!", 20)
return true
else
doPlayerSendCancel(cid, "There is not enough room.")
doSendMagicEffect(pos, 2)
return false
end
else
doSendMagicEffect(pos, 2)
doPlayerSendCancel(cid, "You cannot summon more than "..maxsummon.." creature(s).")
return false
end
end 