function onUse(cid, item, frompos, item2, topos)
-- local pausa = 60*60*1000 -- (1000 = 1 segundos) Tempo que o script durará
local texto = "This potion increases you Experience Gain in + 50%  for 1 hour." -- Texto que irá receber ao usar a potion.
local textofinal = "Your bonus experience has expired." -- Texto que irá receber quando o efeito da potion acabar.
local exp = 0.5 -- O quanto que você quer que dobre sua experiencia, por exemplo 2 é 2x as rates do seu server.
local expfinal = 1 --Não mude, isso é para a experiencia voltar ao normal.
local textofinal1 = "You have the experience bonus + 50%. Say !bronzeorb or !extraexp "
local seuitem = 7633 -- seu item que dará double exp
local efeito1 = 13 -- efeito que ficara com o char por meia hora
local efeito2 = 35 -- efeito que acontecera no momento que usar a pot
 
--fim da parte configuravel não mecha se nao tiver conhecimento de scripting
local timeEffect = 3600 -- tempo em segundos que o efeito vai apareceer no player, 31 = 30 segundos. sempre coloque 1 segundo a mais.
 
      -- function effect()
      --    if isPlayer(cid) then
      --       local pos = getCreaturePosition(cid)
      --       doSendMagicEffect(pos, efeito1)
      --    end
      -- end
         
if item.itemid == seuitem and (getPlayerStorageValue(cid, limitedeuso2) - os.time() <= 0) then
  local hora = 3600

       setPlayerStorageValue(cid, limitedeuso, 0) --desabilita o diamond orb
       setPlayerStorageValue(cid, io_expbonus , 0) -- desabilita o diamond orb


     setPlayerStorageValue(cid, limitedeuso2, 0)

  doRemoveItem(item.uid,1)
 getexprate = 1
  if vip.hasVip(cid) == true then
      getexprate = 1.2
  end

   doPlayerSetExperienceRate(cid, getexprate + exp)
    doSendMagicEffect(frompos,efeito2)
     setPlayerStorageValue(cid, limitedeuso2, os.time() + 3600)
    doPlayerSendTextMessage(cid,22,texto)


        if vip.hasVip(cid) == true then
        doPlayerSendTextMessage(cid,22,"[VIP]: You have now [70%] more EXP.")
      else
        doPlayerSendTextMessage(cid,22,"[NO-VIP]: You have now [50%] more EXP.")
      end

-- addEvent(potion,pausa,cid)
   setPlayerStorageValue(cid, io_expbonus2 , 1)

  
  -- while getPlayerStorageValue(cid,storage_effect) <= timeEffect do
  --       effect(cid)
  -- setPlayerStorageValue(cid, storage_effect , getPlayerStorageValue(cid,storage_effect) + 1)
  -- end
 
elseif item.itemid == seuitem and (getPlayerStorageValue(cid, limitedeuso2) - os.time() > 0) then
  doPlayerSendTextMessage(cid,22,textofinal1)
end
 
 
return true
end
 

-- function potion(cid)
-- doPlayerSetExperienceRate(cid,expfinal)
-- doPlayerSendTextMessage(cid,22,textofinal)
-- end