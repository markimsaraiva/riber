local ITEM_FOOD = 5093
local daumtempone = 20
local bananastorage = 76512


function convertTime(time)
local t_table = {}
t_table.days = math.floor(time / 86400)
time = time - (t_table.days * 86400)
t_table.hours = math.floor(time / 3600)
time = time - (t_table.hours * 3600)
t_table.minutes = math.floor(time / 60)
t_table.seconds = time - (t_table.minutes * 60)
return t_table
end





function onUse(cid, item, frompos) 
if getGlobalStorageValue(bananastorage) <= os.time() then
setGlobalStorageValue(bananastorage, os.time() + daumtempone)
doTransformItem(item.uid, ITEM_FOOD) 
doCreateItem(2676, 12, frompos)
doDecayItem(item.uid) 
else
local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
local timeLeft = convertTime(getGlobalStorageValue(bananastorage) - os.time())
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'As bananas so vao nascer daqui ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
doCreatureSay(cid," Espera nascer mais ne!",19)
end
 return true
 end
