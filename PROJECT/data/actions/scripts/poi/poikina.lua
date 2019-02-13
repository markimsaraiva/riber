function onUse(cid, item, frompos, item2, topos)
gatepos = {x=1323, y=1271, z=11, stackpos=1}
getgate = getThingfromPos(gatepos)
local tempo = 5

if item.uid == 19037 and item.itemid == 1945 and getgate.itemid == 6289 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
setGlobalStorageValue(3002, os.time()+(tempo * 1000))
if getGlobalStorageValue(3002) == 0 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(6289,1,gatepos)

else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return true
  end
  end