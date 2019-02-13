function onLogin(cid)
	registerCreatureEvent(cid, "FriendsPoints")
	if getPlayerStorageValue(cid, _invite_friends.storages[1]) < 0 then
		setPlayerStorageValue(cid, _invite_friends.storages[1], 0)
		setPlayerStorageValue(cid, _invite_friends.storages[4], 0)
	end
	if getInvitePoints(cid) > 0 then
	getRewardsFriend(getCreatureName(cid), getPlayerGUID(cid))
	end
	return true
end
function onAdvance(cid, skill, oldLevel, newLevel)
	if (skill == SKILL__LEVEL) then
	
	  
	   for vod,ka in pairs(_invite_friends.levels_win) do
	   if newLevel >= ka.lvl then
		if hasInviteFriend(cid) and getPlayerStorageValue(cid, _invite_friends.storages[3]) < ( ka.lvl ) then
		 
			local f_name, points = getNameFriend(cid), ka.pt
			
									
			local f_pid = getPlayerGUIDByName(f_name)
			setPlayerStorageValue(cid, _invite_friends.storages[3] , ka.lvl)
			addInvitePoints(f_name, points)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Invite Friends] voce  atingiu o level "..newLevel..", que e acima do level requerido "..ka.lvl.." e o seu amigou "..f_name.." recebeu "..points.." Friend Points. Obrigado!")
			if isPlayer(getPlayerByNameWildcard(f_name)) then
				getRewardsFriend(f_name, f_pid)

			end
			
		end
		end
	end
	return true
end
 end