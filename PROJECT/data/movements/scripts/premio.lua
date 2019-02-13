local itemquevaiser = 1810

local config = {
    --[actionid] = {item = itemid, desc = "description"},
    [2135] = {item = itemquevaiser, desc = "Quem e dominante do castelo agora e: %s !"},
}

t = {
piece1pos = {x=1344, y=1257, z=9, stackpos=1},
piece2pos = {x=1103, y=1061, z=7, stackpos=2}
}
hahaha = {x=1103, y=1061, z=7, stackpos=2}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)


    local trophy = config[item.actionid]
  if isPlayer(cid) and trophy then
        local pos = getCreaturePosition(cid)
        pos.y = pos.y - 1
	
	        doRemoveItem(getTileItemById(t.piece2pos, itemquevaiser).uid) --NECESSITO DE COLOCAR NO REMERES UM ITEM PARA COMEÇAR JÁ RETIRANDO...
		
        local thing = doCreateItem(trophy.item, 1, hahaha)
        doItemSetAttribute(thing, "description", string.format(trophy.desc, getPlayerGuildName(cid)))
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)

		doSendAnimatedText(hahaha, "CONQUISTA", 200)   
end

    return true
end

-- getPlayerNameByGUID(cid)
-- getPlayerGuildName(cid)--1804