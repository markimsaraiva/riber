local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end
 
-- QUEST --

--CIDADE --
function MapInicio(cid, type, msg)
 

		npcHandler:say('Prontinho!.', cid)
		for pos, v in pairs(mapMarks) do
			doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
		end
		
end

local mapMarks = {
	[{x = 1112, y = 1066, z = 7}] = {MAPMARK_LOCK, 'DP'},
	[{x = 1083, y = 1055, z = 7}] = {MAPMARK_DOLLAR, 'Bank'},	
	[{x = 1113, y = 1023, z = 7}] = {MAPMARK_REDNORTH, 'Saida Norte'},
	[{x = 1125, y = 1164, z = 7}] = {MAPMARK_REDSOUTH, 'Saida Sul'},
	[{x = 1170, y = 1073, z = 7}] = {MAPMARK_REDEAST, 'Saida Leste'},
	[{x = 1026, y = 1054, z = 7}] = {MAPMARK_REDWEST, 'Saida Oeste'}
}


--INICIAIS--
function MapInicio2(cid, type, msg)
 

		npcHandler:say('Prontinho!.', cid)
		for pos, v in pairs(mapMarks2) do
			doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
		end
		
end
local mapMarks2 = {
	[{x = 1112, y = 1066, z = 7}] = {MAPMARK_LOCK, 'DP'},
	[{x = 1083, y = 1055, z = 7}] = {MAPMARK_DOLLAR, 'Bank'},	
	[{x = 1113, y = 1023, z = 7}] = {MAPMARK_REDNORTH, 'Saida Norte'},
	[{x = 1125, y = 1164, z = 7}] = {MAPMARK_REDSOUTH, 'Saida Sul'},
	[{x = 1170, y = 1073, z = 7}] = {MAPMARK_REDEAST, 'Saida Leste'},
	[{x = 1026, y = 1054, z = 7}] = {MAPMARK_REDWEST, 'Saida Oeste'}
}


 --MEDIAS--
function MapInicio3(cid, type, msg)
 

		npcHandler:say('Prontinho!.', cid)
		for pos, v in pairs(mapMarks3) do
			doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
		end
		
end
local mapMarks3 = {
	[{x = 1112, y = 1066, z = 7}] = {MAPMARK_LOCK, 'DP'},
	[{x = 1083, y = 1055, z = 7}] = {MAPMARK_DOLLAR, 'Bank'},	
	[{x = 1113, y = 1023, z = 7}] = {MAPMARK_REDNORTH, 'Saida Norte'},
	[{x = 1125, y = 1164, z = 7}] = {MAPMARK_REDSOUTH, 'Saida Sul'},
	[{x = 1170, y = 1073, z = 7}] = {MAPMARK_REDEAST, 'Saida Leste'},
	[{x = 1026, y = 1054, z = 7}] = {MAPMARK_REDWEST, 'Saida Oeste'}
}

--AVANCADAS-- 
function MapInicio4(cid, type, msg)
 

		npcHandler:say('Prontinho!.', cid)
		for pos, v in pairs(mapMarks4) do
			doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
		end
		
end
local mapMarks4 = {
	[{x = 1112, y = 1066, z = 7}] = {MAPMARK_LOCK, 'DP'},
	[{x = 1083, y = 1055, z = 7}] = {MAPMARK_DOLLAR, 'Bank'},	
	[{x = 1113, y = 1023, z = 7}] = {MAPMARK_REDNORTH, 'Saida Norte'},
	[{x = 1125, y = 1164, z = 7}] = {MAPMARK_REDSOUTH, 'Saida Sul'},
	[{x = 1170, y = 1073, z = 7}] = {MAPMARK_REDEAST, 'Saida Leste'},
	[{x = 1026, y = 1054, z = 7}] = {MAPMARK_REDWEST, 'Saida Oeste'}
}

  
	
	local node1 = keywordHandler:addKeyword({'marca'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te mostrar onde ficam as coisas da {cidade}, hunts {iniciais} , {medias} , ou mais {avancadas} !'})
    node1:addChildKeyword({'cidade'}, MapInicio, {})
    node1:addChildKeyword({'inici'}, MapInicio2, {})
    node1:addChildKeyword({'medi'}, MapInicio3, {})
    node1:addChildKeyword({'avanc'}, MapInicio4, {})

    
 
 
npcHandler:addModule(FocusModule:new())