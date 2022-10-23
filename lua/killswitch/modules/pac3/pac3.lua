local KS = Killswitch

KS.PAC3 = {
    originalReceivers = {},
    convar = KS.CreateConvar( "pac3", "Completely Disable PAC3" ),
}

local pacPrefixes = {
    ["pac_"] = true,
    ["pacx"] = true,
    ["pace"] = true,
    ["pac3"] = true
}

local function isPac( name )
    return pacPrefixes[string.sub( name, 1, 4 )]
end

function KS.PAC3.Disable()
    RunConsoleCommand( "pac_panic" )

    for name, func in pairs( net.Receivers ) do
        if isPac( name ) then
            KS.PAC3.originalReceivers[name] = func
            net.Receivers[name] = KS.stub
        end
    end
end

function KS.PAC3.Enable()
    for name in pairs( net.Receivers ) do
        if KS.PAC3.originalReceivers[name] then
            net.Receivers[name] = KS.PAC3.originalReceivers[name]
        end
    end
end
