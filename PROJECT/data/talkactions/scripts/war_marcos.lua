local players_storage = 456512
local storage_accept = 151230
local storage_check = 153201
local guild_invite = 542351
local guild_accept = 456121
local time_1_pos = {x = 376, y = 573, z = 6}
local time_2_pos = {x = 387, y = 573, z = 6}
local city = {

["carlin"] = {334455,456231,542351,888111}   ,
["ankrahmun"] = {334466,456232,542352,888222}  

}

local function getOnlineGuildMembersByRank(guildId, rank, selectLowerRanks)
    if not rank then
        rank = 3
        selectLowerRanks = true
    end
    local list = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerGuildId(pid) == guildId then
            local playerRank = getPlayerGuildLevel(pid)
            if playerRank == rank or (selectLowerRanks and playerRank <= rank) then
                table.insert(list, pid)
            end
        end
    end
    return list
end
local tempo = {15,30,45,60}

function onSay(cid, words, param, channel)
    if param == "" then
        doPlayerSendCancel(cid, "Use os parametros corretos.")
        return true
    end
    
    local t = string.explode(param, ",")

for city = 1,#city do  --devo um END DAQUI
    if t[3] ~= city then
        doPlayerSendCancel(cid,"digite o nome certo da city")
        return true
    end
    for tempo = 1,#tempo do -- DEVO UM ENDO AQUI
    if t[4] ~= tempo then
       doPlayerSendCancel(cid,"digite o tempo correto!")
        return true
    end  

    
    if words == "!war"..city.." invite," then
        
		if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        
		if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if #getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false) > 0 then
                if getGlobalStorageValue(city[1]) <= os.time() then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce convidou a guild "..t[2].." para uma war em "..city.."!")
                    for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureName(cid).." da guild "..getPlayerGuildName(cid).." chamou sua guild para uma war em "..city.." Para aceitar diga /war"..city.." accept, "..getPlayerGuildName(cid)..".")
                        setPlayerStorageValue(gid, storage_accept, os.time() + tempo*60)
                        setPlayerStorageValue(gid, storage_check, getPlayerGuildId(cid))
                    end
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A arena ja esta ocupada.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Nenhum lider da guild "..t[2].." esta online.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    
	
	elseif "!war"..city.." accept," then
        if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if getPlayerStorageValue(cid, storage_accept) > os.time() then
                if getPlayerStorageValue(cid, storage_check) == getGuildId(t[2]) then
                    setGlobalStorageValue(city[1], os.time() + tempo*60)
                    setGlobalStorageValue(city[2], getPlayerGuildId(cid))
                    setGlobalStorageValue(city[3], getGuildId(t[2]))
                    if #getOnlineGuildMembersByRank(getGuildId(t[2]), 3, true) > 0 then
                        for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, true)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild entrou em war contra a guild "..getPlayerGuildName(cid).."! Para participar diga /war"..city.." go")
                        end
                    end
                    if #getOnlineGuildMembersByRank(getPlayerGuildId(cid), 3, true) > 0 then
                        for _, pid in pairs(getOnlineGuildMembersByRank(getPlayerGuildId(cid), 3, true)) do
                            doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild entrou em war contra a guild "..t[2].."! Para participar diga /war"..city.." go")
                        end
                    end
                    addEvent(function()
                        for _, pid in pairs(getPlayersOnline()) do
                            if isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 3}, {x = 26507, y = 32030, z = 3}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 4}, {x = 26507, y = 32030, z = 4}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 5}, {x = 26507, y = 32030, z = 5}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 6}, {x = 26507, y = 32030, z = 6}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 7}, {x = 26507, y = 32030, z = 7}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 8}, {x = 26507, y = 32030, z = 8}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 9}, {x = 26507, y = 32030, z = 9}) then
                                doTeleportThing(pid, getTownTemplePosition(getPlayerTown(cid)))
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo pq o tempo de war acabou")
                            end
                        end
                    end, 1000*tempo*60)
                    addEvent(setGlobalStorageValue, 3600*1000, city[2], -1)
                    addEvent(setGlobalStorageValue, 3600*1000, city[3], -1)
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao te invitou para uma war.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild n foi chamada para nenhuma war.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    elseif "!war"..city.." go" then
        if getTilePzInfo(getThingPos(cid)) == false then
            doPlayerSendCancel(cid, "Vc precisa estar na pz")
            return true
        end
        if getGlobalStorageValue(city[3]) == getPlayerGuildId(cid) or getGlobalStorageValue(city[2]) == getPlayerGuildId(cid) then
            doPlayerSetStorageValue(cid, city[4], os.time() + getGlobalStorageValue(city[1]))
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce entrou na war!")
            if getGlobalStorageValue(city[3]) == getPlayerGuildId(cid) then
                doTeleportThing(cid, time_1_pos)
            else
                doTeleportThing(cid, time_2_pos)
            end
        else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
        end
    end
end
end

    return true
end