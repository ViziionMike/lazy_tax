ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local config = {}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)
    end
    TriggerEvent('esx:getConfig', function(cfg) config = cfg end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        print("^5[Lazy_TAX]^7 System gestartet")
    end
end)

local function applyTax()
    for _, player in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(player)
        local accountBalance = xPlayer.getAccount('bank').money
        local taxPercentage = config.taxPercentage or 1 -- Standardmäßig 1%
        local taxAmount = accountBalance * (taxPercentage / 100)
        xPlayer.removeAccountMoney('bank', taxAmount)
        local notificationType = config.notificationType or 'esx'
        if notificationType == 'esx' then
            TriggerClientEvent('showTaxNotification', player, taxAmount) -- Auslösen der ESX-Benachrichtigung
        elseif notificationType == 'chat' then
            TriggerClientEvent('chatMessage', player, '', {255, 0, 0}, string.format(config.taxNotification, taxAmount)) -- Auslösen der Chat-Benachrichtigung
        end
    end
end

-- Timer für die Steueranwendung
Citizen.CreateThread(function()
    while true do
        Citizen.Wait((config.taxInterval or 10) * 3600000) -- Millisekunden
        applyTax()
    end
end)
