function onSay(cid, words, param, channel)


  doPlayerSendTextMessage(cid,18,""..getPlayerStorageValue(cid,yok).."")
-- tempo_auxiliar_segundo = 11455
-- i = {5,10,18,24,30,35,65,66,144,171,180,185,221,241,246,252,255}
-- if getPlayerStorageValue(cid,tempo_auxiliar_segundo) <= #i then
-- if getPlayerStorageValue(cid,tempo_auxiliar_segundo) == -1 then setPlayerStorageValue(cid,tempo_auxiliar_segundo,1) 
-- end


--         doSendAnimatedText(getCreaturePosition(cid), ""..i[getPlayerStorageValue(cid,tempo_auxiliar_segundo)].."", i[getPlayerStorageValue(cid,tempo_auxiliar_segundo)])
--         setPlayerStorageValue(cid,tempo_auxiliar_segundo,getPlayerStorageValue(cid,  tempo_auxiliar_segundo) +1)
-- else

-- doPlayerSendTextMessage(cid,18,"chegou ao limite!")
-- setPlayerStorageValue(cid,tempo_auxiliar_segundo,-1)
-- end
-- function exivaa(name)

-- local playerPos, npcPos = getCreaturePosition(cid), getCreaturePosition(getCreatureByName(name))
-- local px, py = 0, 0
-- local pS = ""
-- local text = ""

-- if(playerPos.x == npcPos.x) and (playerPos.y < npcPos.y) then
-- px = 1
-- py = npcPos.y - playerPos.y
-- pS = "south \/"
-- elseif(playerPos.x == npcPos.x) and (playerPos.y > npcPos.y) then
-- px = 1
-- py = playerPos.y - npcPos.y
-- pS = "north /\ "
-- elseif(playerPos.x < npcPos.x) and (playerPos.y == npcPos.y) then
-- px = npcPos.x - playerPos.x
-- py = 1
-- pS = "east >"
-- elseif(playerPos.x > npcPos.x) and (playerPos.y == npcPos.y) then
-- px = playerPos.x - npcPos.x
-- py = 1
-- pS = "west <"
-- elseif(playerPos.x > npcPos.x) and (playerPos.y > npcPos.y) then
-- px = playerPos.x - npcPos.x
-- py = playerPos.y - npcPos.y
-- pS = "north-west < /\ "
-- elseif(playerPos.x > npcPos.x) and (playerPos.y < npcPos.y) then
-- px = playerPos.x - npcPos.x
-- py = npcPos.y - playerPos.y
-- pS = "south-west < \/"
-- elseif(playerPos.x < npcPos.x) and (playerPos.y < npcPos.y) then
-- px = npcPos.x - playerPos.x
-- py = npcPos.y - playerPos.y
-- pS = "south-east \/ >"
-- elseif(playerPos.x < npcPos.x) and (playerPos.y > npcPos.y) then
-- px = npcPos.x - playerPos.x
-- ps = playerPos.y - npcPos.y
-- pS = "north-east /\ >"
-- end

-- if(px <= 4 and py <= 4) then
-- text = "next you"
-- elseif((px > 4 and px <= 100) and (py > 4 and py <= 100)) or ((px > 4 and px <= 100) and (py <= 4)) or ((px <= 4) and (py > 4 and py <= 100)) then
-- text = "" .. pS .. ""
-- elseif((px > 100 and px <= 274) and (py > 100 and py <= 274)) or ((px > 100 and px <= 274) and (py <= 100)) or ((px <= 100) and (py > 100 and py <= 274)) then
-- text = "far to " .. pS .. ""
-- elseif((px > 274 and px <= 280) and (py > 274 and py <= 280)) or ((px > 274 and px <= 280) and (py < 274)) or ((px < 274) and (py > 274 and py <= 280)) then
-- text = "very far to " .. pS .. ""
-- elseif(px > 280 and py > 280) or (px > 280 and py < 280) or (px < 280 and py > 280) then
-- text = "" .. pS .. ""
-- end
-- return text
-- end
-- -- local a,b,c = nometotal()

