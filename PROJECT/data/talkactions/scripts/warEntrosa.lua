




-- local area = {
-- from1 = {x = 300, y = 525, z = 1},
-- to1 = {x = 460, y = 650, z = 1},
-- from2 = {x = 300, y = 525, z = 2},
-- to2 = {x = 460, y = 650, z = 2},
-- from3 = {x = 300, y = 525, z = 3},
-- to3 = {x = 460, y = 650, z = 3},
-- from4 = {x = 300, y = 525, z = 4},
-- to4 = {x = 460, y = 650, z = 4},
-- from5 = {x = 300, y = 525, z = 5},
-- to5 = {x = 460, y = 650, z = 5},
-- from6 = {x = 300, y = 525, z = 6},
-- to6 = {x = 460, y = 650, z = 6}




-- }
  --  db.executeQuery("INSERT INTO `city_war` (`frags_guild1`, `frags_guild2`, `guild1`, `guild2`, `tempo`) VALUES ('" .. self.frags[self.name[1][1]] .. "', '" .. self.frags[self.name[2][1]] .. "', '" .. self.name[1][2] .. "', '" .. self.name[2][2] .. "', '" .. self.tempo .. "');")




-- local function getOnlineGuildMembersByRank(guildId, rank, selectLowerRanks)
--     if not rank then
--         rank = 3
--         selectLowerRanks = true
--     end
--     local list = {}
--     for _, pid in pairs(getPlayersOnline()) do
--         if getPlayerGuildId(pid) == guildId then
--             local playerRank = getPlayerGuildLevel(pid)
--             if playerRank == rank or (selectLowerRanks and playerRank <= rank) then
--                 table.insert(list, pid)
--             end
--         end
--     end
--     return list
-- end

function onSay(cid, words, param, channel)
    if param == "" then
        doPlayerSendTextMessage(cid,20, "Use os parametros corretos.\n{ex: /warcarlin invite, GuildInimiga, Tempo,Quant de Kills}}")
        return true
    end
	if getPlayerLevel(cid) <= levelmin_carlin then
        doPlayerSendCancel(cid, "Voce nao tem level suficiente. Tenha level maior que "..levelmin_carlin.." !")
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

    if ( t[3] ==  tostring(tempo_carlin[1]) ) or  ( t[3] ==  tostring(tempo_carlin[2]) ) or  ( t[3] ==  tostring(tempo_carlin[3]) ) or  ( t[3] ==  tostring(tempo_carlin[4]) ) then


    carlin_time = tonumber(t[3]) * 60
    setGlobalStorageValue(storage_carlin_time,tonumber(t[3]))

            if (t[4] == tostring(quant_carlin_kill[1])) or (t[4] == tostring(quant_carlin_kill[2])) or (t[4] == tostring(quant_carlin_kill[3])) or (t[4] == tostring(quant_carlin_kill[4])) or (t[4] == tostring(quant_carlin_kill[5])) or (t[4] == tostring(quant_carlin_kill[6])) or (t[4] == tostring(quant_carlin_kill[7])) then

                if getGlobalStorageValue(arena_carlin_storage) <= os.time() then

                    kius = tonumber(t[4])
                    if kius == 0 then
                        kius = "infinitas"
                    else
                        kius = tostring(t[4])
                    end
                    setGlobalStorageValue(storage_carlin_t4,tonumber(t[4]))

                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce convidou a guild "..t[2].." para uma war em "..city.." por "..t[3].." minutos com "..kius.." kills !")
                

                    for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureName(cid).." da guild "..getPlayerGuildName(cid).." chamou sua guild para uma war em "..city.." por "..t[3].." minutos com "..kius.." Kills ! Para aceitar diga /war"..city.." accept, "..getPlayerGuildName(cid)..".")
                        setPlayerStorageValue(gid, storage_carlin_accept, os.time() + 20*60)
                        setPlayerStorageValue(gid, storage_carlin_check, getPlayerGuildId(cid))
                    end
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A arena ja esta ocupada.")
                end
