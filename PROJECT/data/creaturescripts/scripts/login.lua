local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}


function onLogin(cid)
	if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return doRemoveCreature(cid, true)
		end
	end


	--salta
	local storages_loss = 492493
	if getPlayerStorageValue(cid,storages_loss) == -1 then
		setPlayerStorageValue(cid,storages_loss,1)

		local valor1 ,valor2 = 80,100 
		db.query("UPDATE players SET loss_experience = "..valor1.." WHERE id = "..getPlayerGUID(cid).." ;")
		db.query("UPDATE players SET loss_mana = "..valor2.." WHERE id = "..getPlayerGUID(cid).." ;")
		db.query("UPDATE players SET loss_skills = "..valor2.." WHERE id = "..getPlayerGUID(cid).." ;")
		db.query("UPDATE players SET loss_items = "..valor2.." WHERE id = "..getPlayerGUID(cid).." ;")

					--$char_to_copy->setloss_experience(80);
					--$char_to_copy->setloss_mana(100);
					--$char_to_copy->setloss_skills(100);
					--$char_to_copy->setloss_items(100);
		
	end

	--salt

	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil and getPlayerStorageValue(cid, "bless") ~= 5) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	if(getPlayerStorageValue(cid, "death_bless") == 1) then
		local t = {PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_ITEMS, PLAYERLOSS_CONTAINERS}
		for i = 1, #t do
			doPlayerSetLossPercent(cid, t[i], 100)
		end
		setPlayerStorageValue(cid, "death_bless", 0)
	end


	
	
	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		doPlayerOpenChannel(cid, 74)
	    doPlayerOpenChannel(cid, 15)
	    doPlayerOpenChannel(cid, 9)
	    doPlayerOpenChannel(cid, 30)
	    doPlayerOpenChannel(cid, 5)


addEvent(valid(doPlayerSendChannelMessage), 150, cid, "", "CHANNEL PARA INFORMACAO DOS SISTEMAS GRAN BAIAK!", TALKTYPE_CHANNEL_HIGHLIGHT, 74)
addEvent(valid(doPlayerSendChannelMessage), 150, cid, "", "CHANNEL PARA INFORMACAO DO PVP NO GRAN BAIAK!", 8, 15)
addEvent(valid(doPlayerSendChannelMessage), 150, cid, "", "CHANNEL PARA SOLICITAR AJUDA", 13, 9)
addEvent(valid(doPlayerSendChannelMessage), 150, cid, "", "CHANNEL PARA CHAMAR PARA QUESTS OU HUNTS!", TALKTYPE_CHANNEL_HIGHLIGHT, 30)
addEvent(valid(doPlayerSendChannelMessage), 150, cid, "", "VENDA OU COMPRE ITENS POR AQUI!", 8, 5)


		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	if getPlayerStorageValue(cid, 54304) > 0 then
     	doPlayerSetStorageValue(cid, 54304, 0)
 	end

-- MENSAGEM PARA O ACC MANAGER --
local getname = getPlayerName(cid)
if tostring(getname) == "Account Manager"  then 

	doPlayerSendTextMessage(cid, 19,"[Gran Baiak]: Bem vindo! Venha aproveitar no melhor servidor Baiak-RPG! Muitas Quests, Mapa bem elaborado, PVP balanceado, Sistemas Incriveis para voce e seus amigos se divertirem! ")
	doPlayerSendTextMessage(cid, 27,"[Gran Baiak]: Crie logo sua Account e venha curtir conosco!")
end

--FIM MENSAGEM ACC MANAGER--

 -- SEM SER ACC MANAGER --
local getname = getPlayerName(cid)
if not (tostring(getname) == "Account Manager" ) then  
 	--  COISAS E STORAGES --
 	if getPlayerStorageValue(cid,31121) == 0 then
	doPlayerSendTextMessage(cid, 18, "Bem Vindo!")
	doPlayerSendTextMessage(cid, 19, "[DOUBLE POINTS]: Receba pontos em dobro para qualquer doacao acima de R$20,00! Receba o triplo de pontos acima de R$ 100,00!")
	doPlayerSendTextMessage(cid, 27,"[Quest Log]: O Quest Log esta funcionando para as quests do Gran Baiak! ")
	end
	
 	if getPlayerStorageValue(cid, 31121) == -1 then
	doPlayerSetStorageValue(cid,31121,0)
	doPlayerSendTextMessage(cid, 19,"[Gran Baiak]: Bem vindo! Venha aproveitar no melhor servidor Baiak-RPG! Muitas Quests, Mapa bem elaborado, PVP balanceado, Sistemas Incriveis para voce e seus amigos se divertirem! ")
 	end

	
 end
--fim teste--	


---- fim EXP XP --------




-- AGE STORAGES --
		if (getPlayerStorageValue(cid, 6729) == -1) and (getPlayerStorageValue(cid, 6722) == -1) and (getPlayerStorageValue(cid, 6723) == -1) and (getPlayerStorageValue(cid, 6724) == -1) then
	     	doPlayerSetStorageValue(cid, 6729, 0)
			doPlayerSetStorageValue(cid, 6722, 0)
			doPlayerSetStorageValue(cid, 6723, 0)
			doPlayerSetStorageValue(cid, 6724, 0)
		end
	
	
	if getPlayerLevel(cid) < 717217 then 
