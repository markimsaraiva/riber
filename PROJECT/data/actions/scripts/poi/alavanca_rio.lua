function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=1272, y=1268, z=11, stackpos=1}
piece2pos = {x=1271, y=1268, z=11, stackpos=1}
local configs = {

[5770] = {{x=1272,y=1268,z=11}},
    }
	local firstpos = {x=1270,y=1268,z=11} -- Posiçao do lado inicial da ponte

local tempo = 3*1000 -- tempo para agua volar
getpiece1 = getThingfromPos(piece1pos)

 
local madeira = 5770
if item.uid == 2420 and item.itemid == 1945 then
doCreateItem(madeira,1,piece1pos)
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"acho que ouvi um barulho, uma passagem deve ter se aberto.")
addEvent(doCreateItem, tempo, 493, piece1pos)
addEvent(doTransformItem, tempo, item.uid,1945)
 addEvent(removeAll, tempo, configs, getThingPos(item.uid))

              

elseif item.uid == 2426 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)

else

doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end



return 1
end


function removeAll(configs, piece2pos,firstpos)

    local player = nil
	local piece2pos = {x=1271, y=1268, z=11, stackpos=1}

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