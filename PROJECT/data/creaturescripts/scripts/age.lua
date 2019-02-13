function onLogin(cid)
    registerCreatureEvent(cid, "ageLook")
		
    return true
end
    

function onLook(cid, thing, position, lookDistance)
    if isPlayer(thing.uid) and thing.uid ~= cid then

   	local contadori = 6729
		local contador_dia = 6722 
		local contador_mes = 6723
		local contador_ano = 6724
		
        local valor_da_storage_inicial = getPlayerStorageValue(thing.uid, contadori)
		local valor_da_storage_dia = getPlayerStorageValue(thing.uid,contador_dia)
		local valor_da_storage_mes = getPlayerStorageValue(thing.uid,contador_mes)
		local valor_da_storage_ano = getPlayerStorageValue(thing.uid,contador_ano)
		
		   if getPlayerStorageValue(thing.uid, 6729) >= 1 then
		doPlayerSetSpecialDescription(thing.uid, "[Idade: Ele tem "..getPlayerStorageValue(cid,6724).." Anos, "..getPlayerStorageValue(cid,6723).." Meses e "..getPlayerStorageValue(cid,6722).." Dias ]")
        else
        doPlayerSetSpecialDescription(thing.uid, "[Idade: Ele acabou de nascer!]")
        end
return true
	   elseif thing.uid == cid then
	
     	local contadori = 6729
		local contador_dia = 6722 
		local contador_mes = 6723
		local contador_ano = 6724
		
		
		 local valor_da_storage_inicial = getPlayerStorageValue(cid, contadori)
		local valor_da_storage_dia = getPlayerStorageValue(cid,contador_dia)
		local valor_da_storage_mes = getPlayerStorageValue(cid,contador_mes)
		local valor_da_storage_ano = getPlayerStorageValue(cid,contador_ano)
		
        if getPlayerStorageValue(cid, 6729) >= 1 then
		doPlayerSetSpecialDescription(cid, "[Idade: Voce tem "..getPlayerStorageValue(cid,6724).." Anos, "..getPlayerStorageValue(cid,6723).." Meses e "..getPlayerStorageValue(cid,6722).." Dias ]")
        else
        doPlayerSetSpecialDescription(cid, "[Idade: Voce acabou de nascer!")
        end
		
		
		
		local string = 'You see yourself.'
        if getPlayerFlagValue(cid, PLAYERFLAG_SHOWGROUPINSTEADOFVOCATION) then
            string = string..' You are '.. getPlayerGroupName(cid) ..'.'
        elseif getPlayerVocation(cid) ~= 0 then
            string = string..' You are '.. getPlayerVocationName(cid) ..'.'
        else
            string = string..' You have no vocation.'
        end
        string = string..getPlayerSpecialDescription(cid)..''

 
        if getPlayerGuildId(cid) > 0 then 
            string = string..' You are ' .. (getPlayerGuildRank(cid) == '' and 'a member' or getPlayerGuildRank(cid)) ..' of the '.. getPlayerGuildName(cid)
            string = getPlayerGuildNick(cid) ~= '' and string..' ('.. getPlayerGuildNick(cid) ..').' or string..'.'
        end 
 
        if getPlayerFlagValue(cid, PLAYERCUSTOMFLAG_CANSEECREATUREDETAILS) then
            string = string..'nHealth: ['.. getCreatureHealth(cid) ..' / '.. getCreatureMaxHealth(cid) ..'], Mana: ['.. getCreatureMana(cid) ..' / '.. getCreatureMaxMana(cid) ..'].'
            string = string..'nIP: '.. doConvertIntegerToIp(getPlayerIp(cid)) ..'.'
        end
 
        if getPlayerFlagValue(cid, PLAYERCUSTOMFLAG_CANSEEPOSITION) then
            string = string..'nPosition: [X:'.. position.x..'] [Y:'.. position.y..'] [Z:'.. position.z..'].'
        end
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, string)  
        return false
		
		
		
   
		
	end
    return true
end




	