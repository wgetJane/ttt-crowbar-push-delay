local class = "weapon_zm_improvised"

local name, default, flags =
	"ttt_crowbar_push_delay", 0.5,
	FCVAR_ARCHIVE + FCVAR_NOTIFY

local function callback(name, old, new)
	local crowbar = weapons.GetStored(class)

	if not (crowbar and crowbar.Secondary) then
		return
	end

	local delay = tonumber(new) or tonumber(old) or default

	crowbar.Secondary.Delay = delay

	for _, v in pairs(ents.FindByClass(class)) do
		if v and v.Secondary then
			v.Secondary.Delay = delay
		end
	end
end

cvars.AddChangeCallback(name, callback)

callback(name, default, CreateConVar(name, default, flags):GetFloat())

ENT.Type = "point"
