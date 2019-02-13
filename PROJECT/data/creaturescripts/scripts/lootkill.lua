function onKill(cid, target, lastHit)
if isPlayer(cid) and isPlayer(target) then
if(getPlayerLevel(target) > 100) then
 local config = {

Kname = getPlayerName(cid),
Tname = getPlayerName(target),
Tlevel = getPlayerLevel(target)
}

local heart = doPlayerAddItem(cid, 12705, 1)

doItemSetAttribute(heart, "name", "" ..config.Tname.. " Heart's")
doItemSetAttribute(heart, "description", "Morto no Level "..config.Tlevel.." Pelo Player "..config.Kname..". " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "(Unjustified)" or "(Justified)"))
doPlayerSendTextMessage(cid, 19, "Voce obteve o coracao do Player "..getPlayerName(target).."!")



end
end
return true
end