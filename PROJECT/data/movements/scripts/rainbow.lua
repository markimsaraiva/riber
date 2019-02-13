-- local colors = {94, 81, 79, 88, 18, 11, 92, 128}
-- local colors = {86, 87, 88, 89, 105, 106, 107, 108,125,126} -- so azul
-- local colors = {75, 94, 113, 132} -- so vermelho

-- local colors = {47, 66, 85, 104,123} -- so vIS


local colors = {80, 81, 82, 83, 99, 100, 101, 102,119,120,121} -- so verde

local storage = 33336
local time = 10 --in miliseconds

function onStepIn(cid, item, pos) 
 if isCreature(cid) then
			if getPlayerStorageValue(cid, storage) == -1 then

				if isInRange(getThingPos(cid), {x=1113,y=1071,z=7}, {x=1116,y=1072,z=7}) then
		
				local event = addEvent(changeOutfit, time, cid)
				setPlayerStorageValue(cid, storage, 1)
				doSendMagicEffect(getThingPos(cid), 29) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.

				doSendAnimatedText(getPlayerPosition(cid),"Wooaahh!", math.random(01,255)) -- Oque o Player vai Falar quando Mudar de Outfit. 
				end
			else 
				
				if isInRange(getThingPos(cid), {x=1112,y=1070,z=7}, {x=1114,y=1070,z=7}) or isInRange(getThingPos(cid), {x=1111,y=1070,z=7}, {x=1114,y=1070,z=7})  then
								if getPlayerStorageValue(cid, storage) == 1 then
				stopEvent(event)
			setPlayerStorageValue(cid, storage, -1)

end
end

end
return true
end

end




function changeOutfit(cid)
 
local randomHead = colors[math.random(#colors)]
local randomLegs = colors[math.random(#colors)]
local randomBody = colors[math.random(#colors)]
local randomFeet = colors[math.random(#colors)]
local tmp = {}
 
 if isCreature(cid) then

if getPlayerStorageValue(cid, storage) == 1 then
local outfit = getCreatureOutfit(cid)
tmp = outfit
tmp.lookType = outfit.lookType
tmp.lookHead = randomHead
tmp.lookLegs = randomLegs
tmp.lookBody = randomBody
tmp.lookFeet = randomFeet
tmp.lookAddons = outfit.lookAddons
 
doCreatureChangeOutfit(cid, tmp)
local event = addEvent(repeatChangeOutfit, time, cid)
return true
else
stopEvent(event)
return true
end
end
end


function repeatChangeOutfit(cid)
 
local randomHead = colors[math.random(#colors)]
local randomLegs = colors[math.random(#colors)]
local randomBody = colors[math.random(#colors)]
local randomFeet = colors[math.random(#colors)]
local tmp = {}
 
  if isCreature(cid) then

if getPlayerStorageValue(cid, storage) == 1 then
local outfit = getCreatureOutfit(cid)
tmp = outfit
tmp.lookType = outfit.lookType
tmp.lookHead = randomHead
tmp.lookLegs = randomLegs
tmp.lookBody = randomBody
tmp.lookFeet = randomFeet
tmp.lookAddons = outfit.lookAddons
 
doCreatureChangeOutfit(cid, tmp)
local event = addEvent(changeOutfit, time, cid)
return true
else
stopEvent(event)
return true
end
end
end



























