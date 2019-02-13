
function onStatsChange(cid, attacker, _type, combat, value)
  saida = {x = 1103, y = 1056, z = 4}


    if isPlayer(cid) and getPlayerStorageValue(cid, yok) == 1 and _type == STATSCHANGE_HEALTHLOSS then
        if value >= getCreatureHealth(cid) then
            local killer = attacker

            if getPlayerStorageValue(killer,arenalivre) == -1 then
                setPlayerStorageValue(killer,arenalivre,0)
            end
             db.query("UPDATE `players` SET `arenalivre` = `arenalivre` + 1 WHERE id = "..getPlayerGUID(killer).." ;")
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureAddMana(cid, getCreatureMaxMana(cid))
            doPlayerSendTextMessage(cid, 18, "[Arena Livre]: Voce perdeu todo hp!")
            doRemoveCondition(cid, CONDITION_INFIGHT)
            doPlayerSendTextMessage(killer, 18, "[Arena Livre]: Voce Massacrou  "..getPlayerStorageValue(killer,arenalivre).." NOOBs No Total HJ")
            doTeleportThing(cid, saida)
            doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
            --doSendMagicEffect(getThingPos(killer), CONST_ME_POFF)
            setPlayerStorageValue(cid, yok, -1)
            return false
        
    end
    end
    return true
end

function onLogin(cid)

    registerCreatureEvent(cid, "ArenaCima")


    return true     
end






-- function onThink(interval, lastExecution)

-- 	if getGlobalStorageValue(arena.gstorage) < 1 then 
-- 		return true
	
-- 	else


-- if getGlobalStorageValue(arena.hstorage) <= os.time() then

-- 	local q1, r1 = {x= 1096, y=1061, z= 5}, {x= 1103, y=1066, z= 5}
-- 	local first = getPlayersInArea(q1, r1)
-- 	local exitiPos = {x= 1099, y=1058, z= 5}

-- 	if first then
-- 		for _, pid in pairs(first) do
-- 				doTeleportThing(pid, exitiPos)
-- 				setPlayerStorageValue(pid, arena.pstorage, -1)
-- 				doPlayerSendTextMessage(pid,18,"Voce foi retirado da Arena!")
--                 doSendMagicEffect(getCreaturePosition(pid), 2)

--                 setGlobalStorageValue(arena.gstorage, -1)
-- 				--oPlayerPopupFYI(pid, "Seu tempo como dono da Cave 1 expirou. Você foi levado até seu templo.")
			
			
-- 		end
-- 	end
-- end
-- end

-- return true
-- end