ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('warden:ShowMessage')
AddEventHandler('warden:ShowMessage', function(msg)
    TriggerClientEvent('esx:showNotification', source, msg)
end)

RegisterServerEvent('warden:addMoney')
AddEventHandler('warden:addMoney', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('bank', money)
    TriggerClientEvent('esx:showNotification', source, 'Congratulations! You won ~g~$'..money)
end)

RegisterServerEvent('warden:removeMoney')
AddEventHandler('warden:removeMoney', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', money)
    TriggerClientEvent('esx:showNotification', source, 'You were charged ~r~$'..money)
end)

RegisterNetEvent('warden:GiveAnItem')
AddEventHandler('warden:GiveAnItem', function(item, amt)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(item, amt) then
        xPlayer.addInventoryItem(item, amt)
        TriggerClientEvent('esx:showNotification', source, 'Congratulations! You won x'..amt..' of '..item)
    else
        TriggerClientEvent('esx:showNotification', source, 'You are ~r~overweight ~w~and cannot carry ~b~x'..amt..' '..item)
    end
end)

RegisterCommand('rtd', function(source, args, rawCommand) TriggerClientEvent('warden:RollTheDice', source) end, false)
