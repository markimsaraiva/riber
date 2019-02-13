-- --- Criado por Absolute ---
-- function onSay(cid, words, param)
-- file = io.open('absolute.txt','r')
-- notice = file:read(-1)
-- doShowTextDialog(cid,7528,notice)
-- file:close()
-- end

local config ={
    msgreport = 'Voce nao tem permissao para usar esse comando.',
    info = 'Vode pode usar os seguintes itens:  \n /abrir notice \n /abrir report \n /abrir log, name \n exemplo: /abrir log, Pepeco',
    }
function onSay(cid, words, param)
    if (words == "!jornal") or (words == "/jornal") or (words == "!novidades") or (words == "/novidades")  then
        file = io.open('noticias.txt','r')
        notice = file:read(-1)
        doShowTextDialog(cid,7528,notice)
        file:close()
    end
    
    if (param == 'info') then
        doShowTextDialog(cid, 7528, config.info)
        end
    
    
 
    return true
end


