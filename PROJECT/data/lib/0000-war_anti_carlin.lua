carlin_power = 158220
war_carlin_log = 82392
arena_carlin_storage = 454523
 storage_carlin_accept = 151230
 storage_carlin_check = 153201
 guild_carlin_invite = 542351
guild_carlin_accept = 456121
levelmin_carlin = 7
carlinwar = {439331,439332}
kill_carlin = {439431,439432}
storage_carlin_t4 = 596867
storage_carlin_time = 597977
restante_carlin = {432411,432412,432413}
pronto_carlin = 583432
guild11 = 630631
guild22 = 630632



quant_carlin_kill = {0,1,2,3,40,50,100}

tempo_carlin = {2,3,4,5} -- 600 == 10 minutos


 carlin_1_pos = { 
  {x = 349, y = 576, z = 6}, 
 {x = 376, y = 573, z = 6}, 
  {x = 352, y = 587, z = 6}, 
   {x = 340, y = 577, z = 6}, 
    {x = 343, y = 558, z = 6}, 
     {x = 357, y = 610, z = 6}, 
      {x = 316, y = 576, z = 6} --7

}

 carlin_2_pos = {
 {x = 387, y = 573, z = 6},
 {x = 414, y = 569, z = 6}, 
  {x = 391, y = 597, z = 6}, 
 {x = 370, y = 602, z = 6}, 
  {x = 389, y = 581, z = 6}, 
   {x = 392, y = 557, z = 6},
    {x = 366, y = 590, z = 6} 





}

city = "carlin" 


