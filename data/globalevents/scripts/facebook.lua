function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Curtam a nossa Fan Page e fique por dentro das novidades.
    http://ribeirot.servegame.com/
]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end