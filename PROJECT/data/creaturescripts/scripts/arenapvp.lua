dofile('data/lib/arenapvp.lua')

function onStatsChange(cid, attacker, _type, combat, value)
    
    if isPlayer(cid) and getPlayerStorageValue(cid, arena.pstorage) == 1 and _type == STATSCHANGE_HEALTHLOSS then
        if value >= getCreatureHealth(cid) then
            local killer = attacker
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureAddMana(cid, getCreatureMaxMana(cid))
            doCreatureAddHealth(killer, getCreatureMaxHealth(killer))
            doCreatureAddMana(killer, getCreatureMaxMana(killer))
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "[Arena]: you lost the duel!")
            doPlayerSendTextMessage(killer, MESSAGE_STATUS_WARNING, "[Arena]: you win the duel!")
            doTeleportThing(cid, arena.exitPos)
            doTeleportThing(killer, arena.exitPos)
           -- doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
            --doSendMagicEffect(getThingPos(killer), CONST_ME_POFF)
            setPlayerStorageValue(cid, arena.pstorage, -1)
            setPlayerStorageValue(killer, arena.pstorage, -1)
            setGlobalStorageValue(arena.gstorage, -1)
            return false
        
    end
    end
    return true
end

function onLogin(cid)

    registerCreatureEvent(cid, "ArenaPVP")
    registerCreatureEvent(cid, "thinkPVP")


    return true     
end


-- function onThink(cid, interval)

-- if getGlobalStorageValue(arena.gstorage) < 1 then
--     return true 

-- else

-- local aux = 523623
-- if getGlobalStorageValue(aux) - os.time() <= 0 then 
--     setGlobalStorageValue(aux,os.time() + 2)

-- local arenapvp = { from1 = {x= 1096, y=1061, z= 5}, to1 = {x= 1103, y=1066, z= 5} }
-- local exitiPos = {x= 1099, y=1058, z= 5}

--    if isInArea(getThingPos(cid), arenapvp.from1, arenapvp.to1) then
--                                     if getQuantidadeCreature(cid) > 0 then
--                                                 doRemoveCreature(cid, exitiPos, arena.pstorage)
--                                                 setGlobalStorageValue(arena.gstorage, -1)
--                                         end


--       end
--       else return true
-- end
-- end

--     return true     
-- end



-- function onThink(cid, interval)
--     if(not isCreature(cid)) then
--         return true
--     end

--     if tostring(getPlayerName(cid)) == "Account Manager" then return true end
--     if getPlayerAccountId(cid) == 1 or getPlayerAccountId(cid) ==18 then return true end

-- if isPlayer(cid) then

--     	local tempo_auxiliar_segundo = 1329123

--         if getPlayerStorageValue(cid,tempo_auxiliar_segundo) <= os.time() then
--         setPlayerStorageValue(cid, tempo_auxiliar_segundo , os.time() + 2)    


-- --if getGlobalStorageValue(arena.gstorage) < 1 then
--   --  return true 

-- --else



--    if isInArea(getThingPos(cid), arenapvp.from1, arenapvp.to1) then
--                                     if getQuantidadeCreature(cid) > 0 then

--                                         end


--       end
-- --end



-- 		end

-- end


--     return true
-- end




function onThink(interval, lastExecution)

--local tempo_auxiliar_segundo = 138923

         --if getPlayerStorageValue(cid,tempo_auxiliar_segundo) <= os.time() then
	     --   setPlayerStorageValue(cid, tempo_auxiliar_segundo , os.time() + 2)  

	if getGlobalStorageValue(arena.gstorage) < 1 then 
		return true
	
	else


if getGlobalStorageValue(arena.hstorage) <= os.time() then




	local q1, r1 = {x= 1096, y=1061, z= 5}, {x= 1103, y=1066, z= 5}
	local first = getPlayersInArea(q1, r1)
	local exitiPos = {x= 1099, y=1058, z= 5}



	if first then
		for _, pid in pairs(first) do
				doTeleportThing(pid, exitiPos)
				--doRemoveCreature(pid, exitiPos, arena.pstorage)
				setPlayerStorageValue(pid, arena.pstorage, -1)
				doPlayerSendTextMessage(pid,18,"Voce foi retirado da Arena!")
                doSendMagicEffect(getCreaturePosition(pid), 2)

                setGlobalStorageValue(arena.gstorage, -1)
				--oPlayerPopupFYI(pid, "Seu tempo como dono da Cave 1 expirou. Você foi levado até seu templo.")
			
			
		end
	end
end
end
--else
--return true
--end

return true
end