else
                     --doPlayerSendTextMessage(cid, 27,"Digite a quant de kill certa! ["..quant_carlin_kill[1].."(infinito)], ["..quant_carlin_kill[2].."], ["..quant_carlin_kill[3].."], ["..quant_carlin_kill[4].."] , ["..quant_carlin_kill[5].."] , ["..quant_carlin_kill[6].."] , ["..quant_carlin_kill[7].."] ")
    doPlayerSendTextMessage(cid, 27,"Digite a quant de kill certa! ["..quant_carlin_kill[1].." para infinito ], ["..quant_carlin_kill[2].."], ["..quant_carlin_kill[3].."], ["..quant_carlin_kill[4].."] , ["..quant_carlin_kill[5].."] , ["..quant_carlin_kill[6].."] , ["..quant_carlin_kill[7].."] ")
                
            


            return true
            end

            else
                            doPlayerSendTextMessage(cid, 27,"Digite os minutos certos! ["..tempo_carlin[1].."], ["..tempo_carlin[2].."], ["..tempo_carlin[3].."], ["..tempo_carlin[4].."]")
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
            if getPlayerStorageValue(cid, storage_carlin_accept) > os.time() then
                if getPlayerStorageValue(cid, storage_carlin_check) == getGuildId(t[2]) then


                    setGlobalStorageValue(arena_carlin_storage, 0)
                    setGlobalStorageValue(arena_carlin_storage, os.time() + (getGlobalStorageValue(storage_carlin_time)*60))
                    setGlobalStorageValue(guild_carlin_accept, getPlayerGuildId(cid))
                    setGlobalStorageValue(guild_carlin_invite, getGuildId(t[2]))
                    setGlobalStorageValue(kill_carlin[1], 0)
                    setGlobalStorageValue(kill_carlin[2], 0)
                    setGlobalStorageValue(carlinwar[2], 0)
                    setGlobalStorageValue(carlinwar[1], 0)
                    setGlobalStorageValue(carlin_power, 1)


                        restante(10)
                        restante(5)
                        restante(1)




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


   
--                     matt = tonumber(t[4])
--                     if matt == tonumber(0) then
-- if (getGlobalStorageValue(arena_carlin_storage) - os.time() < 0 ) or (getGlobalStorageValue(kill_carlin[1]) == matt) or (getGlobalStorageValue(kill_carlin[2]) == matt) then
--                         for _, pid in pairs(getPlayersOnline()) do
--                             if isInArea(getThingPos(pid), carlin.from1, carlin.to1) or  isInArea(getThingPos(pid), carlin.from2, carlin.to2) or isInArea(getThingPos(pid), carlin.from3, carlin.to3) or isInArea(getThingPos(pid), carlin.from4, carlin.to4) or isInArea(getThingPos(pid), carlin.from5, carlin.to5) or isInArea(getThingPos(pid), carlin.from6, carlin.to6) then 
                                               
                                    
--                                 doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
--                                 doPlayerSetStorageValue(pid, war_carlin_log, 0)
--                                 doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo porque a [War Carlin] acabou")

                                
--                             end
--                         end
         
