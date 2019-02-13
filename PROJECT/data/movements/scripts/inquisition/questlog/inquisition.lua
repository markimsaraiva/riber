function onStepIn(cid, item, position, fromPosition)

--ENTRADA
if getPlayerStorageValue(cid, 32131)  == -1 then
if isInRange(getThingPos(cid), {x=1107,y=933,z=15}, {x=1110,y=934,z=15}) then

   
    doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32131, 0)
	doPlayerSendTextMessage(cid,22, "Your quest log has been updated.")
	
	
  end	 
-- ANTES DO GREAT USHURIEL...

else if getPlayerStorageValue(cid, 32131)  == 0 then
if isInRange(getThingPos(cid), {x=1166,y=887,z=12}, {x=1174,y=887,z=12}) then
doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32131, 1)
	setPlayerStorageValue(cid, 32132, 0)

end	
--USHURIEL

else if getPlayerStorageValue(cid, 32132)  == 0 then
if isInRange(getThingPos(cid), {x=1461,y=923,z=12}, {x=1464,y=924,z=12}) then

   
    doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32132, 1)
setPlayerStorageValue(cid, 32133, 0)

 end	 
  
  -- ZUGUROSH
else if getPlayerStorageValue(cid, 32133)  == 0 then
if isInRange(getThingPos(cid), {x=1564,y=901,z=9}, {x=1564,y=908,z=9}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32133, 1)
end			
else if getPlayerStorageValue(cid, 32133)  == 1 then
if isInRange(getThingPos(cid), {x=1375,y=955,z=14}, {x=1377,y=957,z=14}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32133, 2)
	setPlayerStorageValue(cid, 32134, 0)

end	
 --MADARETH
else if getPlayerStorageValue(cid, 32134)  == 0 then
if isInRange(getThingPos(cid), {x=1367,y=953,z=11}, {x=1371,y=956,z=11}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32134, 1)
end	
else if getPlayerStorageValue(cid, 32134)  == 1 then
if isInRange(getThingPos(cid), {x=1322,y=833,z=11}, {x=1324,y=836,z=11}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32134, 2)
	setPlayerStorageValue(cid, 32135, 0)
end
--LATRIVA E GOLGORDAN

else if getPlayerStorageValue(cid, 32135)  == 0 then
if isInRange(getThingPos(cid), {x=1517,y=808,z=11}, {x=1517,y=817,z=11}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32135, 1)
	end
	else if getPlayerStorageValue(cid, 32135)  == 1 then
if isInRange(getThingPos(cid), {x=1536,y=809,z=15}, {x=1540,y=811,z=15}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32135, 2)
	setPlayerStorageValue(cid, 32136, 0)
end
-- ANNIHILON
else if getPlayerStorageValue(cid, 32136)  == 0 then
if isInRange(getThingPos(cid), {x=1635,y=975,z=14}, {x=1646,y=975,z=14}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32136, 1)
	end
	
	else if getPlayerStorageValue(cid, 32136)  == 1 then
if isInRange(getThingPos(cid), {x=1589,y=767,z=14}, {x=1595,y=769,z=14}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32136, 2)
	setPlayerStorageValue(cid, 32137, 0)	
	end

	-- HELLGORAK
else if getPlayerStorageValue(cid, 32137)  == 0 then
if isInRange(getThingPos(cid), {x=1612,y=689,z=11}, {x=1620,y=691,z=11}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32137, 1)
	end
	
	else if getPlayerStorageValue(cid, 32137)  == 1 then
if isInRange(getThingPos(cid), {x=1615,y=641,z=12}, {x=1619,y=643,z=12}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32137, 2)
	setPlayerStorageValue(cid, 32138, 0)	
end
else if getPlayerStorageValue(cid, 32138)  == 0 then
if isInRange(getThingPos(cid), {x=1614,y=663,z=13}, {x=1617,y=665,z=13}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32138, 1)
end

else if getPlayerStorageValue(cid, 32138)  == 1 then
if isInRange(getThingPos(cid), {x=1103,y=959,z=14}, {x=1104,y=959,z=14}) then

doSendMagicEffect(getThingPos(cid),29)


    setPlayerStorageValue(cid, 32138, 2)	
	 
	 setPlayerStorageValue(cid, 31121, getPlayerStorageValue(cid, 31121) + 1 )  --Soma 1 Quets
	
     setPlayerStorageValue(cid, 32126, 1) -- REQUISITO PARA ALGUMA OUTRA QUEST..
	
end

end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
return true
end