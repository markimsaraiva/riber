local msgs = {
        "O melhor servidor Baiak � aqui! RibeirOT Server!!!",
		"Curta nossa fanpage:  RibeirOT Server",
		"Chame seus amigos! Entre no nosso grupo Whatsapp, s� enviar mensagem aos GMS!!",
		"Visite nosso site! ribeirot.servegame.com   ",
		"Atauliza��es di�rias! Acompanhe no site e tamb�m na nossa fan page!!!",
		"Fa�a uma Doa��o e incentive a melhoria do servidor feito para voc�s!!!",
		"Torne-se Fod�o!!! Realize uma doa��o, e adquira os itens MAX !!!",
}
 
function onThink(interval)
        local msg = msgs[math.random(#msgs)]
 
        for _, uid in pairs(getPlayersOnline()) do
                doScrollMessage(uid, msg)
        end
 
        return true
end