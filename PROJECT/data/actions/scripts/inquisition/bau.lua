function onUse(cid, item, fromPosition, itemEx, toPosition)
-- ARMADURAS

   	if item.uid == 1300 then
		local queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
							  if  getPlayerFreeCap(cid) > getItemWeightById(8890,1) then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found robe of the underworld.")
   			local item = doPlayerAddItem(cid,8890,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6076,1)
			else
			local continha = getItemWeightById(8888,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 1301 then
		local queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
										    if  getPlayerFreeCap(cid) > getItemWeightById(8888,1) then

   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Master Archer's Armor.")
   			local item = doPlayerAddItem(cid,8888,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6076,1)
			else
			local continha = getItemWeightById(8888,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 1302 then
		local queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
								    if  getPlayerFreeCap(cid) > getItemWeightById(8883,1) then

   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a  Destru Armor.")
   			local item = doPlayerAddItem(cid,8883,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6076,1)
			else
			local continha = getItemWeightById(8883,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
   	elseif item.uid == 1303 then
		local queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
						    if  getPlayerFreeCap(cid) > getItemWeightById(8882,1) then

   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Earthborn Titan Armor.")
   			local item = doPlayerAddItem(cid,8882,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6076,1)
			else
			local continha = getItemWeightById(8882,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
  	elseif item.uid == 1304 then
		local queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
				    if  getPlayerFreeCap(cid) > getItemWeightById(8881,1) then

   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Fireborn Giant Armor.")
   			local item = doPlayerAddItem(cid,8881,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6076,1)
			else
			local continha = getItemWeightById(8881,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
			
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
		
	-- INICIO ITEMS DE ATTACK
	
	elseif item.uid == 1305 then
		local queststatus = getPlayerStorageValue(cid,6077)
   		if queststatus == -1 then
		    if  getPlayerFreeCap(cid) > getItemWeightById(7424,1) then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Staff.")
   			local item = doPlayerAddItem(cid,7424,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6077,1)
		    else
			local continha = getItemWeightById(7424,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1306 then
		local queststatus = getPlayerStorageValue(cid,6077)
   		if queststatus == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(8925,1) then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Axe.")
   			local item = doPlayerAddItem(cid,8925,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6077,1)
			 else
			local continha = getItemWeightById(8925,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1307 then
		local queststatus = getPlayerStorageValue(cid,6077)
   		if queststatus == -1 then
					if  getPlayerFreeCap(cid) > getItemWeightById(8930,1) then

   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Sword.")
   			local item = doPlayerAddItem(cid,8930,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6077,1)
			else
			local continha = getItemWeightById(8930,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1308 then
		local queststatus = getPlayerStorageValue(cid,6077)
   		if queststatus == -1 then
							if  getPlayerFreeCap(cid) > getItemWeightById(8928,1) then

   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Club.")
   			local item = doPlayerAddItem(cid,8928,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6077,1)
			else
			local continha = getItemWeightById(8928,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	
	elseif item.uid == 1309 then
		local queststatus = getPlayerStorageValue(cid,6077)
   		if queststatus == -1 then
									if  getPlayerFreeCap(cid) > getItemWeightById(8851,1) then

   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Crossbow.")
   			local item  = doPlayerAddItem(cid,8851,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
   			setPlayerStorageValue(cid,6077,1)
			else
			local continha = getItemWeightById(8851,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	end
   	return true
end
