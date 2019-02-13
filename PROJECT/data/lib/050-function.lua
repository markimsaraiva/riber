-- function getGuildNameByID(gid) -- By Killua
--     local query = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = '"..gid.."'")
--     if query:getID() == -1 then
--         return false
--     end
--     local name = query:getDataString("name")
--     query:free()
--     return name
-- end

function getGuildNameById(id) -- xprank 
local ult = db.getResult('select `name` from `guilds` where id = \''..id..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("name")
ult:free()

caguei = tostring(mamae)
return caguei

end

function get_all_balance()
 local player = db.getResult("SELECT `balance` FROM `players` WHERE group_id < '2';")    
            if(player:getID() ~= -1) then
 			soma = 0
                while (true) do

                    balance = player:getDataString("balance")
               
                    soma = soma + tonumber(balance)
                    if not(player:next()) then
                        break
                    end
					
                end
            
            end
			 return soma
end 

		function topilvl()
 local player = db.getResult("SELECT `name` FROM `players` WHERE group_id < '2' ORDER BY `level` DESC LIMIT 1;")    
            if(player:getID() ~= -1) then
 
                while (true) do

                    top = player:getDataString("name")
               

                    if not(player:next()) then
                        break
                    end
					
                end
            
            end
			 player:free()
     
 


			 return top
end 

--inicio citywar

--fim city war


-- function effect(cid)
--          if isPlayer(cid) then
--             local pos = getCreaturePosition(cid)
--             doSendMagicEffect(pos, 13)
--          end
-- end

function getPlayerExtraExpRate(cid) -- By MatheusMkalo
    return getPlayerRates(cid)[8]
end




function doSetItemActionId(uid, actionid)
   return doItemSetAttribute(uid, "aid", actionid)
end

function getTopLevel() --[[( Marcryzius )]]--
local target,name,level = db.getResult("SELECT `name`, `level` FROM `players` WHERE `group_id` <= 2 ORDER BY 'level' DESC;"),"",0
	if(target:getID() ~= -1) then 
		repeat
		local glevel = target:getDataInt("level")	
			if(level < glevel)then
				name,level = target:getDataString("name"),	glevel
			end
		until not(target:next()) 
	end
	target:free()
	return name,level
end


function doPlayerRemoveLethalConditions(cid)
        local tmp = {1, 2, 4, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 32768, 65536}
        for i = 1, #tmp do
            if(hasCondition(cid, tmp[i])) then doRemoveCondition(cid, tmp[i]) end
        end
        return true
    end

function isWalkable(pos, creature, proj, pz)
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end

function isInArray(array, value, caseSensitive)
	if(caseSensitive == nil or caseSensitive == false) and type(value) == "string" then
		local lowerValue = value:lower()
		for _, _value in ipairs(array) do
			if type(_value) == "string" and lowerValue == _value:lower() then
				return true
			end
		end
	else
		for _, _value in ipairs(array) do
			if (value == _value) then return true end
		end
	end

	return false
end

---XP RANK FUNÇAO PREMIAÇAO---




--FIM XP RANK FUNÇAO PREMIAÇAO --


------------------INICIO ARMY SISTEM --------------------------

function retornar_army_max()
 local player = db.getResult("SELECT `army_level` FROM `players` WHERE group_id < '2' ORDER BY `army_level` DESC LIMIT 1;")    
            if(player:getID() ~= -1) then
                local i = 0
 
                while (true) do

                    primeiro = player:getDataString("army_level")
               
                    if not(player:next()) then
                        break
                    end
                    
                end
            
            end
             player:free()
            challenger = tonumber(primeiro)



             return challenger
end 

function semnome()
 local player = db.getResult("SELECT `army_level`, `army_experience`, `name` FROM `players` WHERE group_id < '2' AND `id`!= 6361 AND `id`!= 2 AND `id`!= 3 AND `id`!= 4 AND `id`!= 5 AND `id`!= 6  ORDER BY `army_level` DESC ;")    
            if(player:getID() ~= -1) then
                local i,j,k,l,m,n,o,p,q= 1,1,1,1,1,1,1,1,1
 				n,a,x = {},{},{}

 				vinteum, vinteumlvl,vinteumxp={},{},{}
 				vinte, vintelvl,vintexp={},{},{}
 				dezenove, dezenovelvl,dezenovexp={},{},{}
 				dezoito, dezoitolvl,dexoitoxp={},{},{}
 			    dezessete, dezessetelvl, dezessetexp={},{},{}
 				dezesseis,dezesseislvl,dezesseisxp={},{},{}
 				
                while (true) do

                    army = player:getDataString("army_level")
                    name = player:getDataString("name")
                    xp = player:getDataString("army_experience")
          			 n[i] = tostring(name)
          			 a[i] = tonumber(army)
          			 x[i] = tonumber(xp)

          			 if tonumber(army) == 21 then
          			 vinteum[j] = tostring(name)
          			 vinteumlvl[j] = tonumber(army)
          			 vinteumxp[j] = tonumber(xp)
          			 j = j +1
          			end
          			 if tonumber(army) == 20 then
          			 vinte[k] = tostring(name)
          			 vintelvl[k] = tonumber(army)
          			 vintexp[k] = tonumber(xp)
          			 k = k +1
          			end
          			 if tonumber(army) == 19 then
          			 dezenove[l] = tostring(name)
          			 dezenovelvl[l] = tonumber(army)
          			 dezenovexp[l] = tonumber(xp)
          			 l = l +1
          			end
          			 if tonumber(army) == 18 then
          			 dezoito[m] = tostring(name)
          			 dezoitolvl[m] = tonumber(army)
          			 dezoitoxp[m] = tonumber(xp)
          			 m = m +1
          			end
          			 if tonumber(army) == 17 then
          			 dezessete[n] = tostring(name)
          			 dezessetelvl[n] = tonumber(army)
          			 dezessetexp[n] = tonumber(xp)
          			 n = n +1
          			end

          			 if tonumber(army) == 16 then
          			 dezesseis[o] = tostring(name)
          			 dezesseislvl[o] = tonumber(army)
          			 dezesseisxp[o] = tonumber(xp)
          			 o = o +1
          			end



            			i = i + 1
                    if not(player:next()) then
                        break
                    end
                
				 
                end
            
            end
             player:free()




             return  n,a,x,vinteum,vinteumlvl,vinteumxp,vinte,vintelvl,vintexp,dezenove,dezenovelvl,dezenovexp,dezoito,dezoitolvl,dezoitoxp,dezessete,dezessetelvl,dezessetexp,dezesseis,dezesseislvl,dezesseisxp
end 

ARMY = {
	[1] = {50, 100, "Bronze V", 50000000}, -- [Número] = {Pontos Kill, Points para UP, "Nome",PLATINIUM COINS POR KILL},
	[2] = {50, 100, "Bronze IV", 70000000},
	[3] = {50, 100, "Bronze III", 11000000},
	[4] = {50, 100, "Bronze II", 18000000},
	[5] = {50, 100, "Bronze I", 22000000},
	[6] = {50, 100, "Silver IV", 26000000},
	[7] = {50, 100, "Silver III", 30000000},
	[8] = {50, 100, "Silver II", 34000000},
	[9] = {50, 100, "Silver I", 38000000},
	[10] = {50, 100, "Gold III", 45000000},
	[11] = {50, 100, "Gold II", 60000000},
	[12] = {50, 100, "Gold I", 80000000},
	[13] = {50, 100, "Platinum III", 100000000},
	[14] = {50, 100, "Platinum II", 120000000},
	[15] = {50, 100, "Platinum I", 140000000},
	[16] = {50, 100, "Diamond III", 160000000}, --11 PESSOAS E OQ VAI SER Q PODEM OCUPAR (21 VAGAS)   6
	[17] = {50, 100, "Diamond II", 180000000}, --9 PRIMEIRAS Q PASSAR DE NVL VAI PRO DIAMOND II  (15 VAGAS) 5
	[18] = {50, 100, "Diamond I", 200000000}, --7 PRIMEIRAS Q PASSAR DE NVL VAI PRO DIAMOND I (10 VAGAS)  4
	[19] = {50, 100, "Master II", 220000000}, --5 PRIMEIRAS Q PASSR D NVL VAI PRO MASTER II (6 VAGAS)  3
	[20] = {50, 100, "Master I", 400000000},  --3 PRIMEIRAS Q PASSAR DE NVL VAI PRO MASTER I (3 VAGAS) 2
	[21] = {50, 100, "Challenger", 1000000000} --1 PRIMEIRA Q PASSAR VAI PRO CHALLENGER (1 VAGA) 1
		
}   
                       
ARMY_LEVEL = 2014159
ARMY_EXPERIENCE = 2014160

vezes_ao_dia = 1534345
konstante_dia = 1347400
konstante = 1322750
tempo_army = 2*60
storageglobal21 = 145451
storageglobal20 = 145450
storageglobal19 = 145449
storageglobal18 = 145448
storageglobal17 = 145447
storageglobal16 = 145446


function valor_do_army(cid) --PEGAR O VALOR DO ARMY 
local res = db.getResult('select `army_level` from `players` where `id` = \''..getPlayerGUID(cid)..'\'')

if(res:getID() == -1) then
return false
end

local ret = res:getDataString("army_level")
res:free()
 
army = tonumber(ret) 
return army
end




function valor_do_exp_army(cid) --PEGAR O VALOR DO EXPERIENCE ARMY
local res = db.getResult('select `army_experience` from `players` where `id` = \''..getPlayerGUID(cid)..'\'')

if(res:getID() == -1) then
return false
end

local ret = res:getDataString("army_experience")
res:free()
 
army = tonumber(ret) 
return army
end



function global_army(key) --
local res = db.getResult('select `value` from `global_storage` where `key` = \''..key..'\'')

if(res:getID() == -1) then
return false
end

local ret = res:getDataString("value")
res:free()
 
global = tonumber(ret) 
return global
end

TEMPO_PATENTI = 30*24*60*60
PATENTI = 43331


--- FIM ARMY SISYEM ------------------------------------


function convertTime(time) --CONVERSOR DE TEMPO STORAGE PARA HORAS NORMAIS
local t_table = {}
t_table.days = math.floor(time / 86400)
time = time - (t_table.days * 86400)
t_table.hours = math.floor(time / 3600)
time = time - (t_table.hours * 3600)
t_table.minutes = math.floor(time / 60)
t_table.seconds = time - (t_table.minutes * 60)
return t_table
end


function doAddPoints(cid, points)
db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end

function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if(isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end


function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if(doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerTakeItem(cid, itemid, amount)
	return getPlayerItemCount(cid, itemid) >= amount and doPlayerRemoveItem(cid, itemid, amount)
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(not doPlayerTakeItem(cid, itemid, count)) then
		return false
	end

	if(not doPlayerAddMoney(cid, cost)) then
		error('[doPlayerSellItem] Could not add money to: ' .. getPlayerName(cid) .. ' (' .. cost .. 'gp).')
	end

	return true
end

function doPlayerWithdrawMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
end

function doPlayerDepositMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
end

function doPlayerAddStamina(cid, minutes)
	return doPlayerSetStamina(cid, getPlayerStamina(cid) + minutes)
end

function isPremium(cid)
	return (isPlayer(cid) and (getPlayerPremiumDays(cid) > 0 or getBooleanFromString(getConfigValue('freePremium'))))
end

function getMonthDayEnding(day)
	if(day == "01" or day == "21" or day == "31") then
		return "st"
	elseif(day == "02" or day == "22") then
		return "nd"
	elseif(day == "03" or day == "23") then
		return "rd"
	end

	return "th"
end

function getMonthString(m)
	return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function doNumberFormat(i)
	local str, found = string.gsub(i, "(%d)(%d%d%d)$", "%1,%2", 1), 0
	repeat
		str, found = string.gsub(str, "(%d)(%d%d%d),", "%1,%2,", 1)
	until found == 0
	return str
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function getTibiaTime(num)
	local minutes, hours = getWorldTime(), 0
	while (minutes > 60) do
		hours = hours + 1
		minutes = minutes - 60
	end

	if(num) then
		return {hours = hours, minutes = minutes}
	end

	return {hours =  hours < 10 and '0' .. hours or '' .. hours, minutes = minutes < 10 and '0' .. minutes or '' .. minutes}
end

function doWriteLogFile(file, text)
	local f = io.open(file, "a+")
	if(not f) then
		return false
	end

	f:write("[" .. os.date("%d/%m/%Y %H:%M:%S") .. "] " .. text .. "\n")
	f:close()
	return true
end

function xpmonstro(Name)
    return getMonsterInfo(Name).experience
end

function getMonsterExperience(target)

	if getCreatureTarget(cid) then

		name = getCreatureName(getCreatureTarget(cid))

		exprate = getPlayerExperience(cid)

		monster = getMonsterInfo(name)

		exp = exprate*monster.experience

		return exp

	else

		return false

	end

end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function doMutePlayer(cid, time)
	local condition = createConditionObject(CONDITION_MUTED, (time == -1 and time or time * 1000))
	return doAddCondition(cid, condition, false)

end

function doSummonCreature(name, pos)
	local cid = doCreateMonster(name, pos, false, false)
	if(not cid) then
		cid = doCreateNpc(name, pos)
	end

	return cid
end

function getPlayersOnlineEx()
	local players = {}
	for i, cid in ipairs(getPlayersOnline()) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerByName(name)
	local cid = getCreatureByName(name)
	return isPlayer(cid) and cid or nil
end

function isPlayer(cid)
	return isCreature(cid) and cid >= AUTOID_PLAYERS and cid < AUTOID_MONSTERS
end

function isPlayerGhost(cid)
	return isPlayer(cid) and (getCreatureCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_INVISIBLE, CONDITIONID_DEFAULT) or getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN))
end

function isMonster(cid)
	return isCreature(cid) and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isNpc(cid)
	-- Npc IDs are over int32_t range (which is default for lua_pushnumber),
	-- therefore number is always a negative value.
	return isCreature(cid) and (cid < 0 or cid >= AUTOID_NPCS)
end

function isUnderWater(cid)
	return isInArray(underWater, getTileInfo(getCreaturePosition(cid)).itemid)
end

function doPlayerAddLevel(cid, amount, round)
	local experience, level, amount = 0, getPlayerLevel(cid), amount or 1
	if(amount > 0) then
		experience = getExperienceForLevel(level + amount) - (round and getPlayerExperience(cid) or getExperienceForLevel(level))
	else
		experience = -((round and getPlayerExperience(cid) or getExperienceForLevel(level)) - getExperienceForLevel(level + amount))
	end

	return doPlayerAddExperience(cid, experience)
end

function doPlayerAddMagLevel(cid, amount)
	local amount = amount or 1
	for i = 1, amount do
		doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true) + 1) - getPlayerSpentMana(cid), false)
	end

	return true
