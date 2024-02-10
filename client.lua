local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("weapon_silencer", src)
vSERVER = Tunnel.getInterface("weapon_silencer")


RegisterCommand('silenciador', function(source, args)
    local ped = PlayerPedId()
    if vSERVER.CheckBooster() or vSERVER.CheckVip() then
        if not args[1] then
            TriggerEvent('Notify', 'aviso',
                'Você deve especificar se deseja equipar ou remover.<br><br> <componente> Opções:<br>- <b>equipar</b><br>- <b>remover</b>')
        else
            local arg = string.lower(args[1])
            local arma = GetSelectedPedWeapon(ped)
            local component = Config.componentMap[arma]

            if arg == 'equipar' then
                if component then
                    GiveWeaponComponentToPed(ped, arma, component)
                    TriggerEvent('Notify', 'sucesso', '<b>Silenciador</b> equipado.')
                else
                    TriggerEvent('Notify', 'aviso', 'Esta arma não suporta um silenciador.')
                end
            elseif arg == 'remover' then
                if component then
                    RemoveWeaponComponentFromPed(ped, arma, component)
                    TriggerEvent('Notify', 'sucesso', '<b>Silenciador</b> removido.')
                else
                    TriggerEvent('Notify', 'aviso', 'Esta arma não possui um silenciador.')
                end
            end
        end
    else
        TriggerEvent('Notify', 'negado', 'Você não tem permissão.')
    end
end)
