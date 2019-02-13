function removeAll(configs, leverpos, tp, water, leveroff, leveron)

    local player = nil

    for i,x in pairs(configs) do

        for s, t in pairs(x) do

            for l = 0,255 do

                if isPlayer(getThingFromPos({x=t.x, y=t.y, z=t.z, stackpos = l}).uid)  then

                    player = {x=t.x, y=t.y, z=t.z, stackpos = l}

                    break

                end

            end

        end

    end

    if player then

        doTeleportThing(getThingFromPos(player).uid, tp)

    end

    for i,x in pairs(configs) do

        for s, t in pairs(x) do

            for l = 0,255 do

                t.stackpos = l

                if getThingFromPos(t).itemid == i then

                    if l == 0 then

                        doTransformItem(getThingFromPos(t).uid, water)

                    else

                        doRemoveItem(getThingFromPos(t).uid)

                    end

                end

            end

        end

    end

    for l = 0,255 do

        leverpos.stackpos = l

        if getThingFromPos(leverpos).itemid == leveron then

            doTransformItem(getThingFromPos(leverpos).uid, leveroff)

            break

        end

    end

end

function onUse(cid, item, fromPosition, itemEx, toPosition)

    local configs = {

[5770] = {{x=1272,y=1268,z=11}},
    }

    local firstpos = {x=1269,y=1268,z=11} -- Posiçao do lado inicial da ponte

    local waterid = 493 -- Item ID da agua.

    local time = 5 -- Em segundos

    local leveroff, leveron = 1945, 1946 -- Ids da alavanca puxada e nao puxada, respectivamente.


    if item.itemid == leveroff then

        for i,x in pairs(configs) do

            for s, t in pairs(x) do

                doCreateItem(i, t)

                doTransformItem(item.uid, leveron)

            end

        end

        addEvent(removeAll, time*1000, configs, getThingPos(item.uid), firstpos, waterid, leveroff, leveron)

    end

return TRUE

end