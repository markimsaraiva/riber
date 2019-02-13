local config = {itemid = 2180, -- Id do item que ira explodir 
duration = 10, -- duração para ser removida
actionid = 13245, --Nao mecha
effect = 1, -- efeito
msg = "Planted explosive mine!", -- mensagem
cooldown = 2,  --- tempo entre um uso e outro em segundo
}

function onCastSpell(cid, var) 
if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then	  
setPlayerStorageValue(cid, 55695, os.time())    
local position = getCreaturePosition(cid)   

local item = doCreateItem(config.itemid, 1, position)    
setItemAid(item, config.actionid)    
 doItemSetAttribute(item, 'ref', getCreatureName(cid))
doCreatureSay(cid, config.msg, 20)    
doSendMagicEffect(position, config.effect)    
addEvent(removeBomba, config.duration * 1000, position, config.itemid)  
else
doPlayerSendCancel(cid, "Aguarde "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." segundos para plantar outra bomba!")	
end
return true
end
