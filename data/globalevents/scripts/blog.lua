function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Fa�a doa��es para nosso servidor e seja um jogador com v�rios benef�cios exclusivos como areas com criaturas vips, respawns r�pidos, v�rias op��es de hunts. Fa�a j� sua doa��o e desfrute dos benef�cios vip! 
]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end