--                 db.query("INSERT INTO `entrosa_war` (`frags_guild1`, `frags_guild2`, `guild1`, `guild2`, `tempo`) VALUES (' "..getGlobalStorageValue(kill_carlin[1]).." ', ' "..getGlobalStorageValue(kill_carlin[2]).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ', ' "..temmpo.." ');")

--                     local delay = 4
--                     addEvent(setGlobalStorageValue, delay*1000, arena_carlin_storage,0)
--                     addEvent(setGlobalStorageValue, delay*1000, guild_carlin_accept, -1)
--                     addEvent(setGlobalStorageValue, delay*1000, guild_carlin_invite, -1)
--                     addEvent(setGlobalStorageValue, delay*1000, carlinwar[1], 0)
--                     addEvent(setGlobalStorageValue, delay*1000, carlinwar[2], 0)
--                     addEvent(setGlobalStorageValue, delay*1000, kill_carlin[1], 0)
--                     addEvent(setGlobalStorageValue, delay*1000, kill_carlin[2], 0)

-- addEvent(function()

--  doBroadcastMessage ("[CARLIN WAR]: PLACAR FINAL \n [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).."  ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")



-- end, 2*1000)

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

        if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_carlin_accept) == getPlayerGuildId(cid) then

                            if isInArea(getThingPos(cid), carlin.from1, carlin.to1) or  isInArea(getThingPos(cid), carlin.from2, carlin.to2) or isInArea(getThingPos(cid), carlin.from3, carlin.to3) or isInArea(getThingPos(cid), carlin.from4, carlin.to4) or isInArea(getThingPos(cid), carlin.from5, carlin.to5) or isInArea(getThingPos(cid), carlin.from6, carlin.to6) then  

                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ja esta na WAR!")

                                return true
                            end
                

            add_player_arena(cid) --soma + 1 na area e divulga

            doPlayerSetStorageValue(cid, war_carlin_log, 1)
                    

            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce entrou na war!")

            if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then
                local ii = math.random(1,1) --vai de 1 a 7
db.query("UPDATE players SET guild1 = 1 WHERE id = "..getPlayerGUID(cid).." ;")
                doTeleportThing(cid, carlin_1_pos[ii])
                pos_spell_random(cid)

                --local wolf = {278,114}
                --doSetCreatureOutfit(cid, {lookType = wolf[1], lookHead = wolf[2] , lookBody = wolf[2], lookLegs = wolf[2], lookFeet = wolf[2], lookAddons = 3},-1)

            else
                local oo = math.random(1,1)
db.query("UPDATE players SET guild2 = 1 WHERE id = "..getPlayerGUID(cid).." ;")
                doTeleportThing(cid, carlin_2_pos[oo])
                pos_spell_random(cid)

                
                --local wolf = {152,94}
                --doSetCreatureOutfit(cid, {lookType = wolf[1], lookHead = wolf[2] , lookBody = wolf[2], lookLegs = wolf[2], lookFeet = wolf[2], lookAddons = 3},-1)


            end
        else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
        end

elseif t[1] == "exit" then
   if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_carlin_accept) == getPlayerGuildId(cid) then
                    if getTilePzInfo(getThingPos(cid)) == false then
            doPlayerSendCancel(cid, "Voce precisa estar em uma area protect zone")
            return true
        end

 if isInArea(getThingPos(cid), carlin.from1, carlin.to1) or  isInArea(getThingPos(cid), carlin.from2, carlin.to2) or isInArea(getThingPos(cid), carlin.from3, carlin.to3) or isInArea(getThingPos(cid), carlin.from4, carlin.to4) or isInArea(getThingPos(cid), carlin.from5, carlin.to5) or isInArea(getThingPos(cid), carlin.from6, carlin.to6) then  

                       if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then

db.query("UPDATE players SET guild1 = 0 WHERE id = "..getPlayerGUID(cid).." ;")
            else
db.query("UPDATE players SET guild2 = 0 WHERE id = "..getPlayerGUID(cid).." ;")
            end


            remove_player_arena(cid) --subtrai - 1 na area e divulga

            doPlayerSetStorageValue(cid, war_carlin_log, 0)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce saiu da war!")
                doTeleportThing(cid, getTownTemplePosition(1))
                 doSendMagicEffect(getCreaturePosition(cid), 26)

             if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then
                local wolf = {278,114}
                doSetCreatureOutfit(cid, {lookType = wolf[1], lookHead = wolf[2] , lookBody = wolf[2], lookLegs = wolf[2], lookFeet = wolf[2], lookAddons = 3},0)

            else
                local wolf = {152,94}
                doSetCreatureOutfit(cid, {lookType = wolf[1], lookHead = wolf[2] , lookBody = wolf[2], lookLegs = wolf[2], lookFeet = wolf[2], lookAddons = 3},0)

            end


