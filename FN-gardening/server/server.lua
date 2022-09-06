QBCore = exports['qb-core']:GetCoreObject()
local Cooldown = false


RegisterNetEvent('FN-gardening:server:pagamento', function(total)
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.AddMoney(Config.paymentmethod, total)
end)
--Cooldown
RegisterServerEvent('FN-gardening:Server:BeginCooldown')
AddEventHandler('FN-gardening:Server:BeginCooldown', function()
    Cooldown = true
    local timer = 60 * 1000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            Cooldown = false
        end
    end
end)

QBCore.Functions.CreateCallback("FN-gardening:Cooldown",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false)
        
    end
end)