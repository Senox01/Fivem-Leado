ESX = exports['es_extended']:getSharedObject()


RegisterServerEvent('vl_leado:buyWood')
AddEventHandler('vl_leado:buyWood', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 5
     xPlayer.addMoney(prize)
end)

RegisterServerEvent('vl_leado:sellWood')
AddEventHandler('vl_leado:sellWood', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 5
    xPlayer.removeMoney(prize)
end)

RegisterServerEvent('vl_leado:buyStone')
AddEventHandler('vl_leado:buyStone', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 10
     xPlayer.addMoney(prize)
end)

RegisterServerEvent('vl_leado:sellStone')
AddEventHandler('vl_leado:sellStone', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 10
    xPlayer.removeMoney(prize)
end)

RegisterServerEvent('vl_leado:buyCoal')
AddEventHandler('vl_leado:buyCoal', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 15
     xPlayer.addMoney(prize)
end)

RegisterServerEvent('vl_leado:sellCoal')
AddEventHandler('vl_leado:sellCoal', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 15
    xPlayer.removeMoney(prize)
end)

RegisterServerEvent('vl_leado:buyIron')
AddEventHandler('vl_leado:buyIron', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 20
     xPlayer.addMoney(prize)
end)

RegisterServerEvent('vl_leado:sellIron')
AddEventHandler('vl_leado:sellIron', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 20
    xPlayer.removeMoney(prize)
end)

RegisterServerEvent('vl_leado:buyGold')
AddEventHandler('vl_leado:buyGold', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 100
     xPlayer.addMoney(prize)
end)

RegisterServerEvent('vl_leado:sellGold')
AddEventHandler('vl_leado:sellGold', function()
     local source = source
     local xPlayer = ESX.GetPlayerFromId(source)
     local prize = 100
    xPlayer.removeMoney(prize)
end)
