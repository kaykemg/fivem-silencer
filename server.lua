local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("weapon_silencer", src)

function src.CheckVip()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "investidorplus.permissao") or vRP.hasPermission(user_id, "admin.permissao") then
			return true
		end
	else
		return false
	end
end

function src.CheckBooster()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "booster.permissao") then
			return true
		end
	end
end
