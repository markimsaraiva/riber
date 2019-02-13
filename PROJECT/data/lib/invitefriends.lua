_invite_friends = {
	storages = {202411, 202412, 202413, 202414,202415}, -- points, jogador, recompensa lvl, recompensa items
	level_max = 29, -- level  MAX Q O PLAYER INVITADO  precisa TER, PARA falar seu friend, SENAO RODA.
	level_need = 150, -- que lever o jogador precisa ser para ganhar pontos
	levels_win = { -- leveis que receberão os pontos(feito pelo onAdvance)
		[30] = {pt = 3, lvl = 30},
		[60] = {pt = 6, lvl = 60},
		[90] = {pt = 9, lvl = 90},
		[120] = {pt = 12, lvl = 120},
		[150] = {pt = 15, lvl = 150},
		[180] = {pt = 18, lvl = 180},
		[210] = {pt = 21, lvl = 210},
		[240] = {pt = 24, lvl = 240},
		[270] = {pt = 27, lvl = 270},
		[300] = {pt = 30, lvl = 300}
	},
	rewards = { -- a cada tantos pontos, que tipo de reward ele irá receber(automático onLogin)
		[200] = {items = {{10128,1},{2160,10}}, p_days = 0, p_points = 0 , out = {0,0}},
		[400] = {items = {{10127,1},{2160,10}}, p_days = 0, p_points = 0 , out = {0,0}},
		[600] = {items = {{2160,10},{2160,10}}, p_days = 0, p_points = 0 , out = {130,138}},
		[800] = {items = {{2160,20},{2160,10}}, p_days = 0, p_points = 0 , out = {0,0}},
		[1000] = {items = {{2160,7},{2173,1}}, p_days = 0, p_points = 0 , out = {0,0}}
	}
}
function getInvitePoints(cid)
	return getPlayerStorageValue(cid, _invite_friends.storages[1]) < 0 and 0 or getPlayerStorageValue(cid, _invite_friends.storages[1])
end
function hasInviteFriend(cid)
	return getPlayerStorageValue(cid, _invite_friends.storages[2]) > 0 and true or false
end
function doInviteFriend(cid, GUID)
	return setPlayerStorageValue(cid, _invite_friends.storages[2], GUID)
end


function getNameFriend(cid)
	return getPlayerNameByGUID(getPlayerStorageValue(cid, _invite_friends.storages[2]))
end


function addInvitePoints(name, amount)
	local pid, Guid = getPlayerByNameWildcard(name), getPlayerGUIDByName(name)
	if not pid then
		local getFriendPoints = db.getResult("SELECT `value` FROM `player_storage` WHERE `player_id` = ".. Guid .." AND `key` = ".._invite_friends.storages[1])
		if (getFriendPoints:getID() ~= -1) then
			db.executeQuery("UPDATE `player_storage` SET `value` = ".. (getFriendPoints:getDataInt("value")+amount) .." WHERE `player_id` = ".. Guid .." AND `key` = ".._invite_friends.storages[1])
		end
	else
		setPlayerStorageValue(getPlayerByName(name), _invite_friends.storages[1], getInvitePoints(getPlayerByName(name))+amount)
	end
	return true
end




