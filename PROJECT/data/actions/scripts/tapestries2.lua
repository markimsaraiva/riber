function onUse(cid, item, frompos, item2, pos)

wall1 = {x=pos.x-1, y=pos.y, z=pos.z, stackpos=1}
wall1s1 = {x=pos.x-1, y=pos.y, z=pos.z, stackpos=2}
getwall1 = getThingfromPos(wall1)
getwall1s1 = getThingfromPos(wall1s1)
wall2 = {x=pos.x, y=pos.y-1, z=pos.z, stackpos=1}
wall2s1 = {x=pos.x, y=pos.y-1, z=pos.z, stackpos=2}
getwall2 = getThingfromPos(wall2)
getwall2s1 = getThingfromPos(wall2s1)

player = getPlayerPosition(cid)


if  item.itemid == 12704 then  --flat tapestry
    
        if getwall1s1.itemid > 0 then
if getwall2.itemid == 424 then   --south facing
                if getwall2s1.itemid > 0 then
                else
                    doRemoveItem(item.uid,1)
                    doCreateItem(item.itemid-1,1,wall2)
                end
            end
        
        end

         
elseif  item.itemid == 12703 then  --south facing
    if (player.y == pos.y+1) then    
        doRemoveItem(item.uid,1)
        doPlayerAddItem(cid, item.itemid+1, 1)    
    end    
end
end