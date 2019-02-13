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

TEMPOSEMANAL = 7*24*60*60
STORAGEGLOBAL = 67899

function xp_rank(cid) -- xprank 
local ult = db.getResult('select `xprank` from players where id = \''..getPlayerGUID(cid)..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("xprank")
ult:free()

caguei = tonumber(mamae)
return caguei

end

function experience(cid) --PEGAR O XP ATUAL
local res = db.getResult('select `experience` from players where name = \''..getPlayerName(cid)..'\'')

if(res:getID() == -1) then
return false
end

local ret = res:getDataString("experience")
res:free()
 
xixi = tonumber(ret) 
return xixi
end

function primeiro()
 local player = db.getResult("SELECT `id`, `name` FROM `players` WHERE group_id < '2' ORDER BY `xprank` DESC LIMIT 1;")    
            if(player:getID() ~= -1) then
                while (true) do
                    id = player:getDataString("id")
                    -- local level = player:getDataString("xprank")

                      -- skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.."  -  "..level)
					
                    if not(player:next()) then
                        break
                    end
                end
                

            end
			player:free()
				pau =  tonumber(id)
				return pau
end

function nomeprimeiro()
 local player = db.getResult("SELECT `name`, `id`  FROM `players` WHERE group_id < '2' ORDER BY `xprank` DESC LIMIT 1;")    
            if(player:getID() ~= -1) then

                while (true) do
                    name = player:getDataString("name")
                    -- local level = player:getDataString("xprank")

	                      -- skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.."  -  "..level)
                    if not(player:next()) then
                        break
                    end
					
                end
            

            end
			 player:free()
			 nami = tostring(name)
			 return nami
end