-- local displayoutput = {"Carlin War"}
--     number = 1
--     param = string.lower(param)
--     skilllist = ""
--     command = TRUE
--      display = 1
--      number2 = 1
--     skilllist2 = ""




--                      --db.query("UPDATE players SET guild1 = 1 ;")
--                      --db.query("UPDATE players SET guild2 = 1 ;")
-- local player = db.getResult("SELECT `name`, `level` FROM `players` WHERE `guild1` = 1 ORDER BY `level` DESC;")    
--             if(player:getID() ~= -1) then
--                 while (true) do
--                      local name = player:getDataString("name")
--                      local level = player:getDataString("level")

                     
--                      local text = exivaa(name)
--                       skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.." -- LVL ["..level.."] - "..text.." ")
--                     number = number + 1
                  	
               
                     
                   			

--                     if not(player:next()) then
--                         break
--                     end
--                 end
--                 player:free()
--             end

-- local player = db.getResult("SELECT `name`, `level` FROM `players` WHERE `guild2` = 1 ORDER BY `level` DESC;")    
--             if(player:getID() ~= -1) then
--                 while (true) do
--                      local name = player:getDataString("name")
--                      local level = player:getDataString("level")

--                      local text = exivaa(name)
-- 					skilllist2 = skilllist2.. "\n#"..string.format("%5s",number2.."  "..name.." -- LVL ["..level.."] - "..text.." ")
--                     number2 = number2 + 1
                  	
               
                     
                   			

--                     if not(player:next()) then
--                         break
--                     end
--                 end
--                 player:free()
--             end
--           local dialog  = "[+] Lista de INIMIGOS na Carlin War [+]\n "..skilllist.."\n--------------------------\n [ GUILD 2 ] "..skilllist2..""

-- local itemtype = 9969
--     doShowTextDialog(cid, itemtype, dialog)







-- -- local soma = get_all_balance()

-- doPlayerSendTextMessage(cid,18,""..getPlayerStorageValue(cid,guild11)..", "..getPlayerStorageValue(cid,guild22).."")


-- quant = "abc"

--         if type(quant) == "number" then
--         	doPlayerSendTextMessage(cid, 18 , "NUMERO")
--         end
--         if type(quant) == "string" then
--         	doPlayerSendTextMessage(cid, 18 , "STRING")
--         end
-- local token = 12372
-- playyer = getCreatureName(cid)
-- local itemcount = getAccountIdByName(tostring(playyer))

-- db.query("UPDATE `players` SET `tokens` = "..get_transfer(playyer)+transfer.." WHERE account_id = "..getAccountIdByName(tostring(playyer)).." ;") 
local oi= getCreaturePosition(cid)
local i=1

for pos, v in pairs(oi) do
-- doPlayerSendTextMessage(cid, 18 , " "..v.." ")
if i ==1 then
 yyy = v 
elseif i==2 then
	xxx = v
elseif i==3 then
	stack = v
elseif i == 4 then
	zzz = v
end
i=i+1
end
local carlinMark1 = {
	[{x = xxx, y = yyy, z = zzz}] = {12, ""..getCreatureName(cid)..""}
}
	for pos,v in pairs(carlinMark1) do
	doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
end


	doPlayerSendTextMessage(cid, 18 , " "..xxx..", "..yyy..", "..zzz.." ")
	

-- function get_transfer(coco) -- xprank 
-- local ult = db.getResult("select `tokens` from players where account_id = "..getAccountIdByName(tostring(coco)).." ")

-- if (ult:getID() == -1) then
-- return false
-- end

-- local mamae = ult:getDataString("tokens")
-- ult:free()

-- caguei = tonumber(mamae)
-- return caguei

-- end

-- function get_tokens(cid) -- xprank 
-- local ult = db.getResult('select `tokens` from players where id = \''..getPlayerGUID(cid)..'\' ')

-- if (ult:getID() == -1) then
-- return false
-- end

-- local mamae = ult:getDataString("tokens")
-- ult:free()

-- caguei = tonumber(mamae)
-- return caguei

-- end

-- premiacaoxpsemanal(137,159,6,b,12372,700,9971,7) -- segundo colocado
	
