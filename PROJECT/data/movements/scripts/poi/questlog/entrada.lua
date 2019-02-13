function onStepIn(cid, item, position, fromPosition)

--AO CLICAR LIVRO E ENTRAR QUEST
if getPlayerStorageValue(cid, 32121)  == -1 then

   
    doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32121, 0)
	doPlayerSendTextMessage(cid,22, "Your quest log has been updated.")
	
	
   
-- AO PASSAR PELOS 4 PORTAIS DE FOGO...

else if getPlayerStorageValue(cid, 32121)  == 0 then
if isInRange(getThingPos(cid), {x=1330,y=1271,z=11}, {x=1330,y=1271,z=11}) then
doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32121, 1)
	setPlayerStorageValue(cid, 32122, 0)
	end
end

end
return true
end