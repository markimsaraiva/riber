

-- function onLogout(cid)
--     if getPlayerStorageValue(cid, 888123) > os.time() then
--         doPlayerSendCancel(cid, "Vc n pode logar enquanto esta em war! Espere "..getPlayerStorageValue(cid, 888123) - os.time().." segundos.")
--         return false
--     end
--     return true
-- end


function onLogin(cid)
		registerCreatureEvent(cid, "entrosaLogout_carlin") 
		registerCreatureEvent(cid, "kill_carlin")
		registerCreatureEvent(cid, "verificador_carlin")
    return true
end

function onLogout(cid)

		if getPlayerStorageValue(cid,war_carlin_log) > 0 then
		setPlayerStorageValue(cid, war_carlin_log , 0)

            remove_player_arena(cid) --soma -1 na area e divulga		

		end 

    return true
end


function onKill(cid,target)

if isInArea(getThingPos(cid), carlin.from1, carlin.to1) or  isInArea(getThingPos(cid), carlin.from2, carlin.to2) or isInArea(getThingPos(cid), carlin.from3, carlin.to3) or isInArea(getThingPos(cid), carlin.from4, carlin.to4) or isInArea(getThingPos(cid), carlin.from5, carlin.to5) or isInArea(getThingPos(cid), carlin.from6, carlin.to6) and isInArea(getThingPos(target), carlin.from1, carlin.to1) or  isInArea(getThingPos(target), carlin.from2, carlin.to2) or isInArea(getThingPos(target), carlin.from3, carlin.to3) or isInArea(getThingPos(target), carlin.from4, carlin.to4) or isInArea(getThingPos(target), carlin.from5, carlin.to5) or isInArea(getThingPos(target), carlin.from6, carlin.to6) then  

	contador_carlin_kill(cid)

            if getGlobalStorageValue(guild_carlin_invite) == getPlayerGuildId(target) then
	db.query("UPDATE players SET guild1 = 0 WHERE id = "..getPlayerGUID(target).." ;")
else
	db.query("UPDATE players SET guild2 = 0 WHERE id = "..getPlayerGUID(target).." ;")
end
	
   
end
                
return true
end


function onThink(cid, interval)
if(not isCreature(cid)) then return true end
	
if getGlobalStorageValue(carlin_power) == 0 then return true end

if tostring(getPlayerName(cid)) == "Account Manager" then return true end

if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end

if isPlayer(cid) then

if getGlobalStorageValue(carlin_power) == 1 then
local tempo_auxiliar_1 = 529032

									if getPlayerStorageValue(cid,tempo_auxiliar_1) <= os.time() then
									setPlayerStorageValue(cid, tempo_auxiliar_1 , os.time() + 2)



--teste verificador de posicao 




terminou_carlin(cid) 





										else
										 return false
											end

end
	end

	return true
end


-- local carlinMark1 = {
-- 	[{x = 1083, y = 1055, z = 7}] = {MAPMARK_DOLLAR, 'Bank'}
-- }


 

-- 		for pos, v in pairs(carlinMark1) do
-- 			doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
-- 		end
		
