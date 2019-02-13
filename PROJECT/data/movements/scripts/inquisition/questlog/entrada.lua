function onStepIn(cid, item, position, fromPosition)

--AO ENTRAR NA INQUI
if getPlayerStorageValue(cid, 32131)  == -1 then

   
    doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32131, 0)
	doPlayerSendTextMessage(cid,22, "Your quest log has been updated.")
	
	
   
-- ANTES DO GREAT USHURIEL...

else if getPlayerStorageValue(cid, 32121)  == 0 then
if isInRange(getThingPos(cid), {x=1166,y=886,z=12}, {x=1174,y=886,z=12}) then
doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32121, 1)
	setPlayerStorageValue(cid, 32122, 0)
	end
end

end
return true
end