ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('VanguardianDG:ShowMessage')
AddEventHandler('VanguardianDG:ShowMessage', function(msg)
    TriggerClientEvent('esx:showNotification', source, msg)
end)

RegisterServerEvent('VanguardianDG:addMoney')
AddEventHandler('VanguardianDG:addMoney', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('bank', money)
    TriggerClientEvent('esx:showNotification', source, 'Congratulations! You won ~g~$'..money)
end)

RegisterServerEvent('VanguardianDG:removeMoney')
AddEventHandler('VanguardianDG:removeMoney', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', money)
    TriggerClientEvent('esx:showNotification', source, 'You were charged ~r~$'..money)
end)

RegisterNetEvent('VanguardianDG:GiveAnItem')
AddEventHandler('VanguardianDG:GiveAnItem', function(item, amt)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(item, amt) then
        xPlayer.addInventoryItem(item, amt)
        TriggerClientEvent('esx:showNotification', source, 'Congratulations! You won x'..amt..' of '..item)
    else
        TriggerClientEvent('esx:showNotification', source, 'You are ~r~overweight ~w~and cannot carry ~b~x'..amt..' '..item)
    end
end)

RegisterCommand('rtd', function(source, args, rawCommand) TriggerClientEvent('VanguardianDG:RollTheDice', source) end, false)