carlin = {
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

function getOnlineGuildMembersByRank(guildId, rank, selectLowerRanks)
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


function add_player_arena(cid)
    if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then
                setGlobalStorageValue(carlinwar[1],getGlobalStorageValue(carlinwar[1]) +1 )
                                    if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true) > 0 then
                               for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true)) do
                                --marcador

                                        doPlayerSendTextMessage(gid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[1]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] ")
                                                            end
                                                        end

                                 if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true) > 0 then
                                for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true)) do
                               --marcador

            doPlayerSendTextMessage(pid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[1]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] ")
                                                            end
                                                        end

      end

    if getGlobalStorageValue(guild_carlin_accept) == getPlayerGuildId(cid) then

                setGlobalStorageValue(carlinwar[2],getGlobalStorageValue(carlinwar[2]) +1 )

                 if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true) > 0 then
                        for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true)) do
                          --marcador


         doPlayerSendTextMessage(gid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[2]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end
                      if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true) > 0 then
                     for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true)) do
                       --marcador



                doPlayerSendTextMessage(pid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[2]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end

                end

end

    
    function remove_player_arena(cid)
    if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then
                setGlobalStorageValue(carlinwar[1],getGlobalStorageValue(carlinwar[1]) -1 )

                                    if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true) > 0 then
                                                            for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true)) do
                                     doPlayerSendTextMessage(gid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[1]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] ")
                                                            end
                                                        end
                                                        if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true) > 0 then
                                                            for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true)) do
                                         doPlayerSendTextMessage(pid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[1]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] ")
                                                            end
                                                        end

                end
                 if getGlobalStorageValue(guild_carlin_accept) == getPlayerGuildId(cid) then


                setGlobalStorageValue(carlinwar[2],getGlobalStorageValue(carlinwar[2]) -1 )

                                    if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true) > 0 then
                                                            for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true)) do
                                     doPlayerSendTextMessage(gid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[2]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end
                                                        if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true) > 0 then
                                                            for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true)) do
                                         doPlayerSendTextMessage(pid, 20, "[CARLIN WAR]: Tem "..getGlobalStorageValue(carlinwar[2]).." player(s) da [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end

                end

end



function pos_spell_random(cid)

	  local chance = math.random(1,3)

                if chance == 1 then 
                doSendMagicEffect(getCreaturePosition(cid), math.random(45,49))
                elseif chance == 2 then
                doSendMagicEffect(getCreaturePosition(cid), 17)
                elseif chance == 3 then
                doSendMagicEffect(getCreaturePosition(cid), math.random(51,53))
                end
return true
	-- body
end


function contador_carlin_kill( cid )
	-- body


if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(cid) then

	setGlobalStorageValue( kill_carlin[1], getGlobalStorageValue(kill_carlin[1]) + 1)


 if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true) > 0 then
                            for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true)) do
  doPlayerSendTextMessage(gid, 18, "[CARLIN WAR]: [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end
  if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true) > 0 then
                                                            for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true)) do
                                      doPlayerSendTextMessage(pid, 18, "[CARLIN WAR]: [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end




	end
    if getGlobalStorageValue(guild_carlin_accept) == getPlayerGuildId(cid) then
	setGlobalStorageValue( kill_carlin[2], getGlobalStorageValue(kill_carlin[2]) + 1)


 if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true) > 0 then
                                                            for _, gid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_invite), 3, true)) do
                                     doPlayerSendTextMessage(gid, 18, "[CARLIN WAR]: [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end
  if #getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true) > 0 then
                                                            for _, pid in pairs(getOnlineGuildMembersByRank(getGlobalStorageValue(guild_carlin_accept), 3, true)) do
                                     doPlayerSendTextMessage(pid, 18, "[CARLIN WAR]: [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")
                                                            end
                                                        end

    end

return true
end



function terminou_carlin(cid)
	-- 


matt = getGlobalStorageValue(storage_carlin_t4)

        if (matt == 0) and (getGlobalStorageValue(arena_carlin_storage) <= os.time() )  then  
	
                        for _, pid in pairs(getPlayersOnline()) do
                            if isInArea(getThingPos(pid), carlin.from1, carlin.to1) or  isInArea(getThingPos(pid), carlin.from2, carlin.to2) or isInArea(getThingPos(pid), carlin.from3, carlin.to3) or isInArea(getThingPos(pid), carlin.from4, carlin.to4) or isInArea(getThingPos(pid), carlin.from5, carlin.to5) or isInArea(getThingPos(pid), carlin.from6, carlin.to6) then 
                                                   
                                doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
                                doPlayerSetStorageValue(pid, war_carlin_log, 0)
                                doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo porque a [War Carlin] acabou")
                            end
                        end
         
                db.query("INSERT INTO `entrosa_war` (`frags_guild1`, `frags_guild2`, `guild1`, `guild2`, `tempo`) VALUES (' "..getGlobalStorageValue(kill_carlin[1]).." ', ' "..getGlobalStorageValue(kill_carlin[2]).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ', ' "..getGlobalStorageValue(storage_carlin_time).." ');")

                 doBroadcastMessage ("[CARLIN WAR]: PLACAR FINAL \n [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).."  ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")


				     setGlobalStorageValue( arena_carlin_storage,-1000)
                     setGlobalStorageValue(  guild_carlin_accept, -1)
                     setGlobalStorageValue(  guild_carlin_invite, -1)
                     setGlobalStorageValue(  carlinwar[1], 0)
                     setGlobalStorageValue(  carlinwar[2], 0)
                     setGlobalStorageValue(  kill_carlin[1], 0)
                     setGlobalStorageValue(  kill_carlin[2], 0)
                     setGlobalStorageValue(  storage_carlin_t4, -1)
                     setGlobalStorageValue(  storage_carlin_time, 0)
                     setGlobalStorageValue(carlin_power, 0)

                     setGlobalStorageValue(restante_carlin[1], 0)
                     setGlobalStorageValue(restante_carlin[2], 0)
                     setGlobalStorageValue(restante_carlin[3], 0)
                     db.query("UPDATE players SET guild1 = 0 ;")
                     db.query("UPDATE players SET guild2 = 0 ;")


                                         setGlobalStorageValue(pronto_carlin,0)



end



matt = getGlobalStorageValue(storage_carlin_t4)

if ((matt == quant_carlin_kill[2] )  or (matt == quant_carlin_kill[3] )  or (matt == quant_carlin_kill[4] )  or (matt == quant_carlin_kill[5] )  or (matt == quant_carlin_kill[6] )  or (matt == quant_carlin_kill[7] ) ) and  ((getGlobalStorageValue(arena_carlin_storage) <= os.time() ) or  (getGlobalStorageValue(kill_carlin[1]) == matt) or (getGlobalStorageValue(kill_carlin[2]) == matt)) then


for _, pid in pairs(getPlayersOnline()) do
                            if isInArea(getThingPos(pid), carlin.from1, carlin.to1) or  isInArea(getThingPos(pid), carlin.from2, carlin.to2) or isInArea(getThingPos(pid), carlin.from3, carlin.to3) or isInArea(getThingPos(pid), carlin.from4, carlin.to4) or isInArea(getThingPos(pid), carlin.from5, carlin.to5) or isInArea(getThingPos(pid), carlin.from6, carlin.to6) then 
                                               
                                    
                                doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
                                doPlayerSetStorageValue(pid, war_carlin_log, 0)
                                doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo porque a [War Carlin] acabou")

                                
                            end
                        end
         
                db.query("INSERT INTO `entrosa_war` (`frags_guild1`, `frags_guild2`, `guild1`, `guild2`, `tempo`) VALUES (' "..getGlobalStorageValue(kill_carlin[1]).." ', ' "..getGlobalStorageValue(kill_carlin[2]).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ', ' "..getGlobalStorageValue(storage_carlin_time).." ');")

 				doBroadcastMessage ("[CARLIN WAR]: PLACAR FINAL \n [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_invite)).."  ] "..getGlobalStorageValue(kill_carlin[1]).." x "..getGlobalStorageValue(kill_carlin[2]).." [ "..getGuildNameById(getGlobalStorageValue(guild_carlin_accept)).." ] ")

                    -- local delay = 1
                    -- addEvent(setGlobalStorageValue, delay*1000, arena_carlin_storage,0)
                    -- addEvent(setGlobalStorageValue, delay*1000, guild_carlin_accept, -1)
                    -- addEvent(setGlobalStorageValue, delay*1000, guild_carlin_invite, -1)
                    -- addEvent(setGlobalStorageValue, delay*1000, carlinwar[1], 0)
                    -- addEvent(setGlobalStorageValue, delay*1000, carlinwar[2], 0)
                    -- addEvent(setGlobalStorageValue, delay*1000, kill_carlin[1], 0)
                    -- addEvent(setGlobalStorageValue, delay*1000, kill_carlin[2], 0)
                    -- addEvent(setGlobalStorageValue, delay*1000, storage_carlin_t4, -1)
                    -- addEvent(setGlobalStorageValue, delay*1000, storage_carlin_time, 0)

                     setGlobalStorageValue( arena_carlin_storage,-1000)
                     setGlobalStorageValue(  guild_carlin_accept, -1)
                     setGlobalStorageValue(  guild_carlin_invite, -1)
                     setGlobalStorageValue(  carlinwar[1], 0)
                     setGlobalStorageValue(  carlinwar[2], 0)
                     setGlobalStorageValue(  kill_carlin[1], 0)
                     setGlobalStorageValue(  kill_carlin[2], 0)
                     setGlobalStorageValue(  storage_carlin_t4, -1)
                     setGlobalStorageValue(  storage_carlin_time, 0)
                     setGlobalStorageValue(carlin_power, 0)
                     setGlobalStorageValue(restante_carlin[1], 0)
                     setGlobalStorageValue(restante_carlin[2], 0)
                     setGlobalStorageValue(restante_carlin[3], 0)
                                         setGlobalStorageValue(pronto_carlin,0)


end



return true end



function restante(a)
	local z = getGlobalStorageValue(storage_carlin_time) - a
addEvent(function()
local time_model = " %d minuto(s) "
local timeLeft = convertTime(getGlobalStorageValue(arena_carlin_storage) - os.time())

--doPlayerSendTextMessage(cid, 27, 'falta ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
				doBroadcastMessage('[War Carlin] Ira acabar em : ' ..time_model:format(timeLeft.minutes))

end, (getGlobalStorageValue(storage_carlin_time)-a)*60*1000)

return true
end




function war_go( ... )
    





    return true
end

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