registerCreatureEvent(cid, "AdvanceTeleport")
end

		registerCreatureEvent(cid, "entrosaLogin") 

	registerCreatureEvent(cid, "untrade") 
		registerCreatureEvent(cid, "Spider") 

    registerCreatureEvent(cid, "diamondorb")
    registerCreatureEvent(cid, "diamondorblogin")
	registerCreatureEvent(cid, "agethink")
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "fidelidade")
	registerCreatureEvent(cid, "fidelidadelogin")


	registerCreatureEvent(cid, "Mail")
	if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	
	registerCreatureEvent(cid, "fidelidade")
	registerCreatureEvent(cid, "outfitverificador")
	registerCreatureEvent(cid, "DesertDeath")
 	registerCreatureEvent(cid, "DesertCombat")
	registerCreatureEvent(cid, "BattleDeath")
	registerCreatureEvent(cid, "ZombieThink")
	registerCreatureEvent(cid, "ZombieDeath")
 	registerCreatureEvent(cid, "BattleCombat")
	registerCreatureEvent(cid, "FireStorm") 
 	registerCreatureEvent(cid, "ctf")
 	registerCreatureEvent(cid, "zombieevent")
	registerCreatureEvent(cid, "Idle")
    registerCreatureEvent(cid, "tpquest")
    registerCreatureEvent(cid, "CombatDodge")
	registerCreatureEvent(cid, "recompensa")
	registerCreatureEvent(cid, "SkullAmulet")
	registerCreatureEvent(cid, "BountyHunter")
	registerCreatureEvent(cid, "PlayerDeath")
	registerCreatureEvent(cid, "rewardpoints")
	registerCreatureEvent(cid, "armyk")
	registerCreatureEvent(cid, "armyl")
	registerCreatureEvent(cid, "armyt")

	registerCreatureEvent(cid, "autoloot")
	registerCreatureEvent(cid, "Auto Loot")
	registerCreatureEvent(cid, "RecordIp")
	registerCreatureEvent(cid, "onPrepareDeath") 
	registerCreatureEvent(cid, "TeleportMonster")	
	registerCreatureEvent(cid, "TeleportMonster2")	
	registerCreatureEvent(cid, "TeleportMonster3")	

	
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "recordIp")
	registerCreatureEvent(cid, "partyAndGuildProtection")
	
	 if (InitArenaScript ~= 0) then
    InitArenaScript = 1
    -- make arena rooms free
        for i = 42300, 42309 do
            setGlobalStorageValue(i, 0)
            setGlobalStorageValue(i+100, 0)
        end
    end
		registerCreatureEvent(cid, "xprank")

	registerCreatureEvent(cid, "GuildEvents")
registerCreatureEvent(cid, "critical")
registerCreatureEvent(cid, "BroadDeath")
registerCreatureEvent(cid, "AdvanceSave")
registerCreatureEvent(cid, "GuildMotd")
registerCreatureEvent(cid, "fraglook")
registerCreatureEvent(cid, "blesscheck")
registerCreatureEvent(cid, "DeathBroadcast")
registerCreatureEvent(cid, "addons")
registerCreatureEvent(cid, "onPrepareDeath")
registerCreatureEvent(cid, "Fraglook")
registerCreatureEvent(cid, "antimb")
registerCreatureEvent(cid, "antimagebomb")
registerCreatureEvent(cid, "FimVip")
registerCreatureEvent(cid, "ExpVip")
registerCreatureEvent(cid, "VipReceive")
registerCreatureEvent(cid, "redSkullAmulet")
registerCreatureEvent(cid, "FullHpMana")
registerCreatureEvent(cid, "killitem")
registerCreatureEvent(cid, "killosso")
registerCreatureEvent(cid, "guildsemanal")
registerCreatureEvent(cid, "killitems")

registerCreatureEvent(cid, "huntdeath")
registerCreatureEvent(cid, "loguthunt")
registerCreatureEvent(cid, "ReportBug")
registerCreatureEvent(cid, "CastleExp")
registerCreatureEvent(cid, "entrosaLogout")
registerCreatureEvent(cid, "AdvEffect")

 registerCreatureEvent(cid, "RushCombat") 
 registerCreatureEvent(cid, "RushAttack")
 registerCreatureEvent(cid, "RushDead")
 registerCreatureEvent(cid, "RushOutfit")
 registerCreatureEvent(cid, "topthink")
 
 	registerCreatureEvent(cid, "TaskNormal")
	 	registerCreatureEvent(cid, "tasksystem")


                            
registerCreatureEvent(cid, "ContadorTask")

registerCreatureEvent(cid, "dodge")
		registerCreatureEvent(cid, "town")
registerCreatureEvent(cid, "recompensaLvl")
if getPlayerStorageValue(cid, 48902) == -1 then
        setPlayerStorageValue(cid, 48902, 0) 
    end
	
	registerCreatureEvent(cid, "critical")




if getPlayerName(cid) == "Account Manager" and #getPlayersByIp(getPlayerIp(cid)) > 10 then
		return false
	end
	
	if getPlayerSlotItem(cid, 2).itemid == 7889 then
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doSendMagicEffect(getPlayerPosition(cid), 49)
	else
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)	
	end
 
	
 if getPlayerStorageValue(cid, 48903) == -1 and getPlayerStorageValue(cid, 48902) == -1 then
  setPlayerStorageValue(cid, 48903, 0) 
  setPlayerStorageValue(cid, 48902, 0) 
 end
 
 --  MAGNUS SYSTEM --------------
	registerCreatureEvent(cid,"magnussystem")
	if getPlayerStorageValue(cid, 95673) < 0 then
        setPlayerStorageValue(cid, 95673, 0) 
	end
	if getPlayerStorageValue(cid, 95674) < 0 then
        setPlayerStorageValue(cid, 95674, 0) 
	end
	
	return true
end