function premiacaoxpsemanal(pos1,pos2,pos3,a,item1,quant1,item2,quant2)
                            local town = getTownName(1)
                            local mailBoxPos = {x = pos1, y = pos2, z = pos3}
                            local parcel1 = doCreateItemEx(2595)
                            local label1 = doAddContainerItem(parcel1, 2599)
                            doSetItemText(label1, a[1] .."\n".. town)
                            local carta1 = doAddContainerItem(parcel1, 1952) 

                            local hahaha = doAddContainerItem(parcel1, item1, quant1)
                            local goldingot = doAddContainerItem(parcel1, item2,quant2)

                            doItemSetAttribute(carta1, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..a[1].."\n\nRecompensa do "..a[2].." lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
                           coco =  doTeleportThing(parcel1, mailBoxPos)
return coco

end


function nometotal()
 local player = db.getResult("SELECT `name`, `id`  FROM `players` WHERE group_id < '2' ORDER BY `xprank` DESC LIMIT 3;")    
            if(player:getID() ~= -1) then
            	local i = 0
                primeiro,segundo,terceiro={},{},{}
                while (true) do
                      i = i + 1
                if i == 1 then
                    primeiro[1] = player:getDataString("name")
                    primeiro[2] = "primeiro"
                end
                if i == 2 then
                    segundo[1] = player:getDataString("name")
                    segundo[2] = "segundo"
                 end

                if i == 3 then
                    terceiro[1] = player:getDataString("name")
                    terceiro[2] = "terceiro"
                end

                    if not(player:next()) then
                        break
                    end
					
                end
            
            end
			 player:free()
            -- primeiroo = tostring(primeiro)
            -- segundoo = tostring(segundo)
            --  terceiroo = tostring(terceiro)


			 return primeiro, segundo, terceiro
end 

function nometerceiro()
 local player = db.getResult("SELECT `name`, `id`  FROM `players` WHERE group_id < '2' ORDER BY `xprank` DESC LIMIT 3;")    
            if(player:getID() ~= -1) then
            	local i = 0
                while (true) do
                      i = i + 1
                   if i == 3 then
                    name = player:getDataString("name")
                end
 
                    if not(player:next()) then
                        break
                    end
					
                end
            end
			 player:free()
			 nami = tostring(name)

			 return nami
end
-- function contador (cid) 
	
		-- setGlobalStorageValue(STORAGEGLOBAL, 0)
		-- zerar_todos_os_xpsto()
		-- doPlayerSendTextMessage(cid,18,"1 TODAS AS XPSTO!!!")
		-- puxar_da_exp_para_xp_base(cid) -- apenas os online	
		-- doPlayerSendTextMessage(cid,18,"XPSTO 1, e sistema reiniciado")
		-- db.executeQuery("UPDATE players SET xpsto = 2 WHERE id = "..getPlayerGUID(cid).." ;")   		-- setPlayerStorageValue(cid, STORAGEPLAYER,5)
		-- doPlayerSendTextMessage(cid,27,"XPSTO 2 do globalstorage")
		-- setGlobalStorageValue(STORAGEGLOBAL, os.time() + (TEMPOSEMANAL))
		-- salvaserv()
	-- -- end
		   -- return true

	-- -- if xp_sto(cid) == 1 then 	-- if (getPlayerStorageValue(cid,STORAGEPLAYER) == 3) then
		-- -- puxar_da_exp_para_xp_base(cid) -- apenas os online	
		-- -- db.executeQuery("UPDATE players SET xpsto = 2 WHERE id = "..getPlayerGUID(cid).." ;")   		-- setPlayerStorageValue(cid, STORAGEPLAYER,5)
		-- -- doPlayerSendTextMessage(cid,18,"XPSTO 2, e sistema reiniciado")
		-- -- salvaserv()
		-- -- return true
	-- -- end
-- end

-- function salvaroplayer(cid)
	-- doPlayerSave(cid)
	-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Seu personagem foi salvo com sucesso.")
-- return true
-- end
	
-- function salvaserv1() 
    -- doSaveServer()
    -- return true
-- end

-- function salvaserv()
-- doBroadcastMessage("Servidor Sera Salvo em 15 segundos..Cuidado com o lag!")
-- addEvent(salvaserv1, 15000)
    -- return true
-- end






-- function xprankdiferencial(cid) --FAZER A DIFERENÇA DA XP ATUAL PARA XP BASE E AINDA JOGAR PARA O XPRANK

-- local res,ult = db.getResult('select `experience` from players where id = \''..getPlayerGUID(cid)..'\' '),db.getResult('select `xpbase` from players where id = \''..getPlayerGUID(cid)..'\' ')

-- if ((res:getID() == -1) and (ult:getID() == -1)) then
-- return false
-- end

-- local ret = res:getDataString("experience")
-- res:free()
-- local mamae = ult:getDataString("xpbase")
-- ult:free()

-- xixi = tonumber(ret)
-- coco = tonumber(mamae)

-- fezes = xixi-coco

-- db.executeQuery("UPDATE players SET xprank = "..fezes.." WHERE id = "..getPlayerGUID(cid).." ;")
-- return fezes
-- end


-- function antigaxp(cid) -- PEGAR A XPBASE 
-- local ult = db.getResult('select `xpbase` from players where id = \''..getPlayerGUID(cid)..'\' ')

-- if (ult:getID() == -1) then
-- return false
-- end

-- local mamae = ult:getDataString("xpbase")
-- ult:free()

-- caguei = tonumber(mamae)
-- return caguei

-- end

-- function puxar_da_exp_para_xp_base(cid) -- PASSAR O EXP ATUAL PARA A XP BASE ( X2 PARA X1)

 -- local player = db.getResult("SELECT `experience` FROM `players` WHERE id = "..getPlayerGUID(cid)..";")    
            -- if(player:getID() ~= -1) then
                -- while (true) do
                    -- local experience = player:getDataString("experience")

-- db.executeQuery("UPDATE players SET xpbase = "..experience.." WHERE id = "..getPlayerGUID(cid).." ;")


                    -- if not(player:next()) then
                        -- break
                    -- end
                -- end
                -- player:free()
            -- end
			
-- end


-- function xp_sto(cid) --PEGAR O XPSTO DA PESSOA
-- local ult = db.getResult('select `xpsto` from players where id = \''..getPlayerGUID(cid)..'\' ')

-- if (ult:getID() == -1) then
-- return false
-- end

-- local mamae = ult:getDataString("xpsto")
-- ult:free()
 
-- caguei = tonumber(mamae)

-- return caguei
-- end



-- function zerar_todos_os_xpsto() --ZERAR O XPSTO TODO MUNDO
	-- return db.executeQuery("UPDATE `players` SET `xpsto` = 1 ;")
-- end




