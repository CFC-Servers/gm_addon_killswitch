Killswitch = {}
local KS = Killswitch

function KS:MakeConvarName( name )
    return "killswitch_disable_" .. name
end

if CLIENT then
    function KS.CreateConvar( name, description )
        name = KS:MakeConvarName( name )
        return CreateClientConVar( name, 0, true, true, description, 0, 1 )
    end
end

-- Load Modules
-- TODO: Make an autoloader

if SERVER then
    AddCSLuaFile( "modules/pac3/pac3.lua" )
end

if CLIENT then
    include( "modules/pac3/pac3.lua" )
end
