function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 19 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[AVISO IMPORTANTE: Nunca ca�e de m�o fechada, jogadores podem fazer voc� pegar Red Skull e a Staff n�o se responsabiliza por perdas de equipamentos.
]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end