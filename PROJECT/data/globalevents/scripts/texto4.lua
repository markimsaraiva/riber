function onThink(interval, lastExecution)
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[[ATENCAO] O ADM, GM, ou TUTOR, JAMAIS pedira sua senha, ITENS ou algum dado pessoal, jamais passe seus dados, ITENS e senhas a NINGUEM, mesmo que o ADM pedir NAO PASSE, pois eh alguem tentando lhe roubar!!!]]
}
doBroadcastMessage(mensagens[1], cor)
return TRUE
end