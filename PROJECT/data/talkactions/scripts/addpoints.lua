function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.[Exemplo:  /addpoints Marcos,50 ] ")
		return true
	end

	local t = string.explode(param, ",")
	local name = t[1]
	local quant = tonumber(t[2])

if playerExists(name) then 





	if(quant <=0 ) then 		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite pontos maior que zero! [ /addpoints Marcos,50 ] ")
 return true 
	end


            db.query("UPDATE `accounts` SET `premium_points` = "..get_premium_points(name)+quant.." WHERE id = "..getAccountIdByName(tostring(name)).." ;")
            db.query("UPDATE `accounts` SET `backup_points` = "..get_backup_points(name)+quant.." WHERE id = "..getAccountIdByName(tostring(name)).." ;")
            db.query("UPDATE `accounts` SET `rank_donate` = "..get_rank_points(name)+quant.." WHERE id = "..getAccountIdByName(tostring(name)).." ;")


                 doSendMagicEffect(getCreaturePosition(cid), 30)

 if #getPlayersOnline() >= 1 then
     for i = 1,#getPlayersOnline() do
     	if isPlayer(getCreatureByName(name))== isPlayer(getPlayersOnline()[i]) then

		doSendAnimatedText(getCreaturePosition(getCreatureByName(name)),"+ "..quant.." Pont" , 30)
		doPlayerSendTextMessage(getCreatureByName(name), MESSAGE_STATUS_CONSOLE_BLUE, "Voce recebeu "..quant.." pontos, na sua ACC! Voce agr possui "..get_premium_points(name).." points! Obrigado por contribuir com a manutencao e melhoria do servidor!\nStaff Gran Baiak")
		break
		end
		end
	end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "adicionado "..quant.." pontos para o player "..name..", ele ficou com "..get_premium_points(name).." pontos agr !")







else

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Esse player nao existe! [ /addpoints Marcos,50 ] ")

end

	return true
end



function get_premium_points(name) -- xprank 
local ult = db.getResult('select `premium_points` from accounts where id = \''..getAccountIdByName(tostring(name))..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("premium_points")
ult:free()

caguei = tonumber(mamae)
return caguei

end




function get_backup_points(name) -- xprank 
local ult = db.getResult('select `backup_points` from accounts where id = \''..getAccountIdByName(tostring(name))..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("backup_points")
ult:free()

caguei = tonumber(mamae)
return caguei

end




function get_rank_points(name) -- xprank 
local ult = db.getResult('select `rank_donate` from accounts where id = \''..getAccountIdByName(tostring(name))..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("rank_donate")
ult:free()

caguei = tonumber(mamae)
return caguei

end