local THESNAPPER_POSITION = {x = 1012, y = 249, z = 7}
local DEMODRAS_POSITION = {x = 19102, y = 18803, z = 7}
local HIDE_POSITION = {x = 995, y = 248, z = 7}
local THEBLOODTUSK_POSITION = {x = 957, y = 252, z = 7}
local SHARDHEAD_POSITION = {x = 960, y = 223, z = 7}
local THUL_POSITION = {x = 1009, y = 225, z = 7}
local ESMERALDA_POSITION = {x = 995, y = 198, z = 7}
local THEOLDWIDOW_POSITION = {x = 1067, y = 250, z = 7}
local THEMANY_POSITION = {x = 1056, y = 202, z = 7}
local LEVIATHAN_POSITION = {x = 1035, y = 174, z = 7}
local STONECRACKER_POSITION = {x = 993, y = 167, z = 7}
local THENOXIUSSPAWN_POSITION = {x = 1033, y = 127, z = 7}
local MERIKHTHESLAUGHTERER_POSITION = {x = 1056, y = 185, z = 7}
local FAHIMTHEWISE_POSITION = {x = 1080, y = 184, z = 7}
local RANDOMPIRATEBOSS_POSITION = {x = 1025, y = 211, z = 7}
local THEHORNEDFOX_POSITION = {x = 1057, y = 233, z = 7}
local NECROPHARUS_POSITION = {x = 977, y = 197, z = 7}


