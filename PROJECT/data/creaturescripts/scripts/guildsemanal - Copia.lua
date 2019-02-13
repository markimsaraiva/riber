function onKill(cid, target, lastHit)
if getPlayerGuildId(cid) == 0 then return true
end


-- if getPlayerIp(target) ~= getPlayerIp(cid) then
if getPlayerGuildId(target) ~= getPlayerGuildId(cid) then
if isPlayer(target) and isPlayer(cid) then

if getPlayerStorageValue(target,getPlayerGuildId(cid)) <= os.time() then

setPlayerStorageValue(target,getPlayerGuildId(cid), os.time() + 30)
doBroadcastMessage("Ira ter q esperar 30 segundos pra ganhar frag em cima de "..getCreatureName(target).." novamente")


if (getPlayerGuildId(target) ~= 0) then



 db.executeQuery("UPDATE `guilds` SET `frags_semana` = `frags_semana` + 5 WHERE `id` = " .. getPlayerGuildId(cid) .. ";")
 doPlayerSendTextMessage(cid,19,"SOMOU 3 FRAG SEMANA")
 
 else
 --colocar um verificador para nao burlar..

 db.executeQuery("UPDATE `guilds` SET `frags_semana` = `frags_semana` + 1 WHERE `id` = " .. getPlayerGuildId(cid) .. ";")
 doPlayerSendTextMessage(cid,19," SOMOU 1 FRAG SEMANA")




 
 end
else
local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
local timeLeft = convertTime(getPlayerStorageValue(target,getPlayerGuildId(cid)) - os.time())

doBroadcastMessage("NAO SOMOU FRAG, mate o "..getCreatureName(target).."novamente em "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." para ganhar frag")
return true
end 
end
end
-- end
return true
end


-- function nomeqqer(cid) -- PASSAR O EXP ATUAL PARA A XP BASE ( X2 PARA X1)

 -- local player = db.getResult("SELECT `experience` FROM `players` WHERE id = "..getPlayerGUID(cid)..";")    
            -- if(player:getID() ~= -1) then
                -- while (true) do
                    -- local experience = player:getDataString("experience")

-- db.executeQuery("UPDATE players SET xpbase = "..experience.." WHERE id = "..getPlayerGUID(cid).." ;")


                    -- if not(player:next()) then
                        -- break
                    -- end
                -- end
                -- player:free()
            -- end
			
-- end