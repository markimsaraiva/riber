function onSay(player, words, param)
local text = '---------------------------**| -> Tasks System Infos <- |**---------------------------\n'
if param:lower() == "me" then
text = text .. '[+] Pontos Task [+]: Você tem '..taskPoints_get(player)..' pontos Task.\n[+] Pontos Task Rank [+]: Você tem '..taskRank_get(player)..' pontos Task.\n[+] Task Rank [+]: '..getRankTask(player)..''
return false,  doPlayerPopupFYI(cid,text)
end

if getTaskInfos(player) then
local taskNormal = getPlayerStorageValue(cid,getTaskInfos(player).storage)
  text = text .. '\n\n      [ -> ----- [+] Task Normal [+] ----- <- ]\n      \n[*] Task Atual [*]: '..getTaskInfos(player).nome..' - Você precisa matar: '..getTaskInfos(player).amount..'.\n[*] Prêmios [*]: '..getItemsFromTable(getTaskInfos(player).items)..' - '..getTaskInfos(player).pointsTask[1]..' Pontos Task - '..getTaskInfos(player).pointsTask[2]..' Pontos Rank da Task. \n[*] Progresso [*]: ['..(getPlayerStorageValue(cid,getTaskInfos(player).storage))..'/'..getTaskInfos(player).amount..']\n[*] Status da Task [*]: '..(taskNormal == getTaskInfos(player).amount and 'Completa' or 'Incompleta')..'!'			
else
 text = text .. '\n\n      [ -> ----- [+] Task Normal [+] ----- <- ]\n      \n--- Você não está fazendo Task nenhuma.'
end

if getTaskDailyInfo(player) then
local taskDaily = getPlayerStorageValue(cid,getTaskDailyInfo(player).storage)
  text = text .. '\n\n\n      [ -> ----- [+] Task Diaria [+] ----- <- ]\n      \n[*] Task Atual [*]: '..getTaskDailyInfo(player).nome..' - Você precisa matar: '..getTaskDailyInfo(player).amount..'.\n[*] Prêmios [*]: '..getItemsFromTable(getTaskDailyInfo(player).items)..' - '..getTaskDailyInfo(player).pointsTask[1]..' Pontos Task - '..getTaskDailyInfo(player).pointsTask[2]..' Pontos Rank da Task. \n[*] Progresso [*]: ['..(getPlayerStorageValue(cid,getTaskDailyInfo(player).storage))..'/'..getTaskDailyInfo(player).amount..']\n[*] Status da Task [*]: '..(taskDaily == getTaskDailyInfo(player).amount and 'Completa' or 'Incompleta')..'!'			
else
text = text .. '\n\n\n      [ -> ----- [+] Task Diaria [+] ----- <- ]\n      \n--- Você não está fazendo nenhuma Task Diaria.'
end
 return false,  doPlayerPopupFYI(cid,text)
end
