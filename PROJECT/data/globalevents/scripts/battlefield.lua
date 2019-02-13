function onThink(interval, lastExecution) 
local dias = {
        ["Monday"] = {
	["12:00"] ,
	["14:00"] ,
	["16:00"] ,
	["23:00"] ,
        },
        ["Tuesday"] = {
       	["21:05"] ,
	
        },
        ["Thursday"] = {
        ["12:00"] ,

        }
		
}
if dias[os.date("%A")] then
local hours = tostring(os.date("%X")):sub(1, 5)       
local tb = dias[os.date("%A")][hours] 
if tb then 

doBroadcastMessage("sistema XP reiniciado!", MESSAGE_EVENT_ADVANCE)

verificadoron() --reiniciador

return true
end
end
return true
end