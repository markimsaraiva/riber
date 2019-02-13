function onSay(cid, words, param, channel)
	local invite_max = 10
	local param = param:lower()
	if param == "" or not param then
		doPlayerSendCancel(cid, "Voce precisa digitar o nome de um jogador.") return true
	elseif param == "points" then
		doPlayerPopupFYI(cid,"[+] Invite Friend System [+]\n\nvoce tem ["..getInvitePoints(cid).."] Friends Points.") return true
	elseif number_max(getPlayerGUIDByName(param)) >= invite_max then
		doPlayerSendCancel(cid,"o jogador ["..param.."] ja atingiu o limite de "..invite_max.." convites!") return true
	elseif hasInviteFriend(cid) then
		doPlayerSendCancel(cid, "Voce ja selecionou o jogador ["..getNameFriend(cid).."] para receber recompensas por te convidar a jogar neste servidor!") return true
	elseif not getPlayerGUIDByName(param) then
		doPlayerSendCancel(cid, "Desculpe, mas o jogador [" .. param .. "] nao existe.") return true
	elseif getPlayerIp(cid) == tonumber(db.getResult("SELECT `lastip` FROM `players` WHERE `id` = "..getPlayerGUIDByName(param)):getDataString("lastip")) then
	doPlayerSendCancel(cid, "Desculpe, mas voce nao pode se auto invitar por estar com o mesmo IP.") return true
	elseif getPlayerLevel(cid) > _invite_friends.level_max or db.getResult("SELECT `level` FROM `players` WHERE `id` = "..getPlayerGUIDByName(param)):getDataInt("level") < _invite_friends.level_need then
		doPlayerSendCancel(cid, (getPlayerLevel(cid) > _invite_friends.level_max and "Desculpe, mas voce precisa ter no maximo level ".._invite_friends.level_max.." para indicar alguem." or "Desculpe, mas o jogador ["..param.."] precisa ter no minimo level ".._invite_friends.level_need.." para ser escolhido.")) return true
	elseif getCreatureName(cid):lower() == param then
		doPlayerSendCancel(cid, "Desculpe, mas voce não pode se auto invitar.") return true
	end
	doInviteFriend(cid, getPlayerGUIDByName(param))

 local invite_count = number_max(getPlayerGUIDByName(param)) 
 local valor_atual = invite_count + 1

	db.executeQuery("UPDATE `players` SET `invite_friend_count` = "..valor_atual.." where id = "..getPlayerGUIDByName(param).." ;")

	
	doPlayerSendTextMessage(cid, 25, "Voce indicou o jogador "..param..", este sistema e uma forma de agradecer a voces por trazerem amigos para jogar !")
	doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
	return true
end


function number_max(GUID) -- contador maximo, invite friend
local ult = db.getResult('select `invite_friend_count` from players where id = \''..GUID..'\' ')

if (ult:getID() == -1) then
return false
end

local papai = ult:getDataString("invite_friend_count")
ult:free()

borrei = tonumber(papai)
return borrei

end
