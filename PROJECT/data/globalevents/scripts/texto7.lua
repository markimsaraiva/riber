function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[BaiakNew - Descubra os segredos de MORGUM City,
Hunts, Quests e muito mais.
Para comprar Dodge ou Critical v� no Npc Dodge/Critical Seller.
Para saber mais sobre donates ou confirmar alguma doa��o
entre em nosso site: www.baiaknew.top Bom Jogo]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end