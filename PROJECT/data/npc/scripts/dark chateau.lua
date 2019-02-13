local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
 
-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end
 
 
-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({'dark chateau'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para a Quest Dark Chateau? Eu irei cobrar 5kk para a sua morte chegar! HaHaHaHaHa!'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 250, cost = 5000000, destination = {x=1361, y=754, z=7} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Ok Obrigado Boa Escolha HAHA.'})
 
 local travelNode = keywordHandler:addKeyword({'Dark Chateau'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para a Quest Dark Chateau? Eu irei cobrar 5kk para a sua morte chegar! HaHaHaHaHa!'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 250, cost = 5000000, destination = {x=1361, y=754, z=7} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Ok Obrigado Boa Escolha HAHA.'})
-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())

