local config = {
effect1 = 4, -- efeito ao pisar
effect2 = 5, -- efeito ao explodir
msg = "Voce foi acertado pela bomba.",-- msg que manda pra quem for acertado
mindmg = 300,-- dmg minimo que tira (nao é necessariamente o dano que vai sair do cara pois precisa desconsiderar as defesas dele antes)
maxdmg = 500,  -- dmg maximo que tira (nao é o dano que vai sair do cara)
selfi = false -- true/false pra ativar/desativar dano no cara que colocou a bomba caso ele mesmo passe na bomba.
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, config.effect2)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1) -- formula

local arr = {
{0, 1, 0},
{1, 3, 1}, -- area que vai acertar ao explodir a bomba
{0, 1, 0}
}
local area = createCombatArea(arr)
setCombatArea(combat, area)

  function onStepIn(cid, item, position)  
    local player = getPlayerByNameWildcard(getItemAttribute(item.uid, 'ref'))   
     doSendMagicEffect(position, config.effect1) 
     if isPlayer(cid) then return true end
     
      if isCreature(player) then      
            -- doSendAnimatedText(getCreaturePosition(player), "BOOM!", 190)  
            doCombat(player, combat, {
            position = position,
            type = 2
        })
   

     --if ((cid ~= player ) or (not isPlayer(cid)) or (not isCreature(player))) then  
            -- doAreaCombatHealth(player, COMBAT_FIREDAMAGE, position, area, -config.mindmg, -config.maxdmg, config.effect2) 
      
     	--doCreatureAddHealth(cid, -1 * math.random(config.mindmg, config.maxdmg))  
                   --doSendAnimatedText(getCreaturePosition(cid), "BOOM!", 190)

     	doSendMagicEffect(position, config.effect2)   
     	 end 

     	 if isPlayer(cid) then       
     	  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msg)    
     	  end    
     	  doRemoveItem(item.uid)
     	  return true
     	end
