local storagedodge = 98798644 -- storage do dodge
local cor = 250 -- cor do texto
local effect = 31 -- id do magic effect 
local msg = "Dodge!" -- msg
 
local dodge = { 
    {min = 1, max = 5, chance = 1}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
	{min = 6, max = 10, chance = 2}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 11, max = 15, chance = 3}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 16, max = 20, chance = 4}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 21, max = 25, chance = 5}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 26, max = 30, chance = 6}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 31, max = 35, chance = 7}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 36, max = 40, chance = 8}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 41, max = 45, chance = 9}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 46, max = 50, chance = 10}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 51, max = 55, chance = 11}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 56, max = 60, chance = 12}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 61, max = 65, chance = 13}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 66, max = 70, chance = 14}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 71, max = 75, chance = 15}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 76, max = 80, chance = 16}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 81, max = 85, chance = 17}, -- se o dodge tiver entre 1 e 2 tem 10% de chance de da dodge.
    {min = 86, max = 90, chance = 18}, -- vocês pode adicionar mas se quiserem
    {min = 91, max = 95, chance = 19},
    {min = 96, max = 100, chance = 20},
    {min = 101, max = math.huge, chance = 20}
}
 
function onStatsChange(cid, attacker, type, combat, value)
    if not isCreature(cid) then
        return false
    end
    for _, tudo in pairs(dodge) do
        if getPlayerStorageValue(cid, storagedodge) >= tudo.min and getPlayerStorageValue(cid, storagedodge) <= tudo.max then
            local chancex = math.random(1, 100)
            if chancex <= tudo.chance then
                if combat ~= COMBAT_HEALING then
                    doSendMagicEffect(getCreaturePosition(cid), effect)
                    doSendAnimatedText(getCreaturePosition(cid), msg, cor)
                    return false
                end
            end
        end
    end
    return true
end