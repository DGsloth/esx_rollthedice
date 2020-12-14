RegisterNetEvent('warden:RollTheDice')
AddEventHandler('warden:RollTheDice', function(source)
    TriggerServerEvent('warden:ShowMessage', 'You rolled the chance dice! You may roll again in 2 minutes.')
    RequestAnimDict('anim@mp_player_intcelebrationmale@wank')
    while not HasAnimDictLoaded('anim@mp_player_intcelebrationmale@wank') do Citizen.Wait(0) end
    TaskPlayAnim(GetPlayerPed(GetPlayerFromServerId(source)), 'anim@mp_player_intcelebrationmale@wank', 'wank', 8.0, -8.0, -1, 49, 0, false, false, false)
    Citizen.Wait(2300)
    ClearPedTasks(GetPlayerPed(GetPlayerFromServerId(source)))
    RollTheDice()
end)

local canRollChance = true --[[ Do not touch ]]
local timeTillNextRoll = 60000 * 2 --[[ Change last number <minutes> ]]
function RollTheDice()
    local chancePercent = math.random(1, 20)
    if canRollChance then
        if chancePercent <= 5 then
            TriggerServerEvent('warden:removeMoney', math.random(1, 500)*chancePercent)
        elseif chancePercent >= 6 and chancePercent <= 11 then
            TriggerServerEvent('warden:addMoney', math.random(1, 500)*chancePercent)
        elseif chancePercent >= 12 and chancePercent <= 20 then
            TriggerServerEvent('warden:addMoney', math.random(1, 500)*chancePercent)
        elseif chancePercent == 20 then
            TriggerServerEvent('warden:addMoney', math.random(500, 1000)*chancePercent)
        else
            TriggerServerEvent('warden:ShowMessage', 'Invalid chance number ~r~['..chance..']')
        end
        canRollChance = false
    else
        TriggerServerEvent('warden:ShowMessage', '~r~You must wait before you can roll again')
    end
    Wait(timeTillNextRoll)
    canRollChance = true
end
