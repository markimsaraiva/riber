local function isWeapon(uid)
    uid = uid or 0
    local f = getItemWeaponType(uid)
    if f == 1 or f==2 or f==3 or f==4 or f==5 then
        return true
   -- else -- a mais
      --  return true -- a mais
    end
    return false
end

-- 1 sword,2axe,3club,4dist,5,shield,

function onUse(cid, item, fromPosition, itemEx, toPosition)  
    if item.uid == 0 or item.itemid == 0 then return false end
    if isCreature(itemEx.uid) == TRUE then return false end


    if isWeapon(itemEx.uid) then
        if math.random(1,100) < 100 then
            doItemSetAttribute(itemEx.uid, 'dualwield', true)
            doPlayerSendCancel(cid, "Item encantado com sucesso!")
            doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
        else
            doPlayerSendCancel(cid, "Sua pedra quebrou ao tentar encantar o item.")
        end
        
        doRemoveItem(item.uid)
    else
        doPlayerSendCancel(cid, "Use a pedra em alguma arma")
    end

    
	return true
end