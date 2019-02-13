
local stu,exhaust = 42475,3

function onSay(cid, words, param, channel)
if (getPlayerStorageValue(cid, stu) <= os.time()) then
   setPlayerStorageValue(cid, stu, os.time()+ exhaust)

  
if (getPlayerStorageValue(cid, limitedeuso) - os.time() >= 0) and (getPlayerStorageValue(cid,io_expbonus) == 1)  then
local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
local timeLeft = convertTime(getPlayerStorageValue(cid,limitedeuso) - os.time())

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, '[orb exp]: Ainda resta: ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds)..' com 100% a mais de exp!')

else

doPlayerSendCancel(cid, "Voce nao esta sob efeito da diamond orb exp!")

end
else
   doPlayerSendTextMessage(cid,18, "Voce so pode usar o comando a  cada "..exhaust.." segundos")
   return true

end
return true
end
