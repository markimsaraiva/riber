function executeSaveServer()
    doSaveServer()
    return true
end

function onThink(interval, lastExecution, thinkInterval)
doBroadcastMessage("Server Saving ..")
    addEvent(executeSaveServer, 1000)
    return true
end