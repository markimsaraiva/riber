local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end
        
-- HISTORIA START --
keywordHandler:addKeyword({'historia um'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "era uma vez um lobo que comeu ração velha e morreu"})
keywordHandler:addKeyword({'historia dois'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "era uma vez uma ração velha, foi comida por um lobo e morreu"})


npcHandler:addModule(FocusModule:new())