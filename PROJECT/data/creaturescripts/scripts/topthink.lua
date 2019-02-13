

function onThink(cid, interval)
	if(not isCreature(cid)) then
		return true
	end
if tostring(getPlayerName(cid)) == "Account Manager" then return true end
if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end
if isPlayer(cid) then

local tempo_auxiliar_segundoo = 4633790

		if getPlayerStorageValue(cid,tempo_auxiliar_segundoo) < os.time() then
		setPlayerStorageValue(cid, tempo_auxiliar_segundoo , os.time() + 3)

	-- doPlayerSendTextMessage(cid,18, "oi")

			for i = 1,#getPlayersOnline() do


	-- doPlayerSendTextMessage(cid,18, "online: "..getCreatureName(getPlayersOnline()[i]).."")
	if tostring(topilvl()) == getCreatureName(getPlayersOnline()[i]) then

			doSendAnimatedText(getCreaturePosition(getPlayersOnline()[i]), "[TOP]", TEXTCOLOR_LIGHTBLUE)
		doSendMagicEffect(getCreaturePosition(getPlayersOnline()[i]), 30)
		break
	end

end






		else 
	return true
	end


	end
	return true
end



function online()
		on = {}
		p = 1
	 for i= 1,#getPlayersOnline() do

	 	on[p] = tostring(getCreatureName(getPlayersOnline()[i]))
	 	p = p +1
	 end
	return on
end

