local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
        
        
        -- OTServ event handling functions start
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        -- OTServ event handling functions end
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'aracura'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para aracura?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=883, y=1133, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Blz, flw!'})

       local travelNode = keywordHandler:addKeyword({'baiak'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para baiak city?'})
       travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=1025, y=1076, z=6} })
       travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Blz, flw!'})
        
	local travelNode = keywordHandler:addKeyword({'nissey'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para nissey?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=1208, y=859, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Blz, flw!'})
			
			local travelNode = keywordHandler:addKeyword({'sarn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para sarn?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=1270, y=1048, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Blz, flw!'})
        
	local travelNode = keywordHandler:addKeyword({'ancient'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce deseja ir para ancient city?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=1220, y=1264, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Blz, flw!'})

			
        keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Aqui e: Solaris. Para onde voce quer ir? Para {aracura} , {baiak} city , {nissey} , {sarn} , {ancient} city? '})
        keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu sou o capitao do navio!'})
		keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu sou o capitao do navio!'})
       

        npcHandler:addModule(FocusModule:new())