-- premiacaoxpsemanal(138,159,6,c,12372,500,9971,5) -- terceiro colocado
-- pos1,pos2,pos3,item1,quant1,item2,quant2=136,159,6,12372,1000,9971,10 --primeiro colocado

--                             local town = getTownName(1)
--                             local mailBoxPos = {x = pos1, y = pos2, z = pos3}
--                             local parcel1 = doCreateItemEx(2595)
--                             local label1 = doAddContainerItem(parcel1, 2599)
--                             doSetItemText(label1, a .."\n".. town)
--                             local carta1 = doAddContainerItem(parcel1, 1952) 

--                             local hahaha = doAddContainerItem(parcel1, item1, quant1)
--                             local goldingot = doAddContainerItem(parcel1, item2,quant2)

--                             doItemSetAttribute(carta1, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..a.."\n\nRecompensa do rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
--                             doTeleportThing(parcel1, mailBoxPos)

-- doPlayerSendTextMessage(cid,18," "..a[1]..","..b[1]..","..c[1].."  ")



-- local n,a,x,vu,vulvl,vuxp,qu,qulvl,quexp= semnome()
-- j = 1

-- while j < 2 do
-- 	doPlayerSendTextMessage(cid,18," "..vu[j].." e "..vulvl[j].." com "..vuxp[j].." ")
-- 	j = j+1
-- end

-- j = 1

-- while j < 5 do
-- 	doPlayerSendTextMessage(cid,18," "..qu[j].." e "..qulvl[j].." com "..quexp[j].." ")
-- 	j = j+1
-- end

-- j = 1

-- while j < 2 do
-- 	-- doPlayerSendTextMessage(cid,18," "..n[j].." e "..a[j].." com "..x[j].." ")
-- 	doPlayerSendTextMessage(cid,18," "..vinteum[j].." ")
-- 	j = j+1
-- end











--                     local storageglobal21 = 144451
--                  local storageglobal20 = 144450
--                 local storageglobal19 = 144449
--                  local storageglobal18 = 144448
--                    local storageglobal17 = 144447
--                   local storageglobal16 = 144446
-- 	doPlayerSendTextMessage(cid,18, "challeng: "..global_army(storageglobal21).."")
-- 	doPlayerSendTextMessage(cid,18, "Master I: "..global_army(storageglobal20).."")
-- 	doPlayerSendTextMessage(cid,18, "Master II: "..global_army(storageglobal19).."")
-- 	doPlayerSendTextMessage(cid,18, "Diamond I: "..global_army(storageglobal18).."")
-- 	doPlayerSendTextMessage(cid,18, "Diamond II: "..global_army(storageglobal17).."")
-- 	doPlayerSendTextMessage(cid,18, "Diamond III: "..global_army(storageglobal16).."")
-- 	local storage_do_elo = 1234567


-- 	local time_model = " %d hora(s), %d minuto(s) e %d segundo(s)."
-- local timeLeft = convertTime(getGlobalStorageValue(arena_carlin_storage) - os.time())

-- --doPlayerSendTextMessage(cid, 27, 'falta ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
-- doPlayerSendTextMessage(cid, 27, 'war log ' ..getPlayerStorageValue(cid,war_carlin_log))
-- doPlayerSendTextMessage(cid, 27, 'falta ' ..time_model:format(timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
-- doPlayerSendTextMessage(cid,27,""..getGlobalStorageValue(storage_carlin_t4).."")
 

-- doPlayerSendTextMessage(cid,27,""..getGlobalStorageValue(carlin_power).."")

-- doPlayerSendTextMessage(cid,27,""..getGlobalStorageValue(arena_carlin_storage).."")


				     -- setGlobalStorageValue( arena_carlin_storage,-1000)
         --             setGlobalStorageValue(  guild_carlin_accept, -1)
         --             setGlobalStorageValue(  guild_carlin_invite, -1)
         --             setGlobalStorageValue(  carlinwar[1], 0)
         --             setGlobalStorageValue(  carlinwar[2], 0)
         --             setGlobalStorageValue(  kill_carlin[1], 0)
         --             setGlobalStorageValue(  kill_carlin[2], 0)
         --             setGlobalStorageValue(  storage_carlin_t4, -1)
         --             setGlobalStorageValue(  storage_carlin_time, 0)
         --             setGlobalStorageValue(carlin_power, 0)

         --             setGlobalStorageValue(restante_carlin[1], 0)
         --             setGlobalStorageValue(restante_carlin[2], 0)
         --             setGlobalStorageValue(restante_carlin[3], 0) 


-- db.query("INSERT INTO `entrosa_war` (`frags_guild1`, `frags_guild2`, `guild1`, `guild2`, `tempo`) VALUES (' "..getGlobalStorageValue(kill_carlin[1]).." ', ' "..getGlobalStorageValue(kill_carlin[2]).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_invite)).." ', ' "..getGuildNameById(getGlobalStorageValue(guild_accept)).." ', '10');")
--  doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 7, 0x4a)
--   doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 8, 0x4a)
--  doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 13, 0x4a)
--  doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 15, 0x4a)


