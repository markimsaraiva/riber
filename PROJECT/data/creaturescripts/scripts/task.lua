function onKill(cid, target, lastHit)

local storagedakilling = 14503
if getPlayerStorageValue(cid, storagedakilling) > 0 then

local questCreatures =
{    
["Crocodile"] = { 
questStorage =  14007,  
killsRequired = 100, 
raceName = "Crocodile"},  

["Tarantula"] = {
questStorage = 14008, 
killsRequired = 300, 
raceName = "Tarantula"},  
}

local mermao = {


  [14007] = {questStorage = {14007}},
  [14008] = {questStorage = {14008}}

}



for vod,ka in pairs(mermao) do



for var = 1,#ka.questStorage do
             
if getPlayerStorageValue(cid, 14500) == ka.questStorage[var] then
-- if getPlayerStorageValue(cid, mermao.items[var]) < mermao.precisa then


  
doPlayerSetStorageValue(cid, ka.questStorage[var], getPlayerStorageValue(cid, ka.questStorage[var]) + 1 )  
doPlayerSendTextMessage(cid, 18, "Parabens!")
doCreatureSay(cid, "" .. getPlayerStorageValue(cid, ka.questStorage[var]) .. "/", TALKTYPE_ORANGE_1)
doPlayerSendTextMessage(cid, 18, ""..getPlayerStorageValue(cid, ka.questStorage[var]).."")
-- doPlayerSendTextMessage(cid, 18,"Até o momento, " .. getCreatureStorage(cid, getPlayerStorageValue(cid,mermao.items)) .. " " .. mermao.raceName .. " mortos, voce precisa matar " .. creature.killsRequired .. ".")
 



-- doPlayerSetStorageValue(cid, creature.questStorage, getPlayerStorageValue(cid, creature.questStorage) + 1)
 -- end                       

 
           
end
  end      

end
end
return true
end 