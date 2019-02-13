function onThink(interval, lastExecution)
  -- Configurações
    local cor = 20 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[BaiakNew:
Red Skull = 100 frags no dia
Black Skull = Sem limites
para remover skulls compre o Removedor de Skull do ShopGuild!
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end