	local THESNAPPER_POSITION = {x = 417, y = 462, z = 15}
local HIDE_POSITION = {x = 393, y = 476, z = 14}
local THEBLOODTUSK_POSITION = {x = 100, y = 100, z = 7}
local SHARDHEAD_POSITION = {x = 419, y = 449, z = 14}
local THUL_POSITION = {x = 427, y = 472, z = 14}
local ESMERALDA_POSITION = {x = 418, y = 463, z = 14}
local THEOLDWIDOW_POSITION = {x = 427, y = 472, z = 15}
local THEMANY_POSITION = {x = 392, y = 452, z = 14}
local LEVIATHAN_POSITION = {x = 410, y = 327, z = 13}
local STONECRACKER_POSITION = {x = 409, y = 437, z = 14}
local THENOXIUSSPAWN_POSITION = {x = 410, y = 437, z = 12}
local MERIKHTHESLAUGHTERER_POSITION = {x = 419, y = 449, z = 15}
local FAHIMTHEWISE_POSITION = {x = 409, y = 437, z = 15}
local RANDOMPIRATEBOSS_POSITION = {x = 488, y = 204, z = 5}
local THEHORNEDFOX_POSITION = {x = 391, y = 452, z = 15}
local DEMONBOSS_POSITION = {x = 427, y = 472, z = 13}
local NECROPHARUS_POSITION = {x = 366, y = 453, z = 15}

