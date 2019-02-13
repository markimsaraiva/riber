function onStepIn(cid, item, position, fromPosition)

--AO REMOVER PEDRA E ENTRAR LABIRINTO..

if getPlayerStorageValue(cid, 32122)  == 0 then

   
    doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32122, 1)
   
--AO IR PARA A PARTE DO FOGO APOS O LABIRINTO
else if getPlayerStorageValue(cid, 32122)  == 1 then
if isInRange(getThingPos(cid), {x=1342,y=1220,z=10}, {x=1344,y=1221,z=10}) then

doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32122, 2)
	    setPlayerStorageValue(cid, 32123, 0)
		end

end
end
return true
end