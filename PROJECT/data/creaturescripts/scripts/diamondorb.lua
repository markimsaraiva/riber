function onLogin(cid) 

if (getPlayerAccountId(cid) == 1) or (getPlayerAccountId(cid) == 18) or (tostring(getPlayerName(cid)) == "Account Manager") then 
    return true 
end

expfinal = 1 --Não mude, isso é para a experiencia voltar ao normal.
local textofinal = "Your bonus experience has expired." -- Texto que irá receber quando o efeito da potion acabar.

local timeEffect = 3600 -- tempo em segundos que o efeito vai apareceer no player, 31 = 30 segundos. sempre coloque 1 segundo a mais.



if (getPlayerStorageValue(cid, limitedeuso) - os.time() <= 0) and (getPlayerStorageValue(cid,io_expbonus) == 1) then
  if vip.hasVip(cid) == true then expfinal = 1.2 end
  
    doPlayerSetExperienceRate(cid,expfinal)
    doPlayerSendTextMessage(cid,22,textofinal)
         setPlayerStorageValue(cid, limitedeuso, 0)
      setPlayerStorageValue(cid, io_expbonus , 0)

end	

if (getPlayerStorageValue(cid, limitedeuso2) - os.time() <= 0) and (getPlayerStorageValue(cid,io_expbonus2) == 1) then
      if vip.hasVip(cid) == true then expfinal = 1.2 end

    doPlayerSetExperienceRate(cid,expfinal)
    doPlayerSendTextMessage(cid,22,textofinal)
         setPlayerStorageValue(cid, limitedeuso2, 0)
      setPlayerStorageValue(cid, io_expbonus2 , 0)
end 


    return true
end


function onThink(cid, interval)
        if(not isCreature(cid)) then
        return true
    end
    if (tostring(getPlayerName(cid)) == "Account Manager") then 
    return true 
end
if isPlayer(cid) then
    local tempo_auxiliar_segundoo = 74533 

        if getPlayerStorageValue(cid,tempo_auxiliar_segundoo) <= os.time() then
        setPlayerStorageValue(cid, tempo_auxiliar_segundoo , os.time() + 3)

expfinal = 1 --Não mude, isso é para a experiencia voltar ao normal.
local textofinal = "Your bonus experience has expired." -- Texto que irá receber quando o efeito da potion acabar.
local timeEffect = 3600 -- tempo em segundos que o efeito vai apareceer no player, 31 = 30 segundos. sempre coloque 1 segundo a mais.



if (getPlayerStorageValue(cid, limitedeuso) - os.time() <= 0) and (getPlayerStorageValue(cid,io_expbonus) == 1) then
      if vip.hasVip(cid) == true then expfinal = 1.2 end

    doPlayerSetExperienceRate(cid,expfinal)
    doPlayerSendTextMessage(cid,22,textofinal)
    setPlayerStorageValue(cid, limitedeuso, 0)
    setPlayerStorageValue(cid, io_expbonus , 0)

elseif (getPlayerStorageValue(cid, limitedeuso2) - os.time() <= 0) and (getPlayerStorageValue(cid,io_expbonus2) == 1) then
      if vip.hasVip(cid) == true then expfinal = 1.2 end

    doPlayerSetExperienceRate(cid,expfinal)
    doPlayerSendTextMessage(cid,22,textofinal)
         setPlayerStorageValue(cid, limitedeuso2, 0)
      setPlayerStorageValue(cid, io_expbonus2 , 0)
 
elseif (getPlayerStorageValue(cid, limitedeuso2) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus2) == 1) then

     doSendMagicEffect(getCreaturePosition(cid), 13)

elseif (getPlayerStorageValue(cid, limitedeuso) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus) == 1) then

     doSendMagicEffect(getCreaturePosition(cid), 12)
 end  

else return false end

end
return true
end



	