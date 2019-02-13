--[[

- hora deve ser exata SERVER

- para fazer o raid tera que ser ex: 00 hour(horas) e 00 minu (minutos)

- para fazer a raid na data e hora no tempo exato, uso "exact"

- para fazer a raid ocorrer todas as semanas (pelo menos 1x na semana) uso "weekly"

- o nome dos dias sao ultilizados apenas para o tipo semanal que devera ser

- "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"

- tambem devem estar dentro de uma matriz-> {}

]]


local raids =

	{

		[1] =

			{


				type = 'exact',

				data = {day=14,month=03},

				hour = 23,

				minu = 00

			},
			[2] =

			{


				type = 'exact',

				data = {day=14,month=04},

				hour = 23,

				minu = 00

			},
			[3] =

			{


				type = 'exact',

				data = {day=14,month=05},

				hour = 23,

				minu = 00

			},
			[4] =

			{


				type = 'exact',

				data = {day=14,month=06},

				hour = 23,

				minu = 00

			},
			[5] =

			{


				type = 'exact',

				data = {day=14,month=07},

				hour = 23,

				minu = 00

			},
			[6] =

			{


				type = 'exact',

				data = {day=14,month=08},

				hour = 23,

				minu = 00

			},
			[7] =

			{


				type = 'exact',

				data = {day=14,month=09},

				hour = 23,

				minu = 00

			},
			[8] =

			{


				type = 'exact',

				data = {day=14,month=10},

				hour = 23,

				minu = 00

			},
			[9] =

			{


				type = 'exact',

				data = {day=14,month=11},

				hour = 23,

				minu = 00

			},
			[10] =

			{


				type = 'exact',

				data = {day=14,month=12},

				hour = 23,

				minu = 00

			},
			[11] =

			{


				type = 'exact',

				data = {day=14,month=01},

				hour = 23,

				minu = 00

			},
			[12] =

			{


				type = 'exact',

				data = {day=14,month=02},

				hour = 23,

				minu = 00

			},

			

		

	}


local last_execsutes = {}


