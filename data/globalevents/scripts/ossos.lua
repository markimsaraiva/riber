function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens = {"[PROMO��O-DOUBLE POINTS] Nao Perca Sabado
Evento Fire Storm as 15:00 P�mio em Dinheiro Sera Mesma Quantidade de Player online Ex: 200 Player 200 Reais . -> Ribeirot.servegame.com"} -- Defina as mensagens de propaganda
  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end