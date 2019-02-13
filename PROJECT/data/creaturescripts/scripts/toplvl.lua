function onDeath(cid, corpse, deathList)
local top,price =  getConfigInfo("huntedTopLevel"),getConfigInfo("priceForEachLevelTohuntedTopLevel")
local cocozin = 10127
	  
	  

if(isPlayer(cid))then
		-- hunted top level
		local _,level = getTopLevel()
		if(tonumber(level) and top and tonumber(level) >= top and tonumber(level) <= getPlayerLevel(cid))then
			for _,player in pairs(deathList) do
				if(isPlayer(player))then 
				doPlayerAddItem(player, cocozin, 1) end
				doBroadcastMessage("Pau no seu cu, por ter matado o top", 18)
			end
		end
	end
	return true
end