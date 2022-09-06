QBCore = exports['qb-core']:GetCoreObject()
local canwork = false
local vezes = 0
local amount = Config.paymentbybush
local total = 0


AddEventHandler('onResourceStarting', function(resourceName)
  if resourceName == 'FN-gardening' then
    CancelEvent()
  end
end)

CreateThread(function()
  --Blip
  if Config.Coords['WantBlip'] == 'yes' then
    Blip = AddBlipForCoord(Config.Coords['Blip'])
    SetBlipSprite (Blip, 541)
    SetBlipDisplay(Blip, 4)
    SetBlipScale  (Blip, 0.6)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Coords['BlipName'])
    EndTextCommandSetBlipName(Blip)
  elseif Config.Coords['WantBlip'] == 'no' then
    RemoveBlip(Blip)
  end
  --Ped
  RequestModel(Config.Coords['PedModel'])
    while not HasModelLoaded(Config.Coords['PedModel']) do
    Wait(1)
  end
  
  Ped = CreatePed(2, Config.Coords['PedModel'], Config.Coords['Ped'], false, false)
  SetPedFleeAttributes(Ped, 0, 0)
  SetPedDiesWhenInjured(Ped, false)
  SetPedKeepTask(Ped, true)
  SetBlockingOfNonTemporaryEvents(Ped, true)
  SetEntityInvincible(Ped, true)
  FreezeEntityPosition(Ped, true)
  TaskStartScenarioInPlace(Ped, 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
end)

RegisterNetEvent('FN-gardening:startwork', function()
  HasItems = QBCore.Functions.HasItem('scissors')
  QBCore.Functions.TriggerCallback("FN-gardening:Cooldown", function(cooldown)
    if not cooldown then
      if canwork == false then
        if HasItems then
          if Config.notify == 'mythic' then
            exports['mythic_notify']:DoHudText('success', Lang.givesomespots)
          elseif Config.notify == 'qbcore' then
            QBCore.Functions.Notify(Lang.givesomespots, 'success', 7500)
          end
          canwork = true
          vezes = 0
          loc1()
        else
          if Config.notify == 'mythic' then
            exports['mythic_notify']:DoHudText('inform', Lang.donthaveitem)
          elseif Config.notify == 'qbcore' then
            QBCore.Functions.Notify(Lang.donthaveitem, 'inform', 7500)
          end
        end
      else
        if Config.notify == 'mythic' then
          exports['mythic_notify']:DoHudText('inform', Lang.alreadyhavework)
        elseif Config.notify == 'qbcore' then
          QBCore.Functions.Notify(Lang.alreadyhavework, 'inform', 7500)
        end
      end
    else
      if Config.notify == 'mythic' then
        exports['mythic_notify']:DoHudText('inform', Lang.ontimeout)
      elseif Config.notify == 'qbcore' then
        QBCore.Functions.Notify(Lang.ontimeout, 'inform', 7500)
      end
    end
  end)
end)

RegisterNetEvent('FN-gardening:workbushes1', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc1')
    loc2()
    vezes = vezes + 1
    if Config.notify == 'mythic' then
      exports['mythic_notify']:DoHudText('inform', Lang.leftone)
    elseif Config.notify == 'qbcore' then
      QBCore.Functions.Notify(Lang.leftone, 'inform', 7500)
    end
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes2', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc2')
    loc3()
    vezes = vezes + 1
    if Config.notify == 'mythic' then
      exports['mythic_notify']:DoHudText('inform', Lang.infrontofyou)
    elseif Config.notify == 'qbcore' then
      QBCore.Functions.Notify(Lang.infrontofyou, 'inform', 7500)
    end
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes3', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc3')
    loc4()
    vezes = vezes + 1
    if Config.notify == 'mythic' then
      exports['mythic_notify']:DoHudText('inform', Lang.therest)
    elseif Config.notify == 'qbcore' then
      QBCore.Functions.Notify(Lang.therest, 'inform', 7500)
    end
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes4', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc4')
    loc5()
    vezes = vezes + 1
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes5', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc5')
    loc6()
    vezes = vezes + 1
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes6', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc6')
    loc7()
    vezes = vezes + 1
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes7', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc7')
    loc8()
    vezes = vezes + 1
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes8', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc8')
    loc9()
    vezes = vezes + 1
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:workbushes9', function()
  TriggerEvent('animations:client:EmoteCommandStart', {"gardening"})
  QBCore.Functions.Progressbar('workbushes', Lang.workbushes, 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
  }, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    exports['qb-target']:RemoveZone('loc9')
    vezes = vezes + 1
    if Config.notify == 'mythic' then
      exports['mythic_notify']:DoHudText('inform', Lang.cometome)
    elseif Config.notify == 'qbcore' then
      QBCore.Functions.Notify(Lang.cometome, 'inform', 7500)
    end
  end, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  end)
end)

RegisterNetEvent('FN-gardening:client:payment', function()
  if vezes > 0 then
    total = vezes * amount
    TriggerServerEvent('FN-gardening:server:pagamento', total)
    canwork = false
    exports['qb-target']:RemoveZone('loc1')
    exports['qb-target']:RemoveZone('loc2')
    exports['qb-target']:RemoveZone('loc3')
    exports['qb-target']:RemoveZone('loc4')
    exports['qb-target']:RemoveZone('loc5')
    exports['qb-target']:RemoveZone('loc6')
    exports['qb-target']:RemoveZone('loc7')
    exports['qb-target']:RemoveZone('loc8')
    exports['qb-target']:RemoveZone('loc9')
  else
    if Config.notify == 'mythic' then
      exports['mythic_notify']:DoHudText('inform', Lang.didntwork)
    elseif Config.notify == 'qbcore' then
      QBCore.Functions.Notify(Lang.didntwork, 'inform', 7500)
    end
  end
end)