else
                  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao esta na Arena de CARLIN!")

                                return true
     end
           
        else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
        end

--- inicio list
elseif t[1] == "list" then
	   if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_carlin_accept) == getPlayerGuildId(cid) then

 if isInArea(getThingPos(cid), carlin.from1, carlin.to1) or  isInArea(getThingPos(cid), carlin.from2, carlin.to2) or isInArea(getThingPos(cid), carlin.from3, carlin.to3) or isInArea(getThingPos(cid), carlin.from4, carlin.to4) or isInArea(getThingPos(cid), carlin.from5, carlin.to5) or isInArea(getThingPos(cid), carlin.from6, carlin.to6) then  


function exivaa(name)

local playerPos, npcPos = getCreaturePosition(cid), getCreaturePosition(getCreatureByName(name))
local px, py = 0, 0
local pS = ""
local text = ""

if(playerPos.x == npcPos.x) and (playerPos.y < npcPos.y) then
px = 1
py = npcPos.y - playerPos.y
pS = "south \/"
elseif(playerPos.x == npcPos.x) and (playerPos.y > npcPos.y) then
px = 1
py = playerPos.y - npcPos.y
pS = "north /\ "
elseif(playerPos.x < npcPos.x) and (playerPos.y == npcPos.y) then
px = npcPos.x - playerPos.x
py = 1
pS = "east >"
elseif(playerPos.x > npcPos.x) and (playerPos.y == npcPos.y) then
px = playerPos.x - npcPos.x
py = 1
pS = "west <"
elseif(playerPos.x > npcPos.x) and (playerPos.y > npcPos.y) then
px = playerPos.x - npcPos.x
py = playerPos.y - npcPos.y
pS = "north-west < /\ "
elseif(playerPos.x > npcPos.x) and (playerPos.y < npcPos.y) then
px = playerPos.x - npcPos.x
py = npcPos.y - playerPos.y
pS = "south-west < \/"
elseif(playerPos.x < npcPos.x) and (playerPos.y < npcPos.y) then
px = npcPos.x - playerPos.x
py = npcPos.y - playerPos.y
pS = "south-east \/ >"
elseif(playerPos.x < npcPos.x) and (playerPos.y > npcPos.y) then
px = npcPos.x - playerPos.x
ps = playerPos.y - npcPos.y
pS = "north-east /\ >"
end

if(px <= 4 and py <= 4) then
text = "next you"
elseif((px > 4 and px <= 100) and (py > 4 and py <= 100)) or ((px > 4 and px <= 100) and (py <= 4)) or ((px <= 4) and (py > 4 and py <= 100)) then
text = "" .. pS .. ""
elseif((px > 100 and px <= 274) and (py > 100 and py <= 274)) or ((px > 100 and px <= 274) and (py <= 100)) or ((px <= 100) and (py > 100 and py <= 274)) then
text = "far to " .. pS .. ""
elseif((px > 274 and px <= 280) and (py > 274 and py <= 280)) or ((px > 274 and px <= 280) and (py < 274)) or ((px < 274) and (py > 274 and py <= 280)) then
text = "very far to " .. pS .. ""
elseif(px > 280 and py > 280) or (px > 280 and py < 280) or (px < 280 and py > 280) then
text = "" .. pS .. ""
end
return text
end

local displayoutput = {"Carlin War"}
    number = 1
    param = string.lower(param)
    skilllist = ""
    command = TRUE
     display = 1
     number2 = 1
    skilllist2 = ""




                     --db.query("UPDATE players SET guild1 = 1 ;")
                     --db.query("UPDATE players SET guild2 = 1 ;")
local player = db.getResult("SELECT `name`, `level` FROM `players` WHERE `guild1` = 1 ORDER BY `level` DESC;")    
            if(player:getID() ~= -1) then
                while (true) do
                     local name = player:getDataString("name")
                     local level = player:getDataString("level")

                     
                     local text = exivaa(name)
                      skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.." -- LVL ["..level.."] - "..text.." ")
                    number = number + 1
                  	
               
                     
                   			

                    if not(player:next()) then
                        break
                    end
                end
                player:free()
            end