function onThink(interval, lastExecution, thinkInterval)

	local static_time = os.time()

	for k, raid in ipairs(raids) do

		if (raid.type == 'weekly') then

			local day = os.date("%A", static_time):lower()

			if isInArray(raid.days, day) then

				local hour = tonumber(os.date("%H", static_time))

				if (raid.hour == hour) then

					local minute = tonumber(os.date("%M", static_time))

					if (raid.minu == minute) then

						local day_number = tonumber(os.date("%d", static_time))

						if (last_execsutes[k] ~= day_number) then

							last_execsutes[k] = day_number

							-- local town = getTownName(1)
				  	-- 		local mailBoxPos = {x = 136, y = 159, z = 6}
							-- local parcel1 = doCreateItemEx(2595)
						 --    local label1 = doAddContainerItem(parcel1, 2599)
 						-- 	doSetItemText(label1, nomeprimeiro() .."\n".. town)
							-- local carta1 = doAddContainerItem(parcel1, 1952) 
							-- local item_primeiro_um = doAddContainerItem(parcel1, 2160, 1) 
							-- local item_primeiro_dois = doAddContainerItem(parcel1, 8901) 
							-- local item_primeiro_tres = doAddContainerItem(parcel1, 12372)
							-- doItemSetAttribute(carta1, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..nomeprimeiro().."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel1, mailBoxPos)

							-- local parcel2 = doCreateItemEx(2595)
						 --    local label2 = doAddContainerItem(parcel2, 2599)
 						-- 	doSetItemText(label2, nomesegundo() .."\n".. town)
							-- local carta2 = doAddContainerItem(parcel2, 1952) 
							-- local item_segundo_um = doAddContainerItem(parcel2, 2160, 2) 
							-- local item_segundo_dois = doAddContainerItem(parcel2, 8901) 
							-- local item_segundo_tres = doAddContainerItem(parcel2, 12372)
							-- doItemSetAttribute(carta2, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..nomesegundo().."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel2, mailBoxPos)

							-- local parcel3 = doCreateItemEx(2595)
						 --    local label3 = doAddContainerItem(parcel3, 2599)
 						-- 	doSetItemText(label3, nometerceiro() .."\n".. town)
							-- local carta3 = doAddContainerItem(parcel3, 1952) 
							-- local item_terceiro_um = doAddContainerItem(parcel3, 2160, 3) 
							-- local item_terceiro_dois = doAddContainerItem(parcel3, 8901) 
							-- local item_terceiro_tres = doAddContainerItem(parcel3, 12372)
							-- doItemSetAttribute(carta3, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..nometerceiro().."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel3, mailBoxPos)


							-- doBroadcastMessage("[XPRANK]: CLASSIFICACAO FINAL DESSA SEMANA:\n1 - "..nomeprimeiro().."\n2 - "..nomesegundo().."\n3 - "..nometerceiro().."\nForam os 3 melhores ganhadores de xp! parabens! A recompensa de voces esta no DP da Baiak City!")






							-- 					db.executeQuery("UPDATE `player_storage` SET `value`= 1 WHERE `key` = 2014159 ;")
							-- 					db.executeQuery("UPDATE `player_storage` SET `value`= 0 WHERE `key` = 2014160 ;")
							-- 					db.executeQuery("UPDATE `players` SET `army_level` = 1 ;")
	

							-- 					setGlobalStorageValue(PATENTI, 0)
							-- 					setGlobalStorageValue(PATENTI, os.time() + TEMPO_PATENTI)
							-- 					doBroadcastMessage("O sistema de patente foi reiniciado!")


						end

					end

				end

			end

		elseif (raid.type == 'exact') then

			local month = tonumber(os.date("%m", static_time))

			if (raid.data.month == month) then

				local day = tonumber(os.date("%d", static_time))

				if (raid.data.day == day) then

					local hour = tonumber(os.date("%H", static_time))

					if (raid.hour == hour) then

						local minute = tonumber(os.date("%M", static_time))

						if (raid.minu == minute) then

							if (last_execsutes[k] ~= day) then

							last_execsutes[k] = day


							-- local town = getTownName(1)
				  	-- 		local mailBoxPos = {x = 136, y = 159, z = 6}
							-- local parcel1 = doCreateItemEx(2595)
						 --    local label1 = doAddContainerItem(parcel1, 2599)
 						-- 	doSetItemText(label1, nomeprimeiro() .."\n".. town)
							-- local carta1 = doAddContainerItem(parcel1, 1952) 
							-- local item_primeiro_um = doAddContainerItem(parcel1, 2160, 1) 
							-- local item_primeiro_dois = doAddContainerItem(parcel1, 8901) 
							-- local item_primeiro_tres = doAddContainerItem(parcel1, 12372)
							-- doItemSetAttribute(carta1, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..nomeprimeiro().."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel1, mailBoxPos)

							-- local parcel2 = doCreateItemEx(2595)
						 --    local label2 = doAddContainerItem(parcel2, 2599)
 						-- 	doSetItemText(label2, nomesegundo() .."\n".. town)
							-- local carta2 = doAddContainerItem(parcel2, 1952) 
							-- local item_segundo_um = doAddContainerItem(parcel2, 2160, 2) 
							-- local item_segundo_dois = doAddContainerItem(parcel2, 8901) 
							-- local item_segundo_tres = doAddContainerItem(parcel2, 12372)
							-- doItemSetAttribute(carta2, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..nomesegundo().."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel2, mailBoxPos)

							-- local parcel3 = doCreateItemEx(2595)
						 --    local label3 = doAddContainerItem(parcel3, 2599)
 						-- 	doSetItemText(label3, nometerceiro() .."\n".. town)
							-- local carta3 = doAddContainerItem(parcel3, 1952) 
							-- local item_terceiro_um = doAddContainerItem(parcel3, 2160, 3) 
							-- local item_terceiro_dois = doAddContainerItem(parcel3, 8901) 
							-- local item_terceiro_tres = doAddContainerItem(parcel3, 12372)
							-- doItemSetAttribute(carta3, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..nometerceiro().."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel3, mailBoxPos)


							-- 	-- DUVIDA: PREMIAÇAO, QUAL A ORDEM DE COLOCAÇAO, VISTO QUE MUITOS PODEM GANHAR, COMO FAZER ESSA DISTNÇAO DE UM NUMERO MAXIMO
							-- 	-- COMO DESEMPATAR (CRITERIOS)
							-- doBroadcastMessage("[PATENTE]: CLASSIFICACAO FINAL DESSE MES:\n1 - "..nomeprimeiro().."\n2 - "..nomesegundo().."\n3 - "..nometerceiro().."\nForam os 3 melhores ganhadores de xp! parabens! A recompensa de voces esta no DP da Baiak City!")







												local n,a,x,vu,vulvl,vuxp,v,vlvl,vxp,dezen,dezenlvl,dezenxp,dezoito,dezoitolvl,dezoitoxp,dezessete,dezessetelvl,dezessetexp,dezesseis,dezesseislvl,dezzeseisxp= semnome()
												j = 1
												while j < 2 do

													local town = getTownName(1)

										  			local mailBoxPos = {x = 159, y = 156, z = 6}

													local parcel1 = doCreateItemEx(2595)
												    local label1 = doAddContainerItem(parcel1, 2599)
						 							doSetItemText(label1, vu[j] .."\n".. town)
													local carta1 = doAddContainerItem(parcel1, 1952) 

												    local hahaha = doAddContainerItem(parcel1, 12372, 1000) --PREMIO CHALLENGER
												    local goldingot = doAddContainerItem(parcel1, 9971,10) --PREMIO CHALLENGER

													doItemSetAttribute(carta1, "text", "[+] ELO RANK [+]\n\nParabens "..vu[j].."\n\nRecompensa por ter conquistado o CHALLENGER ELO! parabens!\n\n[+] ELO RANK [+]")
													doTeleportThing(parcel1, mailBoxPos)
													j = j+1
												end

												j = 1	
												while j < 3 do

																										local town = getTownName(1)

										  			local mailBoxPos = {x = 161, y = 156, z = 6}

													local parcel1 = doCreateItemEx(2595)
												    local label1 = doAddContainerItem(parcel1, 2599)
						 							doSetItemText(label1, v[j] .."\n".. town)
													local carta1 = doAddContainerItem(parcel1, 1952) 

												    local hahaha = doAddContainerItem(parcel1, 12372, 800) --PREMIO MASTER I
												    local goldingot = doAddContainerItem(parcel1, 9971,10) --PREMIO MASTER I

													doItemSetAttribute(carta1, "text", "[+] ELO RANK [+]\n\nParabens "..v[j].."\n\nRecompensa por ter conquistado o MASTER I ELO! parabens!\n\n[+] ELO RANK [+]")
													doTeleportThing(parcel1, mailBoxPos)

													j = j+1
												end

												j = 1	
												while j < 4 do

																										local town = getTownName(1)

										  			local mailBoxPos = {x = 163, y = 156, z = 6}

													local parcel1 = doCreateItemEx(2595)
												    local label1 = doAddContainerItem(parcel1, 2599)
						 							doSetItemText(label1, dezen[j] .."\n".. town)
													local carta1 = doAddContainerItem(parcel1, 1952) 

												    local hahaha = doAddContainerItem(parcel1, 12372, 800) --PREMIO MASTER II
												    local goldingot = doAddContainerItem(parcel1, 9971,10) --PREMIO MASTER II

													doItemSetAttribute(carta1, "text", "[+] ELO RANK [+]\n\nParabens "..dezen[j].."\n\nRecompensa por ter conquistado o MASTER II ELO! parabens!\n\n[+] ELO RANK [+]")
													doTeleportThing(parcel1, mailBoxPos)

													j = j+1
												end


												while j < 5 do

																										local town = getTownName(1)

										  			local mailBoxPos = {x = 159, y = 158, z = 6}

													local parcel1 = doCreateItemEx(2595)
												    local label1 = doAddContainerItem(parcel1, 2599)
						 							doSetItemText(label1, dezoito[j] .."\n".. town)
													local carta1 = doAddContainerItem(parcel1, 1952) 

												    local hahaha = doAddContainerItem(parcel1, 12372, 800) --PREMIO DIAMOND I
												    local goldingot = doAddContainerItem(parcel1, 9971,10) --PREMIO DIAMOND I

													doItemSetAttribute(carta1, "text", "[+] ELO RANK [+]\n\nParabens "..dezoito[j].."\n\nRecompensa por ter conquistado o DIAMOND I ELO! parabens!\n\n[+] ELO RANK [+]")
													doTeleportThing(parcel1, mailBoxPos)

													j = j+1
												end

												while j < 6 do

																										local town = getTownName(1)

										  			local mailBoxPos = {x = 161, y = 158, z = 6}

													local parcel1 = doCreateItemEx(2595)
												    local label1 = doAddContainerItem(parcel1, 2599)
						 							doSetItemText(label1, dezessete[j] .."\n".. town)
													local carta1 = doAddContainerItem(parcel1, 1952) 

												    local hahaha = doAddContainerItem(parcel1, 12372, 800) --PREMIO DIAMOND II
												    local goldingot = doAddContainerItem(parcel1, 9971,10) --PREMIO DIAMOND II

													doItemSetAttribute(carta1, "text", "[+] ELO RANK [+]\n\nParabens "..dezessete[j].."\n\nRecompensa por ter conquistado o DIAMOND II ELO! parabens!\n\n[+] ELO RANK [+]")
													doTeleportThing(parcel1, mailBoxPos)

													j = j+1
												end

												while j < 7 do

													local town = getTownName(1)

										  			local mailBoxPos = {x = 163, y = 158, z = 6}

													local parcel1 = doCreateItemEx(2595)
												    local label1 = doAddContainerItem(parcel1, 2599)
						 							doSetItemText(label1,  dezesseis[j] .."\n".. town)
													local carta1 = doAddContainerItem(parcel1, 1952) 

												    local hahaha = doAddContainerItem(parcel1, 12372, 800) --PREMIO DIAMOND III
												    local goldingot = doAddContainerItem(parcel1, 9971,10) --PREMIO DIAMOND III

													doItemSetAttribute(carta1, "text", "[+] ELO RANK [+]\n\nParabens "..dezesseis[j].."\n\nRecompensa por ter conquistado o DIAMOND III ELO! parabens!\n\n[+] ELO RANK [+]")
													doTeleportThing(parcel1, mailBoxPos)

													j = j+1
												end



				
												db.executeQuery("UPDATE `global_storage` SET `value`= 0 WHERE `key` = "..storageglobal21.." ;")
												db.executeQuery("UPDATE `global_storage` SET `value`= 0 WHERE `key` = "..storageglobal20.." ;")
												db.executeQuery("UPDATE `global_storage` SET `value`= 0 WHERE `key` = "..storageglobal19.." ;")
												db.executeQuery("UPDATE `global_storage` SET `value`= 0 WHERE `key` = "..storageglobal18.." ;")
												db.executeQuery("UPDATE `global_storage` SET `value`= 0 WHERE `key` = "..storageglobal17.." ;")
												db.executeQuery("UPDATE `global_storage` SET `value`= 0 WHERE `key` = "..storageglobal16.." ;")
												db.executeQuery("UPDATE `player_storage` SET `value`= 1 WHERE `key` = "..ARMY_LEVEL.." ;")
												db.executeQuery("UPDATE `player_storage` SET `value`= 0 WHERE `key` = "..ARMY_EXPERIENCE.." ;")
												db.executeQuery("UPDATE `players` SET `army_level` = 1 ;")
												db.executeQuery("UPDATE `players` SET `army_experience` = 0 ;")


												setGlobalStorageValue(PATENTI, 0)
												setGlobalStorageValue(PATENTI, os.time() + TEMPO_PATENTI)
												doBroadcastMessage("O sistema de patente foi reiniciado!")


							end

						end

					end

				end

			end

		end

	end

	return true

end