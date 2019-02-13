function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=1341, y=1220, z=10, stackpos=1} -- posiçao pedra

local configs = {

[1304] = {{x=1341, y=1220, z=10}},
    }
	
	local firstpos = {x=1342,y=1220,z=10} -- Posiçao do lado inicial da ponte

local tempo = 10*1000 -- tempo para agua volar
getpiece1 = getThingfromPos(piece1pos)

 
local pedra = 1304
if item.uid == 45003 and item.itemid == 1945 then
 doRemoveItem(getTileItemById(piece1pos, 1304).uid)
 doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"acho que ouvi um barulho, uma passagem deve ter se aberto.")
addEvent(doCreateItem, tempo, pedra, piece1pos)
addEvent(doTransformItem, tempo, item.uid,1945)
addEvent(removePedra, tempo, configs, getThingPos(item.uid))

else

doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end

return true
end


function removePedra(configs, piece2pos,firstpos)

    local player = nil
	local piece2pos = {x=1342, y=1220, z=10, stackpos=1}

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

        doTeleportThing(getThingFromPos(player).uid, piece2pos)

    end


    

end