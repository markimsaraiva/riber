local c = {
    checkItems = {[2597] = 1}, -- id da carta carta
    checkPlaces = {{x=1108, y=1064, z=7}}, -- posição do mailbox
    casaDasCartas = {x=145, y=160, z=6}, -- posição da casa onde vai as cartas.
}
local function getTableMax(t)
    local ret = 0
    for _, i in pairs(t) do
        ret = ret + 1
    end
    return ret
end
function onAddItem(moveItem, tileItem, position, cid)
            local done = {}
            for n, pos in pairs(c.checkPlaces) do
                for itemId, count in pairs(c.checkItems) do
                    local posItem = getTileItemById(pos, itemId)
                    if(posItem.uid ~= 0 and (count == 1 or posItem.type >= count) and not done[itemId]) then
                        done[itemId] = {count, pos}
                        break
                    end
                end
            end
            if(getTableMax(done) == getTableMax(c.checkItems)) then    
                if position ~= nil then
                    doTeleportThing(moveItem.uid, c.casaDasCartas, true)
                    doSendMagicEffect(getPlayerPosition(cid), 3)
                    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua carta foi encaminhada com sucesso.")
                    return false
                end
                
                else
            doCreatureSay(cid, "Voce so pode mandar cartas para o god.", TALKTYPE_ORANGE_1)
            local position = {x=position.x, y=position.y+1, z=position.z}
                if position ~= nil then
                    doTeleportThing(moveItem.uid, position, true)
                    doSendMagicEffect(position, 2)
                    return false
                end
            end            
    return true
end