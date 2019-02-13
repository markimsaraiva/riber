

local stun,exhaustn = 33789,3

function onSay(cid, words, param, channel)
if (getPlayerStorageValue(cid, stun) <= os.time()) then
   setPlayerStorageValue(cid, stun, os.time()+ exhaustn)

if getGlobalStorageValue(TEMPO_PATENTI) < os.time() then
doPlayerSendTextMessage(cid,27, "o sistema vai reiniciar")
else
local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
local timeLeft = convertTime(getGlobalStorageValue(TEMPO_PATENTI) - os.time())

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'O sistema ira reiniciar daqui ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
doPlayerSendTextMessage(cid, 18, "A sua patente e: "..ARMY[getPlayerStorageValue(cid, ARMY_LEVEL)][3]..".")

	

end
else
   doPlayerSendTextMessage(cid,18, "Voce so pode usar o comando a  cada "..exhaustn.." segundos")
   return true

end
return true
end
