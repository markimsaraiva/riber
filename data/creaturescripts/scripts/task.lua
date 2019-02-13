function onKill(cid, target, lastHit)

local storagedakilling = 14503
if getPlayerStorageValue(cid, storagedakilling) > 0 then

local questCreatures =
{    
["Crocodile"] = { 
questStorage = 14007,  
killsRequired = 300, 
raceName = "Crocodile"},  

["Tarantula"] = {
questStorage = 14008, 
killsRequired = 300, 
raceName = "Tarantula"},  
}


local creature = questCreatures[getCreatureName(target)]
             
if getPlayerStorageValue(cid, creature.questStorage) >= 0 then
                

if getPlayerStorageValue(cid, creature.questStorage) < creature.killsRequired then

  
doPlayerSetStorageValue(cid, creature.questStorage, getPlayerStorageValue(cid,creature.questStorage) + 1 )  
doSendAnimatedText(getCreaturePosition(cid), "" .. getPlayerStorageValue(cid,creature.questStorage) .. "/" .. creature.killsRequired .. "", 35)
 



-- doPlayerSetStorageValue(cid, creature.questStorage, getPlayerStorageValue(cid, creature.questStorage) + 1)
                        
end
                
end
        

end
return true
end 