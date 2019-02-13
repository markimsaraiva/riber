local untradeable = {
8901,
2400
}


    function onTradeAccept(cid, target, item, targetItem)


doPlayerSendCancel (cid, "You can't trade this item!")
return false

end