-- 		-- doSendAnimatedText(getCreaturePosition(cid), "[TOP]", 89 )
-- if getTileInfo(getCreaturePosition(cid)).protection == true then
-- 		doPlayerSendTextMessage(cid,18, "protect! ")

-- else
-- 			doPlayerSendTextMessage(cid,18, "NO! ")
-- 	end


-- 	doPlayerSendTextMessage(cid,18, "top: "..topilvl().." ")

-- COLOR_BLACK = 0
-- COLOR_BLUE = 5
-- COLOR_GREEN = 18
-- COLOR_LIGHTGREEN = 66
-- COLOR_DARKBROWN = 78
-- COLOR_LIGHTBLUE = 89
-- COLOR_MAYABLUE = 95
-- COLOR_DARKRED = 108
-- COLOR_DARKPURPLE = 112
-- COLOR_BROWN = 120
-- COLOR_GREY = 129
-- COLOR_TEAL = 143
-- COLOR_DARKPINK = 152
-- COLOR_PURPLE = 154
-- COLOR_DARKORANGE = 156
-- COLOR_RED = 180
-- COLOR_PINK = 190
-- COLOR_ORANGE = 192
-- COLOR_DARKYELLOW = 205
-- COLOR_YELLOW = 210
-- COLOR_WHITE = 215





 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 2, 0x4a)

 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 3, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 4, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 5, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 6, 0x4a)

 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 7, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 8, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 12, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 13, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 14, 0x4a)

 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 15, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 19, 0x4a)
 -- doPlayerSendChannelMessage(cid, '', global_army(storageglobal16), 20, 0x4a)

-- if valor_do_army(cid) < 16 then
-- 	return true
-- else
-- doPlayerSendTextMessage(cid, 27, 'sto elo: ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
-- end


-- -- local v = {}
-- local k =1

-- local n,a,z = semnome()

-- while k <= z do
-- 	doPlayerSendTextMessage(cid,18," "..n[k].." , "..a[k].."")

-- k = k+1
-- end






-- 	for na,me in pairs(n) do
-- 			doPlayerSendTextMessage(cid,18," "..me.." ")
-- 		end

-- 	for ar,my in pairs(a) do		

-- 			doPlayerSendTextMessage(cid,18,""..my.."")
	
-- end

		
-- for ar,my in pairs(v) do

-- 			doPlayerSendTextMessage(cid,18,""..ar.." "..my[1].." ")
	
-- end


	-- for na,me in pairs(v) do

	-- 	doPlayerSendTextMessage(cid,18,""..na.." - "..me.."" )
	
	-- end
-- doPlayerSendTextMessage(cid,18,""..y.." : "..x.." ")
-- setPlayerStorageValue(cid, 99555 , i)
--  doPlayerSendTextMessage(cid,18, "TOMA: "..getPlayerStorageValue(cid,99555).."")
-- i = i + 1

-- v[getPlayerStorageValue(cid,99555)] = 



   -- doPlayerSendTextMessage(cid,18, "TOMA: "..valor_do_army(cid).."")






--doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))





	return true
end

