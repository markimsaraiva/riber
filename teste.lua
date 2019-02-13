local arena_storage = 454523
local players_storage = 456512
local storage_accept = 151230
local storage_check = 153201
local guild_invite = 542351
local guild_accept = 456121
local time_1_pos = {x = 376, y = 573, z = 6}
local time_2_pos = {x = 387, y = 573, z = 6}
local tempo_teste = {2,3,4,5} -- 600 == 10 minutos
local city = "carlin" 
local levelmin = 7
local carlinwar = {439331,439332}



local area = {
from1 = {x = 300, y = 525, z = 1},
to1 = {x = 460, y = 650, z = 1},
from2 = {x = 300, y = 525, z = 2},
to2 = {x = 460, y = 650, z = 2},
from3 = {x = 300, y = 525, z = 3},
to3 = {x = 460, y = 650, z = 3},
from4 = {x = 300, y = 525, z = 4},
to4 = {x = 460, y = 650, z = 4},
from5 = {x = 300, y = 525, z = 5},
to5 = {x = 460, y = 650, z = 5},
from6 = {x = 300, y = 525, z = 6},
to6 = {x = 460, y = 650, z = 6}




}
  --  db.executeQuery("INSERT INTO `city_war` (`frags_guild1`, `frags_guild2`, `guild1`, `guild2`, `tempo`, `modo`) VALUES ('" .. self.frags[self.name[1][1]] .. "', '" .. self.frags[self.name[2][1]] .. "', '" .. self.name[1][2] .. "', '" .. self.name[2][2] .. "', '" .. self.tempo .. "', '" .. self.modo .. "' );")




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

