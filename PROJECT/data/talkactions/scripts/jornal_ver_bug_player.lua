
local config ={
    msgreport2 = 'Voce nao tem permissao para usar esse comando.',
    info2 = 'Vode pode usar os seguintes itens:  \n /abrir notice \n /abrir report \n /abrir log, name \n exemplo: /abrir log, Pepeco',
    }
function onSay(cid, words, param)
    
    if getPlayerAccess(cid) >=3 then
        local file = io.open('report_players.txt','r')
        report = file:read(-1)
	   doPlayerPopupFYI(cid, report)
        file:close()
        elseif getPlayerAccess(cid) <=1 then
            doPlayerSendTextMessage(cid,22,config.msgreport2)
    end
    
    if (param == 'info') then
        doShowTextDialog(cid, 7528, config.info2)
        end
    
    
 
    return true
end

