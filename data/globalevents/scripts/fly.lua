function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Esta Preso?
  Sem Sa�da?
  Pregui�a de Andar? 
  Entao Diga 
!fly templo, !fly vip2, !fly depot, !fly hunts, !fly trainer]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end