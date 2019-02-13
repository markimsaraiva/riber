function onStepIn(cid, item, position, fromPosition)

--AO ENTRAR SALA RECOMPENSAS
if getPlayerStorageValue(cid, 32124)  == 0  then

   
    doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32124, 1)
   
-- AO SAIR SALA RECOMPENSAS
else if getPlayerStorageValue(cid, 32124)  == 1 then
doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32124, 2)
    setPlayerStorageValue(cid, 31121, getPlayerStorageValue(cid, 31121) + 1 )  --Soma 1 Quets

end
end
return true
end