-- local tempo_um_minuto = 10*60
-- local storage_do_um_minuto = 423043

function onKill(cid, target, lastHit)
if isPlayer(cid) and isPlayer(target) then 
if getPlayerIp(target) ~= getPlayerIp(cid) then 
-- if getPlayerStorageValue(cid,getPlayerGUID(target)) <= os.time() then
-- setPlayerStorageValue(cid,getPlayerGUID(target), 0)
-- setPlayerStorageValue(cid,getPlayerGUID(target), os.time() + 180)
-- else

-- local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
-- local timeLeft = convertTime(getPlayerStorageValue(cid,getPlayerGUID(target)) - os.time())

-- doPlayerSendTextMessage(cid, 19,"TEM q ESPERAR  "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." para GANHAR CORACAO DO PLAYER "..getCreatureName(target).." ! ")
-- return true
-- end
-- if getPlayerStorageValue(cid, storage_do_um_minuto) <= os.time() then
-- setPlayerStorageValue(cid,storage_do_um_minuto, 0)
-- setPlayerStorageValue(cid,storage_do_um_minuto, os.time() + tempo_um_minuto)
-- else

-- local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
-- local timeLeft = convertTime(getPlayerStorageValue(cid,storage_do_um_minuto) - os.time())

-- doPlayerSendTextMessage(cid, 27,"[CORACAO PLAYER]: Tera que esperar "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." para ganhar coracao de qualquer player!")
-- return true 
-- end
local randomico = math.random (1,100) 

if randomico > 99 then


				 local config = {

				Kname = getPlayerName(cid),
				Tname = getPlayerName(target),
				Tlevel = getPlayerLevel(target),
				}

				local heart = doPlayerAddItem(cid, 12705)
			doItemSetAttribute(heart, "description", "Morto no Level "..config.Tlevel.." Pelo Player "..config.Kname..". " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "(Justified)" or "(Unjustified)"))

			doItemSetAttribute(heart, "name", "" ..config.Tname.. " Heart's")
			doPlayerSendTextMessage(cid, 19, "Voce obteve o coracao do Player "..getPlayerName(target).."!")
else
	  return true
	end	


end
-- end		
end

return true
end
