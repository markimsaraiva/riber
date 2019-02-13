
local itemtype = {9969}

function onSay(cid, words, param)
    number = 1
    param = string.lower(param)
    skilllist = ""
    

            local player = db.getResult("SELECT  `name`, `arenalivre` FROM `players` WHERE (`group_id` < 2 AND account_id != 18 AND account_id != 1)  ORDER BY `arenalivre` DESC LIMIT 15;")    
            if(player:getID() ~= -1) then
                while (true) do
                    local name = player:getDataString("name")
                    local arenalivre = player:getDataString("arenalivre")

                      skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..tostring(name).."  -  "..tostring(arenalivre))
                    number = number + 1
                    if not(player:next()) then
                        break
                    end
                end
                player:free()
            end

        dialog = " Arena Livre: \n  "..skilllist..""
        doShowTextDialog(cid, 9969, dialog)
        return true
    end    
