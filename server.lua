local server_data = {
    [1] = nil,
    [2] = nil,
    ["players"] = Config.players,
    ["bookies"] = Config.bookies,
    ["bets"] = {
        [1] = 0,
        [2] = 0,
        ["pot"] = 0,
        ["players"] = {},
    },
    ["host"] = false,
    ["source"] = false,
    ["test"] = "OK",
}

-- ROUND
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

RegisterNetEvent('k_bookie:setHost')
AddEventHandler('k_bookie:setHost', function(host)
    _source = source
    _host = host
    if _host == 1 then
        print(('Host == %s on id # %i'):format(host, _source)) -- Host found
        server_data['host'] = source
        server_data['source'] = source
        TriggerClientEvent('clientData',source, server_data)
    else
        print(('Host == %s on id # %i'):format(host, _source)) -- Not the host
        data['source'] = source
        TriggerClientEvent('clientData',source, server_data)
    end
end)

RegisterNetEvent('k_bookie:setBet')
AddEventHandler('k_bookie:setBet', function(bet)
    _source = source
    local user_cash = 0
    TriggerEvent("redemrp:getPlayerFromId",_source,function(user)
        user_cash = user.getMoney()
    end)
    if user_cash > bet then
        TriggerClientEvent('clientPlaceBet',_source)
    else
        TriggerClientEvent('clientAlert',source,'not enough money')
    end

end)

RegisterNetEvent('k_bookie:fightOver')
AddEventHandler('k_bookie:fightOver', function(matchwinner)
    _source = source
    _winner = tonumber(matchwinner)

    if server_data["host"] == _source then
        for k,v in pairs(server_data["bets"]["players"]) do

            if v.serverid ~= false then

                local _win = tonumber(_winner)
                local _amn = tonumber(v.amount)
                local _bets = tonumber(server_data["bets"][_win])
                local _pot = tonumber(server_data["bets"]["pot"])

                print(_win, v.winner,_amn,_bets,_pot,v.serverid,v.playerid)
                if tonumber(v.winner) == _win then
                    local _perc = ( _amn / _bets ) * 100
                    local _win_amount = round((_perc * 1.00) * ( _pot / 100 ),2)
                    TriggerClientEvent('clientPayout',v.serverid, _win_amount, v.amount, v.winner)
                else
                    -- Lost Bet @TODO
                end
            end
        end
    end
    TriggerClientEvent('respawnPlayers',_source)

end)

RegisterNetEvent('k_bookie:setSpawned')
AddEventHandler('k_bookie:setSpawned', function(spawned)
    _source = source
    TriggerClientEvent('clientSpawned',-1, spawned)
end)

RegisterNetEvent('k_bookie:setData')
AddEventHandler('k_bookie:setData', function(data)
    _source = source
    if server_data["host"] ~= false then
        server_data = data
    end
end)

RegisterNetEvent('k_bookie:getData')
AddEventHandler('k_bookie:getData', function()
    _source = source
    -- Use -1 for "targetPlayer" if you want the event to trigger on all connected clients.
    TriggerClientEvent('clientData',-1, server_data)
end)

RegisterNetEvent("k_bookie:addCash")
AddEventHandler("k_bookie:addCash",function(money)
    -- Add Money and or XP
    local _money = tonumber(money)
    TriggerEvent("redemrp:getPlayerFromId",source,function(user)
        user.addMoney(tonumber(_money))
    end)
end)

RegisterNetEvent("k_bookie:removeCash")
AddEventHandler("k_bookie:removeCash",function(money)
    -- Add Money and or XP
    local _money = tonumber(money)
    TriggerEvent("redemrp:getPlayerFromId",source,function(user)
        user.removeMoney(tonumber(_money))
    end)
end)