function getRewardsFriend(name, pid)
	local acc = getAccountIdByName(name)
	if isPlayer(getPlayerByNameWildcard(name)) then
		local target = getPlayerByNameWildcard(name)
		
		

		local FriendPoints, CheckPoints = getInvitePoints(target), getPlayerStorageValue(target, _invite_friends.storages[4])
		for vod, ka in pairs(_invite_friends.rewards) do
			local str = ""
			if FriendPoints >= vod and CheckPoints < vod then
				str = str.."--> Invite Players System <--\n\nVocê acaba de receber algumas recompensas:\n\nItems: \n"..getItemsFromList(ka.items)..".\n\n"
				if ka.p_days > 0 then 
					doPlayerAddPremiumDays(target, ka.p_days) 
					str = str.."Premium Days:\n"..ka.p_days.." Premium Days." 
				end
				if ka.p_points > 0 then 
					db.executeQuery('UPDATE accounts SET premium_points=premium_points+' .. ka.p_points ..' WHERE id=' .. acc)
					str = str.."Premium Points:\n"..ka.p_points.." Premium Points."
				end
				if ka.out[1] > 0 then 
					doPlayerAddOutfit(target, getPlayerSex(target) == 0 and ka.out[1] or ka.out[2], 3)
					str = str.."[New Outfit]\nRecebeu uma Nova Outfit."
				end
				setPlayerStorageValue(target, _invite_friends.storages[4], FriendPoints)
				
				
	

				 for var = 1,#ka.items do	
				 local town = getTownName(1)
				  local mailBoxPos = {x = 136, y = 159, z = 6}
 local parcel = doCreateItemEx(2595)
 local label = doAddContainerItem(parcel, 2599)
 doSetItemText(label, getCreatureName(target) .."\n".. town)
	local carta = doAddContainerItem(parcel, 1952) 
	

			doItemSetAttribute(carta, "text", "[+] Invite Players System [+]    Recompensa por um amigo avancar ao nivel  requerido!                                              [+] Invite Players System [+]")

     				doAddContainerItem(parcel, ka.items[var][1] ,  ka.items[var][2]) 
					
					local quanti = ka.items[var][2]
					
					 doPlayerSendTextMessage(target, MESSAGE_STATUS_CONSOLE_ORANGE,"[Invite Players System] Você Recebeu "..quanti.." "..getItemNameById(ka.items[var][1]).." por ter convidado  jogadores   para o servidor, Por favor conferir os itens no DP da Baiak City.")
					doTeleportThing(parcel, mailBoxPos)
				   end
				 end
			end
		end
		
						
				
	
	return true
end



-- function adicional --
function getItemsFromList(items) -- by vodka
local str = ''
if table.maxn(items) > 0 then
for i = 1, table.maxn(items) do
str = str .. items[i][2] .. ' ' .. getItemNameById(items[i][1])
if i ~= table.maxn(items) then str = str .. ', ' end end end
return str
end

--function, verificar cap 					addEvent(additem,10000,name,pid) else
					-- doPlayerSendTextMessage(target, MESSAGE_STATUS_CONSOLE_ORANGE, "[Invite Players System] Voce nao tem capacidade para ganhar o item. Vamos verificar novamente em 10 segundos!")

function additem(name,pid)
local acc = getAccountIdByName(name)
	if isPlayer(getPlayerByNameWildcard(name)) then
		local target = getPlayerByNameWildcard(name)
		local FriendPoints, CheckPoints = getInvitePoints(target), getPlayerStorageValue(target, _invite_friends.storages[4])
for vod, ka in pairs(_invite_friends.rewards) do
   local backpack = doPlayerAddItem(getPlayerByNameWildcard(name), 1999, 1) -- backpackID					
	 local carta = doAddContainerItem(backpack, 1952) 
	
	doItemSetAttribute(carta, "text", "[+] Invite Players System [+]    Recompensa por um amigo avancar ao nivel requerido!                                [+] Invite Players System [+]")
	
   for var = 1,#ka.items do
 
	if backpack == RETURNVALUE_NOERROR then
	
  doAddContainerItem(backpack, ka.items[var][1] ,  ka.items[var][2]) 
	doPlayerSendTextMessage(target, MESSAGE_STATUS_CONSOLE_ORANGE,"[Invite Players System] Você Recebeu algumas premiações por estar convidando jogadores para o servidor, Por favor conferir os itens no Depot.")
	stopEvent(additem)
  else
		doPlayerSendTextMessage(target, MESSAGE_STATUS_CONSOLE_ORANGE, "[Invite Players System] Voce nao tem capacidade para ganhar o item. Vamos verificar novamente em 10 segundos!")
		addEvent(additem,10000,name,pid)
  end
end
end
end
return true
end