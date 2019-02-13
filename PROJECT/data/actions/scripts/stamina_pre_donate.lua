function onUse(cid, item, frompos, item2, topos)

local desc = getItemInfo(12505).description
	local newitem = doPlayerAddItem(cid, 12505, 1)
	doItemSetAttribute(newitem, "description", desc.." ".." pertence ao player "..getCreatureName(cid).." " )
		doItemSetAttribute(newitem, "aid", getPlayerGUID(cid)) 


	doRemoveItem(item.uid, 1)	


	doSendMagicEffect(frompos, 1)	
	
return true
end