local tasks =
{
        [1] = {questStarted = 1510, questStorage = 65000, killsRequired = 10, raceName = "Trolls", rewards = {first = {enable = true, type = "exp", values = 200}, second = {enable = true, type = "money", values = 200}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [2] = {questStarted = 1511, questStorage = 65001, killsRequired = 150, raceName = "Goblins", rewards = {first = {enable = true, type = "exp", values = 1000}, second = {enable = true, type = "money", values = 1000}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [3] = {questStarted = 1512, questStorage = 65002, killsRequired = 300, raceName = "Rotworms", rewards = {first = {enable = true, type = "exp", values = 2000}, second = {enable = true, type = "money", values = 1300}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [4] = {questStarted = 1513, questStorage = 65003, killsRequired = 500, raceName = "Cyclops", rewards = {first = {enable = true, type = "exp", values = 3000}, second = {enable = true, type = "money", values = 4000}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [5] = {questStarted = 1514, questStorage = 65004, killsRequired = 300, raceName = "Crocodiles", rewards = {first = {enable = true, type = "exp", values = 1000}, second = {enable = false, type = "boss", values = {x=392, y=476, z=15}, third = {enable = false, type = nil, values = {nil, nil}}}}},

        [6] = {questStarted = 1515, questStorage = 65005, killsRequired = 300, raceName = "Tarantulas", rewards = {first = {enable = true, type = "exp", values = 1500}, second = {enable = true, type = "boss", values = HIDE_POSITION}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [7] = {questStarted = 1516, questStorage = 65006, killsRequired = 150, raceName = "Carniphilas", rewards = {first = {enable = true, type = "exp", values = 1500}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [8] = {questStarted = 1517, questStorage = 65007, killsRequired = 200, raceName = "Stone Golems", rewards = {first = {enable = true, type = "exp", values = 2000}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [9] = {questStarted = 1518, questStorage = 65008, killsRequired = 300, raceName = "Mammoths", rewards = {first = {enable = true, type = "exp", values = 4000}, second = {enable = true, type = "money", values = 5000}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [10] = {questStarted = 1519, questStorage = 65009, killsRequired = 300, raceName = "Ice Golems", rewards = {first = {enable = true, type = "exp", values = 15000}, second = {enable = true, type = "boss", values = SHARDHEAD_POSITION}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [11] = {questStarted = 1520, questStorage = 65010, killsRequired = 300, raceName = "Quaras Scout", rewards = {first = {enable = true, type = "exp", values = 10000}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [12] = {questStarted = 1521, questStorage = 65011, killsRequired = 300, raceName = "Quaras", rewards = {first = {enable = true, type = "exp", values = 12000}, second = {enable = true, type = "boss", values = THUL_POSITION}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [13] = {questStarted = 1522, questStorage = 65012, killsRequired = 70, raceName = "Water Elementals", rewards = {first = {enable = true, type = "exp", values = 7000}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [14] = {questStarted = 1523, questStorage = 65013, killsRequired = 70, raceName = "Earth Elementals", rewards = {first = {enable = true, type = "exp", values = 10000}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [15] = {questStarted = 1524, questStorage = 65014, killsRequired = 70, raceName = "Energy Elementals", rewards = {first = {enable = true, type = "exp", values = 10000}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [16] = {questStarted = 1525, questStorage = 65015, killsRequired = 70, raceName = "Fire Elementals", rewards = {first = {enable = true, type = "exp", values = 7000}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [17] = {questStarted = 1526, questStorage = 65016, killsRequired = 90, raceName = "Mutated Rats", rewards = {first = {enable = true, type = "exp", values = 10000}, second = {enable = true, type = "boss", values = ESMERALDA_POSITION}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [18] = {questStarted = 1527, questStorage = 65017, killsRequired = 300, raceName = "Giant Spiders", rewards = {first = {enable = true, type = "exp", values = 5000}, second = {enable = true, type = "boss", values = THEOLDWIDOW_POSITION}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [19] = {questStarted = 1528, questStorage = 65018, killsRequired = 2000, raceName = "Hydras", rewards = {first = {enable = true, type = "boss", values = THEMANY_POSITION}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [20] = {questStarted = 1529, questStorage = 65019, killsRequired = 100, raceName = "Sea Serpents", rewards = {first = {enable = true, type = "boss", values = LEVIATHAN_POSITION}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [21] = {questStarted = 1530, questStorage = 65020, killsRequired = 150, raceName = "Behemoths", rewards = {first = {enable = true, type = "boss", values = STONECRACKER_POSITION}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [22] = {questStarted = 1531, questStorage = 65021, killsRequired = 200, raceName = "Serpents Spawn", rewards = {first = {enable = true, type = "teleport", values = THENOXIUSSPAWN_POSITION}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [23] = {questStarted = 1532, questStorage = 65022, killsRequired = 150, raceName = "Green Djinns", rewards = {first = {enable = true, type = "exp", values = 10000}, second = {enable = true, type = "money", values = 5000}, third = {enable = true, type = "boss", values = MERIKHTHESLAUGHTERER_POSITION}}},

        [24] = {questStarted = 1533, questStorage = 65023, killsRequired = 150, raceName = "Blue Djinns", rewards = {first = {enable = true, type = "exp", values = 10000}, second = {enable = true, type = "money", values = 5000}, third = {enable = true, type = "boss", values = FAHIMTHEWISE_POSITION}}},

        [25] = {questStarted = 1534, questStorage = 65024, killsRequired = 400, raceName = "Pirates", rewards = {first = {enable = true, type = "exp", values = 10000}, second = {enable = true, type = "money", values = 5000}, third = {enable = true, type = "boss", values = RANDOMPIRATEBOSS_POSITION}}},




        [28] = {questStarted = 1537, questStorage = 65027, killsRequired = 200, raceName = "Magicians", rewards = {first = {enable = true, type = "boss", values = THEHORNEDFOX_POSITION}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [29] = {questStarted = 1538, questStorage = 65028, killsRequired = 200, raceName = "Magicians", rewards = {first = {enable = true, type = "exp", values = 40000}, second = {enable = false, type = nil, values = {nil, nil}}, third = {enable = false, type = nil, values = {nil, nil}}}},

        [30] = {questStarted = 1539, questStorage = 65029, killsRequired = 666, raceName = "Demons", rewards = {first = {enable = true, type = "storage", values = {65535, 1}}, second = {enable = true, type = "boss", values = DEMONBOSS_POSITION}, third = {enable = false, type = nil, values = {nil, nil}}}}
}
 
 
 
local storage = 64521

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local voc = {}

function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end

function creatureSayCallback(cid, type, msg)

        local s = getPlayerStorageValue(cid, storage)

        if(not npcHandler:isFocused(cid)) then
                return false
        end
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
        if msgcontains(msg, 'task') then

                if(s < 1) then
                        doPlayerSetStorageValue(cid, storage, 1)
                end

                if tasks[s] then
                        if(getPlayerStorageValue(cid, tasks[s].questStarted) < 1) then
                                if(getPlayerStorageValue(cid, tasks[s].creatureStorage) < 0) then
                                        doPlayerSetStorageValue(cid, tasks[s].creatureStorage, 0)
                                end

                                if(getPlayerStorageValue(cid, tasks[s].questStorage) < 0) then
                                        doPlayerSetStorageValue(cid, tasks[s].questStorage, 0)
                                end

                                doPlayerSetStorageValue(cid, tasks[s].questStarted, 1)
                                selfSay('You have started the task number ' .. getPlayerStorageValue(cid, storage) .. ', in this task you need to kill ' .. tasks[s].killsRequired .. ' ' .. tasks[s].raceName .. '.', cid)
                        else
                                selfSay('You are currently making task about ' .. tasks[s].raceName .. '.', cid)
                        end
                else
                        print("[Warning - Error::Killing in the name of::Tasks config] Something is wrong.")
                end

        elseif msgcontains(msg, 'report') then
                if tasks[s] and tasks[s].questStarted > 0 then
                        if(getPlayerStorageValue(cid, tasks[s].creatureStorage) < 0) then
                                doPlayerSetStorageValue(cid, tasks[s].creatureStorage, 0)
                        end

                        if(getPlayerStorageValue(cid, tasks[s].questStorage) < 0) then
                                doPlayerSetStorageValue(cid, tasks[s].questStorage, 0)
                        end

                        if(getPlayerStorageValue(cid, tasks[s].questStorage) >= tasks[s].killsRequired) then
                                selfSay('Great!... you have finished the task number ' .. s .. '. Good job.', cid)
                                doPlayerSetStorageValue(cid, storage, s + 1)
                                if(tasks[s].rewards.first.enable) then
                                        if(tasks[s].rewards.first.type == "boss") then
                                                doTeleportThing(cid, tasks[s].rewards.first.values)
                                        elseif(tasks[s].rewards.first.type == "exp") then
                                                doPlayerAddExperience(cid, tasks[s].rewards.first.values)
                                        elseif(tasks[s].rewards.first.type == "item") then
                                                doPlayerAddItem(cid, tasks[s].rewards.first.values[1], tasks[s].rewards.first.values[2])
                                        elseif(tasks[s].rewards.first.type == "money") then
                                                doPlayerAddMoney(cid, tasks[s].rewards.first.values)
                                        elseif(tasks[s].rewards.first.type == "storage") then
                                                doPlayerSetStorageValue(cid, tasks[s].rewards.first.values[1], tasks[s].rewards.first.values[2])
                                        end
                                end
                                if(tasks[s].rewards.second.enable) then
                                        if(tasks[s].rewards.second.type == "boss") then
                                                doTeleportThing(cid, tasks[s].rewards.second.values)
                                        elseif(tasks[s].rewards.second.type == "exp") then
                                                doPlayerAddExperience(cid, tasks[s].rewards.second.values)
                                        elseif(tasks[s].rewards.second.type == "item") then
                                                doPlayerAddItem(cid, tasks[s].rewards.second.values[1], tasks[s].rewards.second.values[2])
                                        elseif(tasks[s].rewards.second.type == "money") then
                                                doPlayerAddMoney(cid, tasks[s].rewards.second.values)
                                        elseif(tasks[s].rewards.second.type == "storage") then
                                                doPlayerSetStorageValue(cid, tasks[s].rewards.second.values[1], tasks[s].rewards.second.values[2])
                                        end
                                end
                                if(tasks[s].rewards.third.enable) then
                                        if(tasks[s].rewards.third.type == "boss") then
                                                doTeleportThing(cid, tasks[s].rewards.third.values)
                                        elseif(tasks[s].rewards.third.type == "exp") then
                                                doPlayerAddExperience(cid, tasks[s].rewards.third.values)
                                        elseif(tasks[s].rewards.third.type == "item") then
                                                doPlayerAddItem(cid, tasks[s].rewards.third.values[1], tasks[s].rewards.third.values[2])
                                        elseif(tasks[s].rewards.third.type == "money") then
                                                doPlayerAddMoney(cid, tasks[s].rewards.third.values)
                                        elseif(tasks[s].rewards.third.type == "storage") then
                                                doPlayerSetStorageValue(cid, tasks[s].rewards.third.values[1], tasks[s].rewards.third.values[2])
                                        end
                                end                           
                        else
                                selfSay('Current ' .. getPlayerStorageValue(cid, tasks[s].questStorage) .. ' ' .. tasks[s].raceName .. ' killed, you need to kill ' .. tasks[s].killsRequired .. '.', cid)
                        end
                else
                        selfSay('You do not have started any task.', cid)
                end
        end
        return true
end


-- Script por Killua, antigo Amoeba13 --

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
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

    if amoebaTask[msg] then
            if getPlayerStorageValue(cid, amoebaTask[msg].storagecount) == amoebaTask[msg].count then
                local esperiencia = amoebaTask[msg].exp > 0 and "" ..amoebaTask[msg].exp.. " exp e " or ""
                local dineiro = amoebaTask[msg].money > 0 and "" .. amoebaTask[msg].money .. " gold coins e " or ""
                selfSay("Voce conseguiu completar a task de ".. msg .. ", parabens! Eu vou te dar " .. esperiencia .. "" .. dineiro .."alguns itens como recompensa.", cid)
                doPlayerAddExperience(cid, amoebaTask[msg].exp)
                doPlayerAddMoney(cid, amoebaTask[msg].money)
                doPlayerSetStorageValue(cid, amoebaTask[msg].storage, -1)
		doPlayerSetStorageValue(cid, amoebaTask[msg].storagecount, 0)
                for juba, prize in pairs(amoebaTask[msg].premios) do
                    doPlayerAddItem(cid, prize[1], prize[2])
                end
            else
                selfSay("Desculpe, mas voce ainda nao matou todos os " .. msg .. "s. Voce so matou " .. taskKills(cid, amoebaTask[msg].storagecount) .. " de " .. amoebaTask[msg].count .. " " .. msg .. "s.", cid)
            end
    else
        selfSay("O que?", cid)
    end
    return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())