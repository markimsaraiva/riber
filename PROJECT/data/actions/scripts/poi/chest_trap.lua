function onUse(cid, item, frompos, itemEx, toPosition)

 if item.itemid == 1748 and item.uid == 45004 then
 
     if isPlayer(cid)then
     doCreatureAddHealth (cid, -getCreatureMaxHealth (cid))
    	doCreatureSay(cid, "TrOuXaa !!!", TALKTYPE_ORANGE_1)
		 
		 
     end



 end
   

return true
end
