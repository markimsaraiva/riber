battlefield_coins = 60
function battlefield_preiacao(cid)

     doPlayerAddItem(cid,6527,60)
return true
end

function create_tp_btf()
    doItemSetAttribute(doCreateItem(1387, 1, {x = 169, y = 44, z = 7, stackpos = 1}), "aid", 2138)
return true
end


function remove_tp_btf()
    doRemoveItem(getTileItemById({x = 169, y = 44, z = 7}, 1387).uid, 1)
return true
end

----------------------------------------------------------------------------------------------------------
function base_verde_ctf()
   doItemSetAttribute(doCreateItem(1437, 1, {x = 1180, y = 444, z = 6, stackpos = 1}), "uid", 2499)    
return true
end

function base_red_ctf() --direita
        doItemSetAttribute(doCreateItem(1435, 1, {x = 1234, y = 444, z = 6, stackpos = 1}), "uid", 2500)
    return true
end

function create_tp_ctf( )
    doItemSetAttribute(doCreateItem(1387, 1, {x = 165, y = 44, z = 7, stackpos = 1}), "aid", 1432)
return true
end

function remove_tp_ctf( )
    doRemoveItem(getTileItemById({x = 165, y = 44, z = 7}, 1387).uid, 1)
return true
end

function recompensa_ctf( cid )
         doPlayerAddExperience(cid, 35000000)
         doPlayerAddItem(cid,6527,80)
return true
end

exp_ctf=35
coin_ctf = 80

function empatado_ctf( cid )
        doPlayerAddExperience(cid, 20000000)
        doPlayerAddItem(cid,6527,40)    
 return true
end
empate_ctf=20
coinempate_ctf = 40

function esquerda_verde(  )         
        doItemSetAttribute(doCreateItem(1437, 1, {x = 1180, y = 444, z = 6, stackpos = 1}), "uid", 2499)
    return true
end

function direita_red( )       
        doItemSetAttribute(doCreateItem(1435, 1, {x = 1234, y = 444, z = 6}), "uid", 2500)  
    return true
end
---------------------------------------------------------------------------------------------------------
quant_desert_coin = 80
quant_desert_ingot = 10
function desert_recompensa(cid)
            doPlayerAddItem(cid,9971,10)
            doPlayerAddItem(cid,6527,80)
return true
end

function create_tp_desert( )
        doItemSetAttribute(doCreateItem(1387, 1, {x = 170, y = 53, z = 7, stackpos = 1}), "aid", 2137)
return true
end
function remove_tp_desert(  )
    doRemoveItem(getTileItemById({x = 170, y = 53, z = 7}, 1387).uid, 1)
    
    return true
end

-----------------------------------------------------------------------------------------------------------

function recompensa_zombie(cid)

                doPlayerAddItem(cid,6527,150)               
                doPlayerAddItem(cid,9971,30)
                doPlayerAddItem(cid,6570,1)

    return true
end

---------------------------------------------------------------------------------------------------------------
function create_tp_fire(  )
        doItemSetAttribute(doCreateTeleport(1387, cf.teleportToPosition, cf.teleportPosition), "aid", 1747)
return true 
end