local tasks =
{
[1] = {questStarted = 65000, questStorage = 65000, killsRequired = 100, raceName = "Trolls", rewards = {{enable = true, type = "exp", values = 40000}, {enable = true, type = "money", values = 40000}}},

[2] = {questStarted = 65001, questStorage = 65001, killsRequired = 150, raceName = "Goblins", rewards = {{enable = true, type = "exp", values = 70000}, {enable = true, type = "money", values = 50000}}},

[3] = {questStarted = 65002, questStorage = 65002, killsRequired = 300, raceName = "Rotworms", rewards = {{enable = true, type = "exp", values = 100000}, {enable = true, type = "money", values = 60000}}},

[4] = {questStarted = 65003, questStorage = 65003, killsRequired = 500, raceName = "Cyclops", rewards = {{enable = true, type = "exp", values = 150000}, {enable = true, type = "money", values = 80000}}},

[5] = {questStarted = 14007, questStorage = 14007, killsRequired = 300, raceName = "Crocodiles", rewards = {{enable = true, type = "exp", values = 100000}, {enable = true, type = "boss", values = THESNAPPER_POSITION}, {enable = true, type = "points", values = 7}}},

[6] = {questStarted = 14008, questStorage = 14008, killsRequired = 300, raceName = "Tarantulas", rewards = {{enable = true, type = "exp", values = 150000}, {enable = true, type = "boss", values = HIDE_POSITION}, {enable = true, type = "points", values = 2}}},

[7] = {questStarted = 14009, questStorage = 14009, killsRequired = 150, raceName = "Carniphilas", rewards = {{enable = true, type = "exp", values = 250000}, {enable = true, type = "money", values = 150000}}},

[8] = {questStarted = 14010, questStorage = 14010, killsRequired = 200, raceName = "Stone Golems", rewards = {{enable = true, type = "exp", values = 200000}, {enable = true, type = "money", values = 150000}}},

[9] = {questStarted = 14011, questStorage = 14011, killsRequired = 300, raceName = "Mammoths", rewards = {{enable = true, type = "exp", values = 150000}, {enable = true, type = "boss", values = THEBLOODTUSK_POSITION}, {enable = true, type = "points", values = 2}}},

[10] = {questStarted = 14012, questStorage = 14012, killsRequired = 300, raceName = "Ice Golems", rewards = {{enable = true, type = "exp", values = 150000}, {enable = true, type = "boss", values = SHARDHEAD_POSITION}, {enable = true, type = "points", values = 2}}},

[11] = {questStarted = 14013, questStorage = 14013, killsRequired = 300, raceName = "Quaras Scout", rewards = {{enable = true, type = "exp", values = 250000}, {enable = true, type = "money", values = 250000}}},

[12] = {questStarted = 14014, questStorage = 14014, killsRequired = 300, raceName = "Quaras", rewards = {{enable = true, type = "exp", values = 300000}, {enable = true, type = "boss", values = THUL_POSITION}, {enable = true, type = "points", values = 2}}},

[13] = {questStarted = 14015, questStorage = 14015, killsRequired = 70, raceName = "Water Elementals", rewards = {{enable = true, type = "exp", values = 200000}, {enable = true, type = "money", values = 200000}}},

[14] = {questStarted = 14016, questStorage = 14016, killsRequired = 70, raceName = "Earth Elementals", rewards = {{enable = true, type = "exp", values = 200000}, {enable = true, type = "money", values = 200000}}},

[15] = {questStarted = 14017, questStorage = 14017, killsRequired = 70, raceName = "Energy Elementals", rewards = {{enable = true, type = "exp", values = 200000}, {enable = true, type = "money", values = 200000}}},

[16] = {questStarted = 14018, questStorage = 14018, killsRequired = 70, raceName = "Fire Elementals", rewards = {{enable = true, type = "exp", values = 200000}, {enable = true, type = "money", values = 200000}}},

[17] = {questStarted = 14019, questStorage = 14019, killsRequired = 200, raceName = "Mutated Rats", rewards = {{enable = true, type = "exp", values = 150000}, {enable = true, type = "boss", values = ESMERALDA_POSITION}, {enable = true, type = "points", values = 2}}},

[18] = {questStarted = 14020, questStorage = 14020, killsRequired = 500, raceName = "Giant Spiders", rewards = {{enable = true, type = "exp", values = 250000}, {enable = true, type = "boss", values = THEOLDWIDOW_POSITION}, {enable = true, type = "points", values = 2}}},

[19] = {questStarted = 14021, questStorage = 14021, killsRequired = 2000, raceName = "Hydras", rewards = {{enable = true, type = "boss", values = THEMANY_POSITION}, {enable = true, type = "points", values = 4}}},

[20] = {questStarted = 14001, questStorage = 14001, killsRequired = 2000, raceName = "Sea Serpents", rewards = {{enable = true, type = "boss", values = LEVIATHAN_POSITION}, {enable = true, type = "points", values = 4}}},

[21] = {questStarted = 14022, questStorage = 14022, killsRequired = 2000, raceName = "Behemoths", rewards = {{enable = true, type = "boss", values = STONECRACKER_POSITION}, {enable = true, type = "points", values = 4}}},

[22] = {questStarted = 14002, questStorage = 14002, killsRequired = 1500, raceName = "Serpents Spawn", rewards = {{enable = true, type = "teleport", values = THENOXIUSSPAWN_POSITION}, {enable = true, type = "points", values = 4}}},

[23] = {questStarted = 65022, questStorage = 65022, killsRequired = 500, raceName = "Green Djinns", rewards = {{enable = true, type = "exp", values = 230000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = MERIKHTHESLAUGHTERER_POSITION}}},

[24] = {questStarted = 65023, questStorage = 65023, killsRequired = 500, raceName = "Blue Djinns", rewards = {{enable = true, type = "exp", values = 230000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = FAHIMTHEWISE_POSITION}}},

[25] = {questStarted = 65024, questStorage = 65024, killsRequired = 3000, raceName = "Pirates1", rewards = {{enable = true, type = "exp", values = 300000}, {enable = true, type = "money", values = 400000}, {enable = true, type = "boss", values = RANDOMPIRATEBOSS_POSITION}}},

[26] = {questStarted = 65025, questStorage = 65025, killsRequired = 3000, raceName = "Pirates", rewards = {{enable = true, type = "exp", values = 300000}, {enable = true, type = "money", values = 400000}}},

[27] = {questStarted = 14004, questStorage = 14004, killsRequired = 5000, raceName = "Minotaurs", rewards = {{enable = true, type = "boss", values = THEHORNEDFOX_POSITION}}},

[28] = {questStarted = 14003, questStorage = 14003, killsRequired = 4000, raceName = "Necromancer", rewards = {{enable = true, type = "boss", values = NECROPHARUS_POSITION}}},

[29] = {questStarted = 14103, questStorage = 14103, killsRequired = 1000, raceName = "Magicians2", rewards = {{enable = true, type = "exp", values = 400000}}},
[30] = {questStarted = 65030, questStorage = 65030, killsRequired = 2000, raceName = "Dragons", rewards = {{enable = true, type = "boss", values = DEMODRAS_POSITION}, {enable = true, type = "exp", values = 400000}}},
[31] = {questStarted = 14023, questStorage = 14023, killsRequired = 6666, raceName = "Demons", rewards = {{enable = true, type = "exp", values = 1000000}, {enable = true, type = "money", values = 1000000}}}}

local rankStorage = 32150
local choose = {}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg) end
function onThink()	npcHandler:onThink() end

function getTasksStarted(cid)
local tmp = {}
for k, v in pairs(tasks) do
if getCreatureStorage(cid, v.questStarted) == 1 then
table.insert(tmp, k)
end
end
return tmp
end

function getTaskByName(name)
for k, v in pairs(tasks) do
if v.raceName:lower() == name:lower() then
return k
end
end
return false
end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
if isInArray({"task", "tasks"}, msg:lower()) then
selfSay("There you can see the following tasks, please tell me the number of the task that you want to do.", cid)
local text = ""
for i = 1, table.maxn(tasks) do
text = text .. (text == "" and "" or "\n") .. i .. " - " .. tasks[i].raceName .. (getCreatureStorage(cid, tasks[i].questStarted) == 1 and " [...]" or getCreatureStorage(cid, tasks[i].questStarted) == 2 and " [x]" or "")
end
return doShowTextDialog(cid, 5956, text)

