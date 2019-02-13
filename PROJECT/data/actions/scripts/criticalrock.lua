local config = {
   effectonuse = 28, -- efeito que sai
   levelscrit = 100,  --- leveis que terão
   storagecrit = 48903,-- storage que será verificado
    storage_unica = 986554,
   numero_max_unico = 100,
   storage_auxiliar = 81818
   }
   
function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,config.storage_auxiliar) == -1 then
setPlayerStorageValue(cid,config.storagecrit,0)
setPlayerStorageValue(cid,config.storage_unica,0)
setPlayerStorageValue(cid,config.storage_auxiliar,1)
end
if getPlayerStorageValue(cid,config.storage_unica) < config.numero_max_unico then
    if getPlayerStorageValue(cid, config.storagecrit) < config.levelscrit then
   doRemoveItem(item.uid, 1)
doSendMagicEffect(topos,config.effectonuse)
doPlayerSendTextMessage(cid,22,"Voce elevou seu critical para ["..(getPlayerStorageValue(cid, config.storagecrit)+1).."/100].")
doPlayerSendTextMessage(cid,19,"Voce elevou seu Combat Skills para ["..(getPlayerStorageValue(cid, config.storage_unica)+1).."/100].")
setPlayerStorageValue(cid,config.storage_unica,getPlayerStorageValue(cid,config.storage_unica) + 1 )
setPlayerStorageValue(cid, config.storagecrit, getPlayerStorageValue(cid, config.storagecrit)+ 1 )
elseif getPlayerStorageValue(cid, config.storage_unica) >= config.numero_max_unico then
doPlayerSendTextMessage(cid,19,"Voce ja atingiu o nivel Maximo de Combat Skills.\nParabéns.")
elseif getPlayerStorageValue(cid, config.storagecrit) >= config.levelscrit then
doPlayerSendTextMessage(cid,22,"Voce ja chegou no nivel Maximo de Critical.\nParabéns.")
    return 0
    end
	end
	
return 1
end