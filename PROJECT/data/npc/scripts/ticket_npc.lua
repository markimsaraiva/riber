local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local ticketTo = {}
local playerTo = {}

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

local function isValidticket(ticket)
    if isNumber(ticket) == TRUE and ticket > 0 and ticket < 999999999 then
        return TRUE
    end
    return FALSE
end

function creatureSayCallback(cid, type, msg)
     ticket = 12372

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if msgcontains(msg, 'help') or msgcontains(msg, 'offer') then
        selfSay("You can check the {balance} of your ticket bank account, {deposit} ticket or {withdraw} it. You can also {transfer} ticket to other characters, provided that they have a vocation.", cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Balance ----------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'balance') or msgcontains(msg, 'Balance') then
        selfSay('Your account balance is '..get_tickets(cid)..' tickets.', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Help -------------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'basic functions') then
        selfSay('You can check the {balance{ of your bank account, Pdeposit{ ticket or Pwithdraw{ it. You can also {transfer} ticket to othercharacters, provided that they have a vocation.', cid)
        talkState[cid] = 0
    elseif msgcontains(msg, 'advanced functions') then
        selfSay('Renting a house has never been this easy. Simply make a bid for an auction. We will check immediately if you haveenough ticket.', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Deposit ----------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'deposit all') then
        local itemcount = getPlayerItemCount(cid, ticket) 

        if itemcount < 1 then
            selfSay('You don\'t have tickets to deposit in you inventory..', cid)
            talkState[cid] = 0
        else
            selfSay('Would you really like to deposit '..itemcount..' ticket(s)?', cid)
            talkState[cid] = 2
            quant = tonumber(itemcount)
        end

    elseif msgcontains(msg, 'deposit') then
        selfSay("Please tell me how much ticket it is you would like to deposit.", cid)
        talkState[cid] = 1
    elseif talkState[cid] == 1 then
        quant = tonumber(msg)
        if quant then
            selfSay("Would you really like to deposit "..quant.." ticket(s)?", cid)
            talkState[cid] = 2
        else
            selfSay('Is isnt valid amount of ticket to deposit.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 2 then
        if msgcontains(msg, 'yes') then
            if getPlayerItemCount(cid, ticket)  < quant then
                selfSay('You do not have enough ticket.', cid)
            else
               doPlayerRemoveItem(cid, ticket, quant)
               db.query("UPDATE `players` SET `tickets` = "..get_tickets(cid)+quant.." WHERE id = "..getPlayerGUID(cid).." ;")
               selfSay("Alright, we have added the amount of "..quant.." tickets to your balance.Your account balance is "..get_tickets(cid)..".", cid)

            end
        elseif msgcontains(msg, 'no') then
            selfSay('ok, bye', cid)
        end
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Withdraw ---------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'withdraw') then
        selfSay("Please tell me how much ticket you would like to withdraw.", cid)
        talkState[cid] = 6
    elseif talkState[cid] == 6 then
        withdraw = tonumber(msg)
        if withdraw then
            selfSay('Are you sure you wish to withdraw '..withdraw..' ticket from your ticket bank account?', cid)
            talkState[cid] = 7
        else
            selfSay('Is isnt valid amount of ticket to withdraw.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 7 then
        if msgcontains(msg, 'yes') then

            if get_tickets(cid) <  withdraw then
                selfSay('There is not enough ticket on your bank account. Your ticket balance is '..get_tickets(cid)..'. Please tell me the amount of tickets coins you would like to withdraw.', cid)
            else
                doPlayerAddItem(cid, ticket, withdraw)
                db.query("UPDATE `players` SET `tickets` = "..get_tickets(cid)-withdraw.." WHERE id = "..getPlayerGUID(cid).." ;")
                selfSay('Here you are, ' ..withdraw.. ' tickets. Your ticket balance is '..get_tickets(cid)..'. Please let me know if there is something else I can do for you.', cid)
                talkState[cid] = 0
            end


        elseif msgcontains(msg, 'no') then
            selfSay('As you wish. Is there something else I can do for you?', cid)
            talkState[cid] = 0
        end
-----------------------------------------------------------------
---------------------------- Transfer ---------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'transfer') then
        selfSay("Please tell me the amount of ticket you would like to transfer.", cid)
        talkState[cid] = 11
    elseif talkState[cid] == 11 then
        transfer = tonumber(msg)
        if transfer then
            selfSay('Who would you like transfer '..transfer..' tickets to?', cid)
            talkState[cid] = 12
        else
            selfSay('Is isnt valid amount of ticket to transfer.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 12 then
        playyer = msg

        if getCreatureName(cid) == playyer then
            selfSay('Ehm, You want transfer ticket to yourself? Its impossible!', cid)
            talkState[cid] = 0
            return true
        end

        if playerExists(playyer) then
            selfSay('So you would like to transfer ' ..transfer.. ' ticket to "' ..playyer.. '" ?', cid)
            talkState[cid] = 13
        else
            selfSay('Player with name "' ..playyer.. '" doesnt exist.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 13 then
        if msgcontains(msg, 'yes') then
            if get_tickets(cid) < transfer then
                selfSay('You dont have enought tickets on your ticket bank account.', cid)
                return true
            end

            if (playerExists(playyer) == false) then
                selfSay('This player does not exist on this world or have no vocation.', cid)
            else
                db.query("UPDATE `players` SET `tickets` = "..get_tickets(cid)-transfer.." WHERE id = "..getPlayerGUID(cid).." ;")
                db.query("UPDATE `players` SET `tickets` = "..get_tickets(getCreatureByName(playyer))+transfer.." WHERE id = "..getPlayerGUID(getCreatureByName(playyer)).." ;") 

                selfSay('You have transferred ' ..transfer.. ' ticket(s) to "' ..playyer..' ".', cid)
                playerTo[cid] = nil
            end
        elseif msgcontains(msg, 'no') then
            selfSay('As you wish. Is there something else I can do for you?', cid)
        end
        talkState[cid] = 0
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  


function get_tickets(cid) -- xprank 
local ult = db.getResult('select `tickets` from players where id = \''..getPlayerGUID(cid)..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("tickets")
ult:free()

caguei = tonumber(mamae)
return caguei

end

-- function get_transfer(coco) -- xprank 
-- local ult = db.getResult("select `tickets` from players where account_id = "..getAccountIdByName(tostring(coco)).." ")

-- if (ult:getID() == -1) then
-- return false
-- end

-- local mamae = ult:getDataString("tickets")
-- ult:free()

-- caguei = tonumber(mamae)
-- return caguei

-- end
