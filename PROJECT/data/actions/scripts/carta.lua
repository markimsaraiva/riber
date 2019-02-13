function onUse(cid, item, fromPosition, itemEx, toPosition)
local level = 120
if getPlayerLevel(cid) > level then

local tempo = 10*60  -- aqui você coloca o tempo, lembrando que é minutos * segundos

local stg = getPlayerStorageValue(cid, 123541)
if (stg == -1) then
stg = 0
end
if getPlayerStorageValue(cid, 123540) - os.time() <= 0 then
        doPlayerAddItem(cid, 2597, 1)
local time = os.time() + tempo
setPlayerStorageValue(cid, 123540, time)
setPlayerStorageValue(cid, 123541, stg+1)
local stg = getPlayerStorageValue(cid, 123541)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce recebeu uma carta, voce pode enviar uma mensagem direta aos admins. Nao precisa nome, nem cidade, apenas a mensagem. Quando terminar coloque na mailbox.")
    else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce so pode pegar cartas a cada 10 minutos. Proxima carta disponivel: " .. os.date("%H:%M:%S", getPlayerStorageValue(cid, 123540)) .. ".")
end
else
doPlayerSendTextMessage(cid,27,"Voce deve ser level "..level.." para pegar cartas.")
end
return true
end
