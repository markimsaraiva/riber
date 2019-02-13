local stu,exhaust = 93589,3

function onSay(cid, words, param, channel)
	
if (getPlayerStorageValue(cid, stu) <= os.time()) then
   setPlayerStorageValue(cid, stu, os.time()+ exhaust)

local exprate = getPlayerExtraExpRate(cid)
local total = (exprate - 1)*100
	doPlayerSendTextMessage(cid,27, "voce possui bonus de : "..total.." % a mais de XP!")

else
   doPlayerSendTextMessage(cid,18, "Voce so pode usar o comando a  cada "..exhaust.." segundos")
   return true

end
	return true
end

