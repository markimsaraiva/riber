function onThink(interval, lastExecution, thinkInterval)
domodlib("config_hunted")
local query = db.getResult("Select * FROM `players` WHERE `level` > ".. hunted_min_level .." and `group_id` < 2 ORDER BY `level` DESC;")
if query:getID() ~= -1 then
   local name = query:getDataString("name")
if isPlayerOnline(name) then
      local pid = getCreatureByName(name)
	  local cocozin = 10128
	  local premio_ =  getItemDescriptionsById(cocozin)
      doBroadcastMessage("Extra Extra! O cara TOP Do server eh \""..name.."\", e ESTA ONLINE, se voce matar ele, o pagamento para voce eh de nada demais !")
      setGlobalStorageValue(hunted_storage, getPlayerGUID(pid) )
   end
end
return TRUE
end

function isPlayerOnline(name)
players=getPlayersOnline()
for _,pid in ipairs(players) do
    if getCreatureName(pid):lower() == name:lower() then
       return true
    end
end
return false
end