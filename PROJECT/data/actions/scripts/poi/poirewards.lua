function onUse(cid, item, frompos, item2, topos)

	if item.uid == 10544 then
	    local ids = 2453
		if getPlayerStorageValue(cid,10544) == -1 then	
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then

			doPlayerSendTextMessage(cid,25,"You have chosen an arcane staff.")
		    local item = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10544,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10545 then
		local ids = 6528
		if getPlayerStorageValue(cid,10544) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have chosen the avenger.")
			local item = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10544,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
 	elseif item.uid == 10546 then
	local ids = 5803
		if getPlayerStorageValue(cid,10544) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have chosen an arbalest.")
			local item  = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10544,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
		
	elseif item.uid == 10551 then
	local ids = 7415
		if getPlayerStorageValue(cid,10544) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have chosen an cranial basher.")
			local item  = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10544,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
		
	elseif item.uid == 10553 then
	local ids = 7420
		if getPlayerStorageValue(cid,10544) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have chosen an reaper's axe.")
			local item = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10544,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
		
	elseif item.uid == 10547 then
	local ids = 6132
		if getPlayerStorageValue(cid,10547) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have found a pair of soft boots.")
			local item = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10547,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10549 then
	local ids = 5791
		if getPlayerStorageValue(cid,10549) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have found a stuffed dragon.")
			local item = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10549,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10550 then
	local ids = 2361
		if getPlayerStorageValue(cid,10550) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have found a frozen starlight.")
			local item = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,10550,1)
			else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10559 then
	local ids = 2152
		if getPlayerStorageValue(cid,10559) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have found 100 platinum coins.")
			setPlayerStorageValue(cid,10559,1)
				else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10552 then
	local ids = 1970
		if getPlayerStorageValue(cid,10552) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(ids,1) then
			doPlayerSendTextMessage(cid,25,"You have found the holy Tible.")
			local book = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(book, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			doSetItemText(book,"Banor I praise your name.\nBe with me in the battle.\nBe my shield, let me be your sword.\nI will honour the godly spark in my soul. May it flourish and grow.")
			setPlayerStorageValue(cid,10552,1)
							else
			local continha = getItemWeightById(ids,1) - getPlayerFreeCap(cid)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10548 then
	local ids = 2365
		if getPlayerStorageValue(cid,23782) == -1 then
			if  getPlayerFreeCap(cid) > getItemWeightById(2365,1)  then
			doPlayerSendTextMessage(cid,25,"You have found a backpack of holding.")
			local item = doPlayerAddItem(cid,ids,1)
			doItemSetAttribute(item, "description", "Conquistado pelo Player ".. getCreatureName(cid)..".")
			setPlayerStorageValue(cid,23782,1)
					else
			local continha = getItemWeightById(2365,1)  - getPlayerFreeCap(cid) 
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Voce precisa liberar mais "..continha.." Oz de Cap, para pegar o item!")
			end
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	end
	return true
end