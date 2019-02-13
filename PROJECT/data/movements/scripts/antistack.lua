local positions = {
{x = 1112, y = 1067, z = 7},
{x = 1111, y = 1065, z = 7},
{x = 1113, y = 1067, z = 7},
{x = 1112, y = 1065, z = 7},
{x = 1113, y = 1067, z = 7},
{x = 1111, y = 1065, z = 7},
{x = 1113, y = 1067, z = 7},
{x = 1111, y = 1065, z = 7},
{x = 1113, y = 1067, z = 7},
{x = 1111, y = 1065, z = 7}-- aqui vc coloca a posição pra onde ele vão

}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
doTeleportThing(cid, positions[math.random(1, #positions)])
return true
end