local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end
 
-- QUEST --
function PerguntaPoi(cid, message, keywords, parameters, node)
 
local stor1 = 26990 -- this is the same STOR1 from quests.xml
 
    if(not npcHandler:isFocused(cid)) then
        return false
    end
 
    if getPlayerStorageValue(cid,stor1) < 0 then
                npcHandler:say('Excelente! Voce acertou! Pode continuar!',cid)
            doPlayerSetStorageValue(cid, stor1, 1)
			doPlayerSendTextMessage(cid, 35, "Quest Log UP!")
  
    elseif getPlayerStorageValue(cid, stor1) == 1 then
                npcHandler:say('Voce ja respondeu a pergunta! Pode continuar!',cid)
 
  end
end

function Morrer(cid, message, keywords, parameters, node)
 
 
    if(not npcHandler:isFocused(cid)) then
        return false
    end
 
      if isPlayer(cid)then
     doCreatureAddHealth (cid, -getCreatureMaxHealth (cid))
        doCreatureSay(cid, "TrOuXaa !!!", TALKTYPE_ORANGE_1)
             
     end
 
  
end

 
local node1 = keywordHandler:addKeyword({'pergunta'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'A pergunta e simples! Qual e o melhor baiak 8.6 da atualidade?'})
      node1:addChildKeyword({'gran baiak'}, PerguntaPoi, {})
     node1:addChildKeyword({'Gran Baiak'}, PerguntaPoi, {})
      node1:addChildKeyword({'GRAN BAIAK'}, PerguntaPoi, {})

    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Seems like you are no better than them.', reset = true})

    local node2 = keywordHandler:addKeyword({'morrer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Realmente Deseja Morrer? yes or no'})

       node2:addChildKeyword({'yes'}, Morrer, {})

      node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Seems like you are no better than them.', reset = true})
 
npcHandler:addModule(FocusModule:new())