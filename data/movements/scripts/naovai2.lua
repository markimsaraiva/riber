function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor) 
storage_guild = getGlobalStorageValue(123123) 
local tpos,v = {x=1298,y=1711,z=7},getThingPos(cid) -- {x=1,y=1,z=1} is the position you teleport to, don't change getThingPos(cid).  

if isPlayer(cid) then 
if getPlayerGuildId(cid) == storage_guild then 
doTeleportThing(cid,position) 
else 
doTeleportThing(cid,tpos) 
doCreatureSay(cid, "[Castle24hrs] Sua guild n�o � mais dona do Castle e voc� foi expulso! :(", TALKTYPE_SAY) 
doSendMagicEffect(getPlayerPosition(cid),6) 
end 
return true 
end
end