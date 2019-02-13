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
  local moeda = 10581 -- ID DA SILVER TOKEN 
  local t = {
    ["boots of haste"] = {amount = 10, item = {2195,1}},
    ["demon helmet"] = {amount = 11, item = {2493,1}},
    ["frozen starlight"] = {amount = 30, item = {2361,1}},
    ["spellbook of dark mysteries"] = {amount = 20, item = {8918,1}},
    ["royal crossbow"] = {amount = 20, item = {8851,1}},
    ["stuffed dragon"] = {amount = 30, item = {5791,1}},
    ["star tear"] = {amount = 100, item = {7735,1}},
    ["jester staff"] = {amount = 100, item = {7958,1}},
    ["vancini axe"] = {amount = 100, item = {8925,1}},
    ["firewalker boots"] = {amount = 50, item = {9932,1}},
    ["flame blade"] = {amount = 100, item = {8931,2}}
  }
  
  if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
    str = str .. "Pode trocar suas SILVER TOKENS por: "
    for name, ret in pairs(t) do
      str = str.." {"..name.."} = "..ret.amount.." Moedas /"
    end
    npcHandler:say(str, cid)
  elseif t[msg] then
    local item, amount = t[msg].item[1], t[msg].item[2]
    if doPlayerRemoveItem(cid,moeda, t[msg].amount) then
      if isItemStackable(item) or amount == 1 then
        doPlayerAddItem(cid, item, amount)
      else
        for i = 1, amount do
          doPlayerAddItem(cid, item, 1)
        end
      end
      npcHandler:say("Aqui está "..amount.." ".. getItemNameById(item) .."!", cid)
    else
      npcHandler:say("Você precisa de "..t[msg].amount.." ".. getItemNameById(moeda), cid)
    end
  end 
  return true 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())