function onSay(cid, words, param, channel)
    if param == "" then
        doPlayerSendCancel(cid, "Use os parametros corretos.{ex: /warcarlin invite, NameGuild, Time}")
        return true
    end
    if getPlayerLevel(cid) <= levelmin then
        doPlayerSendCancel(cid, "Voce nao tem level suficiente. Tenha level maior que "..levelmin.." !")
        return true
    end
    
    local t = string.explode(param, ",")
    
     

    if t[1] == "invite" then
        if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if #getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false) > 0 then

    if ( t[3] ==  tostring(tempo_teste[1]) ) or  ( t[3] ==  tostring(tempo_teste[2]) ) or  ( t[3] ==  tostring(tempo_teste[3]) ) or  ( t[3] ==  tostring(tempo_teste[4]) ) then


    carlin_time = tonumber(t[3]) * 60

                if getGlobalStorageValue(arena_storage) <= os.time() then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce convidou a guild "..t[2].." para uma war em "..city.."!")
                    for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureName(cid).." da guild "..getPlayerGuildName(cid).." chamou sua guild para uma war em "..city.." Para aceitar diga /war"..city.." accept, "..getPlayerGuildName(cid)..".")
                        setPlayerStorageValue(gid, storage_accept, os.time() + 20*60)
                        setPlayerStorageValue(gid, storage_check, getPlayerGuildId(cid))
                    end
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A arena ja esta ocupada.")
                end

            else
                            doPlayerSendTextMessage(cid, 27,"Digite os minutos certos! ["..tempo_teste[1].."], ["..tempo_teste[2].."], ["..tempo_teste[3].."], ["..tempo_teste[4].."]")
        return true 
    end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Nenhum lider da guild "..t[2].." esta online.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    elseif t[1] == "accept" then
        if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if getPlayerStorageValue(cid, storage_accept) > os.time() then
                if getPlayerStorageValue(cid, storage_check) == getGuildId(t[2]) then
                    setGlobalStorageValue(arena_storage, 0)
                    setGlobalStorageValue(arena_storage, os.time() + carlin_time)
                    setGlobalStorageValue(guild_accept, getPlayerGuildId(cid))
                    setGlobalStorageValue(guild_invite, getGuildId(t[2]))

                    setGlobalStorageValue(carlinwar[2], 0)
                    setGlobalStorageValue(carlinwar[1], 0)

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
                            if isInArea(getThingPos(pid), area.from1, area.to1) or  isInArea(getThingPos(pid), area.from2, area.to2) or isInArea(getThingPos(pid), area.from3, area.to3) or isInArea(getThingPos(pid), area.from4, area.to4) or isInArea(getThingPos(pid), area.from5, area.to5) or isInArea(getThingPos(pid), area.from6, area.to6) then 
                                doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
                                doPlayerSetStorageValue(pid, war_log, 0)
                                doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo porque o tempo de war acabou")

                                
                            end
                        end
                        doBroadcastMessage("[Anti Entrosa]: A WAR em Carlin acabou! ")
                    end, carlin_time*1000)
                    addEvent(setGlobalStorageValue, carlin_time*1000, guild_accept, -1)
                    addEvent(setGlobalStorageValue, carlin_time*1000, guild_invite, -1)
                    addEvent(setGlobalStorageValue, carlin_time*1000, carlinwar[1], 0)
                    addEvent(setGlobalStorageValue, carlin_time*1000, carlinwar[2], 0)

                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao te invitou para uma war.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild nao foi chamada para nenhuma war.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    elseif t[1] == "go" then
         

        if getTilePzInfo(getThingPos(cid)) == false then
            doPlayerSendCancel(cid, "Voce precisa estar em uma area protect zone")
            return true
        end

        if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_accept) == getPlayerGuildId(cid) then

                            if isInArea(getThingPos(cid), area.from1, area.to1) or  isInArea(getThingPos(cid), area.from2, area.to2) or isInArea(getThingPos(cid), area.from3, area.to3) or isInArea(getThingPos(cid), area.from4, area.to4) or isInArea(getThingPos(cid), area.from5, area.to5) or isInArea(getThingPos(cid), area.from6, area.to6) then  

                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ja esta na WAR!")

                                return true
                            end
                

                if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) then
                setGlobalStorageValue(carlinwar[1],getGlobalStorageValue(carlinwar[1]) +1 )

                                    if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_invite), 3, true) > 0 then
                                                            for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_invite), 3, true)) do
                                     doPlayerSendTextMessage(gid, 20, "[CARLIN WAR]: Existem "..getGlobalStorageValue(carlinwar[1]).." players da guild "..getGuildNameById(getGlobalStorageValue(guild_invite)).." ")
                                                            end
                                                        end
                                                        if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_accept), 3, true) > 0 then
                                                            for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_accept), 3, true)) do
                                         doPlayerSendTextMessage(pid, 20, "[CARLIN WAR]: Existem "..getGlobalStorageValue(carlinwar[1]).." players da guild "..getGuildNameById(getGlobalStorageValue(guild_invite)).." ")
                                                            end
                                                        end

                else

                setGlobalStorageValue(carlinwar[2],getGlobalStorageValue(carlinwar[2]) +1 )

                                    if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_invite), 3, true) > 0 then
                                                            for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_invite), 3, true)) do
                                     doPlayerSendTextMessage(gid, 20, "[CARLIN WAR]: Existe(m) "..getGlobalStorageValue(carlinwar[2]).." player(s) da guild "..getGuildNameById(getGlobalStorageValue(guild_accept)).." ")
                                                            end
                                                        end
                                                        if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_accept), 3, true) > 0 then
                                                            for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_accept), 3, true)) do
                                         doPlayerSendTextMessage(pid, 20, "[CARLIN WAR]: Existe(m) "..getGlobalStorageValue(carlinwar[2]).." player(s) da guild "..getGuildNameById(getGlobalStorageValue(guild_accept)).." ")
                                                            end
                                                        end

                end

            doPlayerSetStorageValue(cid, war_log, 1)
                    

            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce entrou na war!")
            if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) then
                doTeleportThing(cid, time_1_pos)
            else
                doTeleportThing(cid, time_2_pos)
            end
        else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
        end


        
    end

    return true
end


-- if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_invite), 3, true) > 0 then
--                         for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_invite), 3, true)) do
--  doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_BLUE, "[CARLIN WAR]: Existem "..getGlobalStorageValue(carlinwar[1]).." players da guild "..getGuildNameById(getGlobalStorageValue(guild_invite)).." ")
--                         end
--                     end
--                     if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_accept), 3, true) > 0 then
--                         for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_accept), 3, true)) do
--      doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[CARLIN WAR]: Existem "..getGlobalStorageValue(carlinwar[1]).." players da guild "..getGuildNameById(getGlobalStorageValue(guild_invite)).." ")
--                         end
--                     end


    --    elseif t[1] == "exit" then
    --     if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_accept) == getPlayerGuildId(cid) then
    --                 if getTilePzInfo(getThingPos(cid)) == false then
    --         doPlayerSendCancel(cid, "Voce precisa estar em uma area protect zone")
    --         return true
    --     end
    --         doPlayerSetStorageValue(cid, war_log, 0)
    --         doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce saiu da war!")
    --             doTeleportThing(cid, getTownTemplePosition(1))
           
    --     else
    --         doPlayerSendCancel(cid, "Sua guild nao esta em war")
    --     end
    -- end