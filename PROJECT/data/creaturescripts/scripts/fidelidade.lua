local think= 334678
local tempu = 1*60*60

function onThink(cid, interval)

	if(not isCreature(cid)) then
		return true
	end
if tostring(getPlayerName(cid)) == "Account Manager" then return true end
if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end



if isPlayer(cid) then
if getPlayerStorageValue(cid,think) == -1 then
	setPlayerStorageValue(cid, think , 0)
end

if getPlayerStorageValue(cid,think) <= os.time() then
setPlayerStorageValue(cid,think, os.time() + tempu)
local item,quant = 12372, math.random(1,5) --recompensa item e quant
doPlayerAddItem(cid, item, quant)
doPlayerSendTextMessage(cid, 27 , "voce ficou 1 hora online! e por isso ganhou "..quant.." "..getItemNameById(item)
.."(s)!")
doSendMagicEffect(getThingPos(cid), math.random(28,30)) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.	


end

-- if getPlayerStorageValue(cid,11001) <= os.time() then
-- 		setPlayerStorageValue(cid, 11001 , os.time() + 1)
	

-- local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
-- local timeLeft = convertTime(getPlayerStorageValue(cid,think) - os.time())
-- doPlayerSendTextMessage(cid, 18, 'Tempo: ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
-- end
		-- doPlayerSendTextMessage(cid, 18, ""..getPlayerStorageValue(cid,think).."")
			-- setPlayerStorageValue(cid, think ,getPlayerStorageValue(cid,think) + 1 )
		
    end
        
	return true
end


function onLogin(cid)
	if(not isCreature(cid)) then
		return true
	end

local getname = getPlayerName(cid)
if tostring(getname) == "Account Manager" then return true end


	if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end

if isPlayer(cid) then
setPlayerStorageValue(cid,think, 0)
setPlayerStorageValue(cid,think, os.time() + tempu)

end
	return true
end