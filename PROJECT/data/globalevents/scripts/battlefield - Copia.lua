function onThink(interval, lastExecution) 
local dias = {
        ["Monday"] = {
	["12:00"] ,
	["14:00"] ,
	["16:00"] ,
	["23:00"] ,
        },
        ["Tuesday"] = {
       	["12:00"] ,
	
        },
        ["Thursday"] = {
        ["12:00"] ,

        }
		
}
if dias[os.date("%A")] then
local hours = tostring(os.date("%X")):sub(1, 5)       
local tb = dias[os.date("%A")][hours] 
if tb then 


doBroadcastMessage(" teste do batlefiud", MESSAGE_EVENT_ADVANCE)

addEvent(


return true
end
end
return true
end