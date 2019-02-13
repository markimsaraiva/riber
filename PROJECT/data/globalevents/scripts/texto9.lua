function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens = {"[PROMOÇÃO-DOUBLE POINTS] Promoção estendida até o dia 20/09 para doações acima de 30 reais. -> www.BaiakNew.top"} -- Defina as mensagens de propaganda
  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end