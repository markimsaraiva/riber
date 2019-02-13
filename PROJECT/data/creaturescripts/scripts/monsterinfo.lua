

function onKill(cid, target)
	if(isMonster(target) == TRUE) then
		local name = getCreatureName(target)

	local monsterinfo = getMonsterInfo(name)
-- local xixi = getMonsterExperience(target)
	local mname = "Name: "..name.."\n"
	
	local coco = getPlayerStamina(cid)

	
if (coco >= 2400) then 
 pau = 1.5
 end
if coco < 2400 then 
 pau = 1
 end

-- PARTE DOS XP STAGES DEFINIDO PELO OTSERVER -- 

	if getPlayerLevel(cid) <= 100 then exprate = 600 end
	if getPlayerLevel(cid) > 101 and getPlayerLevel(cid)<= 500 then exprate = 400 end
	if getPlayerLevel(cid) > 501 then exprate = 5 end
 
 --FIM --

local boidacarapreta = tonumber(monsterinfo['experience'])*pau*exprate

	local experience = "Experience: "..monsterinfo['experience']*pau*exprate.."\n"

		
		-- doBroadcastMessage(""..coco.."")

		
		-- doBroadcastMessage(mname)
				doBroadcastMessage(experience)
				-- doBroadcastMessage(boidacarapreta)
  
								db.query("UPDATE players SET xprank = "..boidacarapreta+xp_rank(cid).." WHERE id = "..getPlayerGUID(cid).." ;")

				
				doBroadcastMessage("xp rank atual e "..xp_rank(cid).." !") 

				
				
		end
	return true
end

function xp_rank(cid) -- xprank 
local ult = db.getResult('select `xprank` from players where id = \''..getPlayerGUID(cid)..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("xprank")
ult:free()

caguei = tonumber(mamae)
return caguei

end