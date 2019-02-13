local dez_minutos = 10*60
local storage_do_osso = 421048

function onKill(cid, target, lastHit)
	if not isPlayer(target) then return true end
if isPlayer(cid) and isPlayer(target) then 
if getPlayerIp(target) == getPlayerIp(cid) then  return true end
-- if getPlayerStorageValue(cid,getPlayerGUID(target)) <= os.time() then
-- setPlayerStorageValue(cid,getPlayerGUID(target), 0)
-- setPlayerStorageValue(cid,getPlayerGUID(target), os.time() + 180)
-- else

-- local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
-- local timeLeft = convertTime(getPlayerStorageValue(cid,getPlayerGUID(target)) - os.time())

-- doPlayerSendTextMessage(cid, 19,"TEM q ESPERAR  "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." para GANHAR CORACAO DO PLAYER "..getCreatureName(target).." ! ")
-- return true
-- end
if getPlayerStorageValue(cid, storage_do_osso) <= os.time() then
setPlayerStorageValue(cid,storage_do_osso, 0)
setPlayerStorageValue(cid,storage_do_osso, os.time() + dez_minutos)
else

-- local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
-- local timeLeft = convertTime(getPlayerStorageValue(cid,storage_do_osso) - os.time())

-- doPlayerSendCancel(cid, "Nao ganhou osso.")

-- doPlayerSendTextMessage(cid, 27,"[OSSO PLAYER]: Tera que esperar "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." para ganhar osso de qualquer player!")
return true 
end


				local quanti = math.random(1,10)
				local bone = 12724
				local heart = doPlayerAddItem(cid, bone, quanti)
		
			-- doItemSetAttribute(heart, "name", " " ..config.Tname.. " Bone's")
			-- doItemSetAttribute(heart, "description", " Junte e troque por surprise's box para receber itens! ")
			doPlayerSendTextMessage(cid, 19, "Voce obteve "..quanti.." osso(s) do Player "..getPlayerName(target).."!")
	
	-- else
	-- doPlayerSendTextMessage(cid, 19, "[OSSO PLAYER]: Voce so pode ganhar ossos, matando player de outro ip!")


	-- end		
	end

return true
end
