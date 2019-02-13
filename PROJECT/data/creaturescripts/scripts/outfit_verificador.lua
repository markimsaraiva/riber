function onLogin(cid)
if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end
if tostring(getPlayerName(cid)) == "Account Manager" then return true end

local outfit = getCreatureOutfit(cid)



local sex = getPlayerSex(cid)
local storage = 45658

local female = {136, 137, 138, 139, 140, 141, 142, 147, 148, 149, 150, 155, 156, 157, 158, 252, 269, 270, 279, 288, 324, 336,366} -- all female outfits 0
local male = {128, 129, 130, 131, 132, 133, 134, 143, 144, 145, 146, 151, 152, 153, 154, 251, 268, 273, 278, 289, 325,335,367} -- all male outfits 1


if (sex == 1) and (getPlayerStorageValue(cid,storage) == -1) then

db.executeQuery("INSERT INTO `outfits` (`id` , `"..male[1].."` , `"..male[2].."` , `"..male[3].."` , `"..male[4].."` , `"..male[5].."` , `"..male[6].."` , `"..male[7].."` , `"..male[8].."` , `"..male[9].."` , `"..male[10].."` , `"..male[11].."` , `"..male[12].."` , `"..male[13].."` , `"..male[14].."` , `"..male[15].."` , `"..male[16].."` , `"..male[17].."` , `"..male[18].."` , `"..male[19].."` , `"..male[20].."` , `"..male[21].."` , `"..male[22].."` , `"..male[23].."` ) VALUES ("..getPlayerGUID(cid)..",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);")

-- db.executeQuery("INSERT INTO `player_addon` (`id` , `"..male[1].."` , `"..male[2].."` , `"..male[3].."` , `"..male[4].."` , `"..male[5].."` , `"..male[6].."` , `"..male[7].."` , `"..male[8].."` , `"..male[9].."` , `"..male[10].."` , `"..male[11].."` , `"..male[12].."` , `"..male[13].."` , `"..male[14].."` , `"..male[15].."` , `"..male[16].."` , `"..male[17].."` , `"..male[18].."` , `"..male[19].."` , `"..male[20].."` , `"..male[21].."` , `"..male[22].."` , `"..male[23].."` ) VALUES ("..getPlayerGUID(cid)..",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);")

setPlayerStorageValue(cid,storage,1)
doPlayerSendTextMessage(cid,18,"inseriu db")
return true
end

if (sex == 0) and (getPlayerStorageValue(cid,storage) == -1) then   --femea
db.executeQuery("INSERT INTO `outfits` (`id` , `"..female[1].."` , `"..female[2].."` , `"..female[3].."` , `"..female[4].."` , `"..female[5].."` , `"..female[6].."` , `"..female[7].."` , `"..female[8].."` , `"..female[9].."` , `"..female[10].."` , `"..female[11].."` , `"..female[12].."` , `"..female[13].."` , `"..female[14].."` , `"..female[15].."` , `"..female[16].."` , `"..female[17].."` , `"..female[18].."` , `"..female[19].."` , `"..female[20].."` , `"..female[21].."` , `"..female[22].."` , `"..female[23].."` ) VALUES ("..getPlayerGUID(cid)..",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);")

-- db.executeQuery("INSERT INTO `player_addon` (`id` , `"..female[1].."` , `"..female[2].."` , `"..female[3].."` , `"..female[4].."` , `"..female[5].."` , `"..female[6].."` , `"..female[7].."` , `"..female[8].."` , `"..female[9].."` , `"..female[10].."` , `"..female[11].."` , `"..female[12].."` , `"..female[13].."` , `"..female[14].."` , `"..female[15].."` , `"..female[16].."` , `"..female[17].."` , `"..female[18].."` , `"..female[19].."` , `"..female[20].."` , `"..female[21].."` , `"..female[22].."` , `"..female[23].."` ) VALUES ("..getPlayerGUID(cid)..",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);")

setPlayerStorageValue(cid,storage,1)
doPlayerSendTextMessage(cid,18,"inseriu db")
return true
end


if outfit.lookAddons == 3 then
if (sex == 1) and (getPlayerStorageValue(cid,storage) == 1) then


local umbrella = pegarlooktype(cid,outfit.lookType)
if umbrella == 1 then doPlayerSendTextMessage(cid,18,"ja tem esse na db") return true end
if umbrella == 0 then

for var=1,#male do

if outfit.lookType == male[var] then

doPlayerSendTextMessage(cid,18,"show, inserido na db")
db.executeQuery("UPDATE outfits SET `"..outfit.lookType.."` = 1 WHERE id = "..getPlayerGUID(cid).." ;")   		
-- db.executeQuery("UPDATE player_addon SET `"..outfit.lookType.."` = 3 WHERE id = "..getPlayerGUID(cid).." ;")   		

end
end
end
end

if (sex == 0) and (getPlayerStorageValue(cid,storage) == 1) then


local oi = pegarlooktype(cid,outfit.lookType)
if oi == 1 then doPlayerSendTextMessage(cid,18,"ja tem esse na db") return true end
if oi == 0 then

for var=1,#female do

if outfit.lookType == female[var] then

doPlayerSendTextMessage(cid,18,"show, inserido na db")
db.executeQuery("UPDATE outfits SET `"..outfit.lookType.."` = 1 WHERE id = "..getPlayerGUID(cid).." ;")   		
-- db.executeQuery("UPDATE player_addon SET `"..outfit.lookType.."` = 3  WHERE id = "..getPlayerGUID(cid).." ;")   		

return true
end
end
end
end
else 
return true
end




return true
end

function pegarlooktype(cid, look) -- PEGAR A XPBASE 
local ult = db.getResult('select * from `outfits` where id = \''..getPlayerGUID(cid)..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataInt(""..look.."")
ult:free()

hahae = tonumber(mamae)
return hahae

end