end

function doPlayerAddSkill(cid, skill, amount, round)
	local amount = amount or 1
	if(skill == SKILL__LEVEL) then
		return doPlayerAddLevel(cid, amount, round)
	elseif(skill == SKILL__MAGLEVEL) then
		return doPlayerAddMagLevel(cid, amount)
	end

	for i = 1, amount do
		doPlayerAddSkillTry(cid, skill, getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1) - getPlayerSkillTries(cid, skill), false)
	end

	return true
end

function isPrivateChannel(channelId)
	return channelId >= CHANNEL_PRIVATE
end

function doBroadcastMessage(text, class)
	local class = class or MESSAGE_STATUS_WARNING
	if(type(class) == 'string') then
		local className = MESSAGE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendTextMessage(pid, class, text)
	end

	print("> Broadcasted message: \"" .. text .. "\".")
	return true
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
	local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
	if(checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
		return false
	end

	if(type(class) == 'string') then
		local className = TALKTYPE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doCreatureSay(cid, text, class, ghost, pid)
	end

	print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
	return true
end

function doCopyItem(item, attributes)
	local attributes = ((type(attributes) == 'table') and attributes or { "aid" })

	local ret = doCreateItemEx(item.itemid, item.type)
	for _, key in ipairs(attributes) do
		local value = getItemAttribute(item.uid, key)
		if(value ~= nil) then
			doItemSetAttribute(ret, key, value)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function doSetItemText(uid, text, writer, date)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	doItemSetAttribute(uid, "text", text)
	if(writer ~= nil) then
		doItemSetAttribute(uid, "writer", tostring(writer))
		if(date ~= nil) then
			doItemSetAttribute(uid, "date", tonumber(date))
		end
	end

	return true
end

function getItemWeightById(itemid, count, precision)
	local item, count, precision = getItemInfo(itemid), count or 1, precision or false
	if(not item) then
		return false
	end

	if(count > 100) then
		-- print a warning, as its impossible to have more than 100 stackable items without "cheating" the count
		print('[Warning] getItemWeightById', 'Calculating weight for more than 100 items!')
	end

	local weight = item.weight * count
	return precission and weight or math.round(weight, 2)
end

function choose(...)
	local arg, ret = {...}

	if type(arg[1]) == 'table' then
		ret = arg[1][math.random(#arg[1])]
	else
		ret = arg[math.random(#arg)]
	end

	return ret
end

function doPlayerAddExpEx(cid, amount)
	if(not doPlayerAddExp(cid, amount)) then
		return false
	end

	local position = getThingPosition(cid)
	doPlayerSendTextMessage(cid, MESSAGE_EXPERIENCE, "You gained " .. amount .. " experience.", amount, COLOR_WHITE, position)

	local spectators, name = getSpectators(position, 7, 7), getCreatureName(cid)
	for _, pid in ipairs(spectators) do
		if(isPlayer(pid) and cid ~= pid) then
			doPlayerSendTextMessage(pid, MESSAGE_EXPERIENCE_OTHERS, name .. " gained " .. amount .. " experience.", amount, COLOR_WHITE, position)
		end
	end

	return true
end

function getItemTopParent(uid)
	local parent = getItemParent(uid)
	if(not parent or parent.uid == 0) then
		return nil
	end

	while(true) do
		local tmp = getItemParent(parent.uid)
		if(tmp and tmp.uid ~= 0) then
			parent = tmp
		else
			break
		end
	end

	return parent
end

function getItemHolder(uid)
	local parent = getItemParent(uid)
	if(not parent or parent.uid == 0) then
		return nil
	end

	local holder = nil
	while(true) do
		local tmp = getItemParent(parent.uid)
		if(tmp and tmp.uid ~= 0) then
			if(tmp.itemid == 1) then -- a creature
				holder = tmp
				break
			end

			parent = tmp
		else
			break
		end
	end

	return holder
end

function valid(f)
	return function(p, ...)
		if(isCreature(p)) then
			return f(p, ...)
		end
	end
end

function addContainerItems(container,items)
	local items_mod = {}
	for _, it in ipairs(items) do
		if( isItemStackable(it.id) and it.count > 100) then
			local c = it.count
			while( c > 100 ) do
				table.insert(items_mod,{id = it.id,count = 100})
				c = c - 100
			end
			if(c > 0) then
				table.insert(items_mod,{id = it.id,count = c})
			end
		else
			table.insert(items_mod,{id = it.id,count = 1})
		end
	end

	local free = getContainerCap(container.uid) - (getContainerSize(container.uid) )
	local count = math.ceil(#items_mod/ free)
	local main_bp = container.uid
	local insert_bp = main_bp
	local counter = 1
	for c,it in ipairs(items_mod) do
		local _c = isItemStackable(it.id) and (it.count > 100 and 100 or it.count) or 1
		if count > 1 then
			if (counter < free) then
				doAddContainerItem(insert_bp, it.id, _c)
			else
				insert_bp = doAddContainerItem(insert_bp, container.itemid, 1)
				count = (#items_mod)-(free-1)
				free = getContainerCap(insert_bp) 
				count = math.ceil(count/ free)
				doAddContainerItem(insert_bp, it.id, _c)
				counter = 1
			end
			counter = counter + 1
		else
			doAddContainerItem(insert_bp, it.id, _c)
		end
	end

	return main_bp
end
