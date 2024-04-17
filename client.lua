ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('showTaxNotification')
AddEventHandler('showTaxNotification', function(taxAmount)
    ESX.ShowNotification('Es wurden ' .. taxAmount .. '$ Steuern von Ihrem Konto abgezogen.')
end)

RegisterNetEvent('receiveConfigFromServer')
AddEventHandler('receiveConfigFromServer', function(receivedConfig)
    config = receivedConfig
end)
