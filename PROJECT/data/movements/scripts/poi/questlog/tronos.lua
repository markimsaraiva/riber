function onStepIn(cid, item, position, fromPosition)


-- AO ENTRAR NA SALA DOS TRONOS...  OS QUESTLOGS DOS RUTHLESS ESTA NO MOVEMENTS DO THRONES.LUA (MOVEMENTS)
if getPlayerStorageValue(cid, 32123)  == 0 then

   
    doSendMagicEffect(getThingPos(cid),29)
    setPlayerStorageValue(cid, 32123, 1)
   
end
return true
end