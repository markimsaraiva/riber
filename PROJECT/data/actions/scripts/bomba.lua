local config = {
itemid = 2180, -- id da bomba 
duration = 2, -- duration antes de ser removida
effect1 = 3, -- efeito que sai ao colocar a bomba
msg1 = "Bomba ativada!", -- mensagem que sai ao ser colocado a bomba
effect2 = 5 -- efeito ao explodir
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, config.effect2)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1) -- formula

local arr = {
{0, 1, 0},
{1, 3, 1}, -- area que vai acertar ao explodir a bomba
{0, 1, 0},
}
local area = createCombatArea(arr)
setCombatArea(combat, area)

local function removeBomba(cid, pos, id)
    local item = getTileItemById(pos, id)
    if item.uid > 0 then
        local player = getPlayerByNameWildcard(getItemAttribute(item.uid, 'ref'))
        if isCreature(player) then        
            doCombat(player, combat, {
            pos = pos,
            type = 2
        })
        end
        doRemoveItem(item.uid)
    end
return true
end
    
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local item = doCreateItem(config.itemid, 1, toPosition)
    doItemSetAttribute(item, 'ref', getCreatureName(cid))
    doCreatureSay(cid, config.msg1, 20)
    doSendMagicEffect(toPosition, config.effect1)
    addEvent(removeBomba, config.duration * 1000, cid, toPosition, config.itemid)    
return true
end