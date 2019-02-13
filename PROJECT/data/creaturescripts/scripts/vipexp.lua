function onLogin(cid)
local getname = getPlayerName(cid)
if tostring(getname) == "Account Manager" then return true end


local rate = 1.20 -- 30%
local config = {
vip = "Você tem "..((rate - 1)*100).."% de exp a mais agora!",
notvip = "Torne-se vip e ganhe "..((rate - 1)*100).."% a mais de experiencia!",
}

if vip.hasVip(cid) == false then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.notvip)
local contribuicao = 0
if (getPlayerStorageValue(cid, limitedeuso) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus) == 1) then
contribuicao = 1
end
 if (getPlayerStorageValue(cid, limitedeuso2) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus2) == 1) then
contribuicao = 0.5
end
doPlayerSetExperienceRate(cid, (1 + contribuicao))

else

local contribuicao = 0
if (getPlayerStorageValue(cid, limitedeuso) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus) == 1) then
contribuicao = 1
end
 if (getPlayerStorageValue(cid, limitedeuso2) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus2) == 1) then
contribuicao = 0.5
end


doPlayerSetExperienceRate(cid, (rate + contribuicao))
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.vip)
end
return TRUE
end