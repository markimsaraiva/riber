
local stu,stu2,exhaust = 421048,67262,1

function onSay(cid, words, param, channel)
if (getPlayerStorageValue(cid, stu2) <= os.time()) then
   setPlayerStorageValue(cid, stu2, os.time()+ exhaust)

  
if getPlayerStorageValue(cid, stu) < os.time() then
doPlayerSendCancel(cid, "Ja esta pronto para dropar osso!")
else
local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
local timeLeft = convertTime(getPlayerStorageValue(cid,stu) - os.time())

doPlayerSendTextMessage(cid, 27,"[OSSO PLAYER]: Tera que esperar "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." para ganhar osso de qualquer player!")
end
else
   doPlayerSendTextMessage(cid,19, "Voce so pode usar o comando a  cada "..exhaust.." segundo(s)")
   return true

end
return true
end



