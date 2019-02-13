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

	   doPlayerPopupFYI(cid, notice)
        file:close()
    end
    
    if (param == 'info') then
        doShowTextDialog(cid, 7528, config.info)
        end
    
    
 
    return true
end

		-- local str = "[+] Auto Loot Commands [+]\n\n!autoloot item name --> To add ou Remove item from list.\n!autoloot money --> To collect gold automatically.\n!autoloot clear --> To clear the list.\n!autoloot on/off --> To enable or disable the collecting of items in the system.\n\n[+] Auto Loot Info [+]\n\nSystem: .\nTime: \n\n[+] Auto Loot Slots [+]\n\n"



	  
