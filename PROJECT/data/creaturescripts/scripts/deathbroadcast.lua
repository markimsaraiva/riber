function onDeath(cid, corpse, deathList)
if isPlayer(deathList[1]) then
return true,doBroadcastMessage(" O Jogador ".. getCreatureName(cid) .. " [Level: " .. getPlayerLevel(cid) .. "] Foi morto pelo jogador " .. getCreatureName(deathList[1]) .. " [Level: " .. getPlayerLevel(deathList[1]) .. "]",20)
end
return doBroadcastMessage(" O Jogador ".. getCreatureName(cid) .. " [Level: " .. getPlayerLevel(cid) .. "] Foi morto pelo monstro " .. getCreatureName(deathList[1]) .. ".",20)
end