elseif getTaskByName(msg) or tasks[tonumber(msg)] then
msg = (getTaskByName(msg) or tonumber(msg))
if getCreatureStorage(cid, tasks[msg].questStarted) == 1 then
selfSay("You already started this task.", cid)
talkState[talkUser] = 0
elseif getCreatureStorage(cid, tasks[msg].questStarted) == 2 then
selfSay("You already finished this task.", cid)
talkState[talkUser] = 0
can = false
elseif tasks[msg].level and getPlayerLevel(cid) < tasks[msg].level then
selfSay("You need level " .. tasks[msg].level .. " or higher to make this task.", cid)
talkState[talkUser] = 0
else
selfSay("Are you sure that do you want to start the task number " .. msg .. "? In this task you will need to defeat " .. tasks[msg].killsRequired .. " " .. tasks[msg].raceName .. ".", cid)
choose[cid] = msg
talkState[talkUser] = 1
end
elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
doCreatureSetStorage(cid, tasks[choose[cid]].questStarted, 1)
selfSay("You have started the task number " .. choose[cid] .. ", remember... in this task you will need to defeat " .. tasks[choose[cid]].killsRequired .. " " .. tasks[choose[cid]].raceName .. ". Good luck!", cid)
talkState[talkUser] = 0
return true

elseif msg:lower() == "report" then
local t = getTasksStarted(cid)
local response = "You are currently making " .. (#t > 1 and "these" or "this") .. " task" .. (#t > 1 and "s" or "") .. ":\n"
if table.maxn(t) > 0 then
for _, tsk in ipairs(t) do
if getCreatureStorage(cid, tasks[tsk].questStorage) < 0 then doCreatureSetStorage(cid, tasks[tsk].questStorage, 0) end
response = response .. "	Name: " .. tasks[tsk].raceName .. "	Kills: " .. getCreatureStorage(cid, tasks[tsk].questStorage) .. " - " .. tasks[tsk].killsRequired .. ".\n"
end
response = response .. "Please say report and the name of the task that do you want to report, example: 'Report Trolls'."
return selfSay(response, cid)
else
return selfSay("You need to start at least one task first.", cid)
end
elseif string.sub(msg:lower(), 0, 6) == "report" then
local t = getTaskByName(string.sub(msg, 8, string.len(msg)))
if not t then
return selfSay("That task does not exists.", cid)
end

if getCreatureStorage(cid, tasks[t].questStarted) == 2 then
return selfSay("You already finished this task.", cid)
end

if getCreatureStorage(cid, tasks[t].questStarted) < 1 then
return selfSay("You don't have started this task.", cid)
end

if tasks[t].killsRequired > getCreatureStorage(cid, tasks[t].questStorage) then
return selfSay("Current " .. getCreatureStorage(cid, tasks[t].questStorage) .. " " .. tasks[t].raceName .. " killed, you need to kill " .. tasks[t].killsRequired .. ".", cid)
end
for i = 1, table.maxn(tasks[t].rewards) do
if(tasks[t].rewards[i].enable) then
if isInArray({"boss", "teleport", 1}, tasks[t].rewards[i].type) then
doTeleportThing(cid, tasks[t].rewards[i].values)
elseif isInArray({"exp", "experience", 2}, tasks[t].rewards[i].type) then
doPlayerAddExperience(cid, tasks[t].rewards[i].values)
elseif isInArray({"item", 3}, tasks[t].rewards[i].type) then
doPlayerAddItem(cid, v.rewards[i].values[1], tasks[t].rewards[i].values[2])
elseif isInArray({"money", 4}, tasks[t].rewards[i].type) then
doPlayerAddMoney(cid, tasks[t].rewards[i].values)
elseif isInArray({"storage", "stor", 5}, tasks[t].rewards[i].type) then
doCreatureSetStorage(cid, tasks[t].rewards[i].values[1], tasks[t].rewards[i].values[2])
elseif isInArray({"points", "rank", 2}, tasks[t].rewards[i].type) then
doCreatureSetStorage(cid, rankStorage, getCreatureStorage(cid, rankStorage) + tasks[t].rewards[i].values)
else
print("[Warning - Npc::KillingInTheNameOf] Wrong reward type: " .. (tasks[t].rewards[i].type or "nil") .. ", reward could not be loaded.")
end
end
end
local rank = getCreatureStorage(cid, rankStorage)
selfSay("Great!... you have finished the task number " .. t .. "" .. (rank > 4 and ", you are a " or "") .. "" .. (((rank > 4 and rank < 10) and ("Huntsman") or (rank > 9 and rank < 20) and ("Ranger") or (rank > 19 and rank < 30) and ("Big Game Hunter") or (rank > 29 and rank < 50) and ("Trophy Hunter") or (rank > 49) and ("Elite Hunter")) or "") .. ". Good job.", cid)
return doCreatureSetStorage(cid, tasks[t].questStarted, 2)
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())