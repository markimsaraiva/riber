dofile('data/lib/arenapvp.lua')

function onUse(cid, item, toPosition, itemEx, fromPosition)

        local player1 = getTopCreature(arena2.player1pos).uid
        local player2 = getTopCreature(arena2.player2pos).uid

        if item.itemid == 1945 then
                doTransformItem(item.uid, item.itemid+1)
                if getGlobalStorageValue(arena2.gstorage) < 1 then
                        if isPlayer(player1) and isPlayer(player2) then
                                doPlayerSendTextMessage(player1, MESSAGE_STATUS_WARNING, "Fight!")
                        doPlayerSendTextMessage(player2, MESSAGE_STATUS_WARNING, "Fight!")
                        doSendMagicEffect(getThingPos(player1), CONST_ME_POFF)
                        doSendMagicEffect(getThingPos(player2), CONST_ME_POFF)
                        setPlayerStorageValue(player1, arena2.pstorage, 1)
                                setPlayerStorageValue(player2, arena2.pstorage, 1)
                                doTeleportThing(player1, arena2.nplayer1pos)
                                doTeleportThing(player2, arena2.nplayer2pos)
                                setGlobalStorageValue(arena2.gstorage, 1)
                                setGlobalStorageValue(arena2.hstorage, os.time() + (arena2.time*60) )

                                
                        else
                                doCreatureSay(cid, "need two players to start", TALKTYPE_ORANGE_1)
                        end
                else
                        doCreatureSay(cid, "has two players in arena", TALKTYPE_ORANGE_1)
                end
        elseif item.itemid == 1946 then
                doTransformItem(item.uid, item.itemid-1)
        end

        return true
end