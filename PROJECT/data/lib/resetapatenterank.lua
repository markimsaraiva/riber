

TEMPOSEMANALPATENTERANK = 1*1*3*60
CONTADOR_PATENTE_RANK =  1232222


function contadora(cid)


if getPlayerStorageValue(cid,CONTADOR_PATENTE_RANK) < os.time() then



setPlayerStorageValue(cid,XP_DE_COMPARACAO, xpdapessoa(cid))
db.executeQuery("UPDATE players SET xpbase = "..getPlayerStorageValue(cid,XP_DE_COMPARACAO).." WHERE id = "..getPlayerGUID(cid).." ;")

setPlayerStorageValue(cid,GLOBAU, os.time() + (TEMPOSEMANALPATENTERANK))
doPlayerSendTextMessage(cid,22," Reiniciado o sistema semanal!")
salvaserv1()
	return true
else
	return false

end
end

function salvaserv1()
doBroadcastMessage("Servidor Salvando..")
    doSaveServer()
    return true
end

function salvaserv()
doBroadcastMessage("Servidor sendo Salvo..")
addEvent(salvaserv1, 1000)
    return true
end

-- function xpantiga(cid)
-- return getPlayerStorageValue(cid,INDIVIDUALXP)

-- end

function xpdapessoa(cid)

local res = db.getResult('select `experience` from players where name = \''..getPlayerName(cid)..'\'')

    
-- local query = db.getResult("SELECT `player_id` FROM `kill` and `player_killers` or `player_deaths` WHERE `player_id` = "..getPlayerGUID(cid).." ")
-- local query = db.getResult("Select * FROM `players` WHERE `experience` > 4200;")
-- if query:getID() ~= -1 then
   -- name = query:getDataString("name") 

-- end   
if(res:getID() == -1) then
return false
end

local ret = res:getDataString("experience")
res:free()

 
xixi = tonumber(ret) 
return xixi
end


function xprankdiferencial(cid)

local res,ult = db.getResult('select `experience` from players where id = \''..getPlayerGUID(cid)..'\' '),db.getResult('select `xpbase` from players where id = \''..getPlayerGUID(cid)..'\' ')


if ((res:getID() == -1) and (ult:getID() == -1)) then
return false
end



local ret = res:getDataString("experience")
res:free()
local mamae = ult:getDataString("xpbase")
ult:free()


 
xixi = tonumber(ret)
coco = tonumber(mamae)

fezes = xixi-coco

db.executeQuery("UPDATE players SET xprank = "..fezes.." WHERE id = "..getPlayerGUID(cid).." ;")


return fezes
end

function antigaxp(cid)
local ult = db.getResult('select `xpbase` from players where id = \''..getPlayerGUID(cid)..'\' ')


if (ult:getID() == -1) then
return false
end




local mamae = ult:getDataString("xpbase")
ult:free()


 
caguei = tonumber(mamae)



return caguei

end