local player = db.getResult("SELECT `name`, `level` FROM `players` WHERE `guild2` = 1 ORDER BY `level` DESC;")    
            if(player:getID() ~= -1) then
                while (true) do
                     local namee = player:getDataString("name")
                     local level = player:getDataString("level")

                     local text = exivaa(namee)
					skilllist2 = skilllist2.. "\n#"..string.format("%5s",number2.."  "..namee.." -- LVL ["..level.."] - "..text.." ")
                    number2 = number2 + 1
                  	
               
                     
                   			

                    if not(player:next()) then
                        break
                    end
                end
                player:free()
            end
          local dialog1  = "[+] Lista de INIMIGOS na Carlin War [+]\n "..skilllist.."\n--------------------------\n "
          local dialog2  = "[+] Lista de INIMIGOS na Carlin War [+]\n "..skilllist2.."\n--------------------------\n "

		  local itemtype = 9969
		  if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then

    	  doShowTextDialog(cid, itemtype, dialog2)
    	else
    	  doShowTextDialog(cid, itemtype, dialog1)

    	end


else
                  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao esta na Arena de CARLIN!")

                                return true
     end
 else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
            return true
        end

-----fim do list
elseif t[1] == "outfit" then
    if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
   if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_carlin_accept) == getPlayerGuildId(cid) then
                   


    local liderlooktype = getCreatureOutfit(cid).lookType
    local liderlookhead = getCreatureOutfit(cid).lookHead 
    local liderlookbody = getCreatureOutfit(cid).lookBody
    local liderlooklegs = getCreatureOutfit(cid).lookLegs
    local liderlookfeet = getCreatureOutfit(cid).lookFeet
           

             if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then


if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true) > 0 then
 for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true)) do
  doPlayerSendTextMessage(gid, 18, "[CARLIN WAR]: [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
    if isInArea(getThingPos(gid), carlin.from1, carlin.to1) or  isInArea(getThingPos(gid), carlin.from2, carlin.to2) or isInArea(getThingPos(gid), carlin.from3, carlin.to3) or isInArea(getThingPos(gid), carlin.from4, carlin.to4) or isInArea(getThingPos(gid), carlin.from5, carlin.to5) or isInArea(getThingPos(gid), carlin.from6, carlin.to6) then  


     doSetCreatureOutfit(gid, {lookType = liderlooktype, lookHead = liderlookhead , lookBody = liderlookbody, lookLegs = liderlooklegs, lookFeet = liderlookfeet, lookAddons = 3},-1)


                 doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu Lider trocou de outfit!")
                 doSendMagicEffect(getCreaturePosition(gid), 26)
                else
                return true
     
    end
    end
  end

else

  if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true) > 0 then
  for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true)) do
   doPlayerSendTextMessage(pid, 18, "[CARLIN WAR]: [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
   if isInArea(getThingPos(pid), carlin.from1, carlin.to1) or  isInArea(getThingPos(pid), carlin.from2, carlin.to2) or isInArea(getThingPos(pid), carlin.from3, carlin.to3) or isInArea(getThingPos(pid), carlin.from4, carlin.to4) or isInArea(getThingPos(pid), carlin.from5, carlin.to5) or isInArea(getThingPos(pid), carlin.from6, carlin.to6) then  


     doSetCreatureOutfit(pid, {lookType = liderlooktype, lookHead = liderlookhead , lookBody = liderlookbody, lookLegs = liderlooklegs, lookFeet = liderlookfeet, lookAddons = 3},-1)

                 doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu Lider trocou de outfit!")
                 doSendMagicEffect(getCreaturePosition(pid), 26)
                else
                return true
     
   end
   end
   end
    

end


           
        else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
        end



    end

    return true
end

