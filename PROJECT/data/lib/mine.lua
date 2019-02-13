function setItemAid(uid, value)
	return doItemSetAttribute(uid, 'aid', value) 
end 

	function removeBomba(pos, id)
	local item = getTileItemById(pos, id)  
	  if item.uid > 0 then        
	  	doRemoveItem(item.uid)   
	  	 end
	  	return true
	  end

