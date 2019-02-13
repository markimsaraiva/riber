
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end
 
-- QUEST --
function missao2(cid, message, keywords, parameters, node)
 
local stor1 = 15902 -- this is the same STOR1 from quests.xml
 
    if(not npcHandler:isFocused(cid)) then
        return false
    end
 
    if getPlayerStorageValue(cid,stor1) < 0 then
                npcHandler:say('Aperta a alavanca 2 logo trouxa, to te esperando.',cid)
            doPlayerSetStorageValue(cid, stor1, 0)
			doPlayerSendTextMessage(cid, 22,"QUEST LOG UPDATE!")
			 doSendAnimatedText(getCreaturePosition(cid), "Quest UP!", 35)
    elseif getPlayerStorageValue(cid, stor1) == 0 then
                npcHandler:say('Ainda estou esperando',cid)
    elseif getPlayerStorageValue(cid, stor1) == 1 then
                npcHandler:say('Obrigado por me liberar. tome seu dinheiro.',cid)
            doPlayerAddItem(cid, 2152, 25)
			doPlayerSendTextMessage(cid, 22,"QUEST LOG UPDATE!")
			 doSendAnimatedText(getCreaturePosition(cid), "Quest UP!", 35)
            doPlayerSetStorageValue(cid, stor1, 2)
                 doSendMagicEffect(getCreaturePosition(cid), 13)
    elseif getPlayerStorageValue(cid, stor1) == 2 then
                npcHandler:say('Voce ja me liberou. Vaza!',cid)
    end
end
 
local node1 = keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Trouxa,fala {yes}'})
      node1:addChildKeyword({'yes'}, missao2, {})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Seems like you are no better than them.', reset = true})
 
npcHandler:addModule(FocusModule:new())