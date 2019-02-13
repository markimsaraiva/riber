
local stu,stu2,exhaust = 123321,67262,1

function onSay(cid, words, param, channel)
if (getPlayerStorageValue(cid, stu2) <= os.time()) then
   setPlayerStorageValue(cid, stu2, os.time()+ exhaust)

  
if getPlayerStorageValue(cid, stu) < os.time() then
doPlayerSendTextMessage(cid,27, "o sistema vai reiniciar")
else
local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
local timeLeft = convertTime(getPlayerStorageValue(cid,stu) - os.time())

local item = 12372 --recompensa item e quant

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Falta voce ficar  "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." online para ganhar de 1 a 5 "..getItemNameById(item).." como recompensa!")

end
else
   doPlayerSendTextMessage(cid,18, "Voce so pode usar o comando a  cada "..exhaust.." segundo(s)")
   return true

end
return true
end
