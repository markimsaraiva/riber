function onSay(cid, words, param, channel)

coco = getMonsterInfo(Demon).experience
doPlayerSendTextMessage(cid,18,""..coco.."")

return true
end