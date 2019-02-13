local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 
local talkState = {} 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end 
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end 
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end 
function onThink() npcHandler:onThink() end 
function creatureSayCallback(cid, type, msg) 
  if(not npcHandler:isFocused(cid)) then 
    return false 
  end 
  local talkUser,msg,str = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid,msg:lower(),""
  local t = {
    ["item vip um"] = {amount = 1, item = {12372,1}, itemdnt = {8901,1}},
    ["item vip dois"] = {amount = 1,  item = {12372,2}, itemdnt = {8901,1}},
    ["item vip tres"] = {amount = 1, item = {12372,3}, itemdnt = {8901,1}},
    ["item vip quatro"] = {amount = 1, item = {12372,4}, itemdnt = {8901,1}}, 
    ["item vip cinco"] = {amount = 1, item = {12372,5}, itemdnt = {8901,1}},
    ["item vip seis"] = {amount = 1, item = {12372,6}, itemdnt = {8901,1}}

  }
  
  if (msgcontains(msg, "trade") or msgcontains(msg, 'TRADE'))then
    str = str .. "[+]    ITENS     /    O QUE PAGO POR ELES    [+] : \n\n"
    for name, ret in pairs(t) do
      str = str.."\n "..name.."  =  "..ret.item[2].." MOEDAS  DONATE \n"
    end

    local str2 = "                             [+] BUY ITENS DONATE [+]\n\n\n [+] COMPRO ITENS DONATE PELA METADE DOS PONTOS! [+] \n\n Digite Corretamente o nome do item que voce quer, que eu lhe faco uma oferta!\n\n "..str.."\n\n                             [+] BUY ITENS DONATE [+]\n\n"

    doPlayerPopupFYI(cid, str2)
  
    -- npcHandler:say(str, cid)
 else if t[msg] then
      
    sharuara, qsharuara = t[msg].item[1], t[msg].item[2]
    sharuaradnt, qsharuaradnt = t[msg].itemdnt[1], t[msg].itemdnt[2]

local ctz = "voce tem ctz q quer fazer a troca de {"..qsharuaradnt.."}   {"..getItemNameById(sharuaradnt).."} por {"..qsharuara.."}   {"..getItemNameById(sharuara).."} ? se sim digite {confirmo}"
        npcHandler:say(ctz, cid)
          setPlayerStorageValue(cid, 134132 , 1)
        
  elseif (msgcontains(msg, "confirmo") or msgcontains(msg, 'CONFIRMO')) and (getPlayerStorageValue(cid,134132) == 1) then

                          if doPlayerRemoveItem(cid,sharuaradnt, qsharuaradnt) then

                            if isItemStackable(sharuara) or qsharuara == 1 then

                              doPlayerAddItem(cid, sharuara, qsharuara)   
    
                            end

                            npcHandler:say("Aqui esta "..qsharuara.." ".. getItemNameById(sharuara) .."!", cid)
              setPlayerStorageValue(cid, 134132 , 0)

                          else

                            npcHandler:say("Voce precisa de "..qsharuaradnt.." ".. getItemNameById(sharuaradnt).." !" , cid)
                                          setPlayerStorageValue(cid, 134132 , 0)


                          end
else if (msgcontains(msg, "confirmo") or msgcontains(msg, 'CONFIRMO')) and (getPlayerStorageValue(cid,134132) == 0) then
                                npcHandler:say("Desculpe, nao entendi. Digite {trade} para ver as opcoes!", cid)
end


    end


end

  return true 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())



    
