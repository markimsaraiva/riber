function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 20 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Deseja fazer uma doa��o? Acesse agora o site hellbaiak.sytes.net]]
}

  -- Fim de Configura��es

  doBroadcastMessage("Mate o Rei que nasce aproximadamente a cada 1 hora e 30 minutos e ganhe itens!", MESSAGE_STATUS_WARNING)
return TRUE
end