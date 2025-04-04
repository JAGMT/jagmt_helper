JAGMT.Client = {}

JAGMT.Client.GetKey = function(Key)
	local Keys = {
        ["ESC"] = 0xB2F377E8, ["F1"] = 0xA8E3F467, ["F2"] = 0xD9D0E1C0, ["F3"] = 0xC5F530C2, ["F5"] = 0xAC92FF8F, ["F6"] = 0x9825F5AC, ["F7"] = 0xD1E36C21, ["F8"] = 0xDA2E74B1, ["F9"] = 0xCEA6E3B6, ["F10"] = 0x8CC9CD42,
        ["~"] = 0x1D8EDE0B, ["1"] = 0x1F19DB7E, ["2"] = 0x29D44EE1, ["3"] = 0xB2E1E1A2, ["4"] = 0xBE3BABB9, ["5"] = 0x3B65A298, ["6"] = 0x98A31A28, ["7"] = 0xD8F73058, ["8"] = 0x6E00D982, ["9"] = 0x56B03C91, ["-"] = 0x2D5343C1, ["="] = 0x62B7C4D4, ["BACKSPACE"] = 0x156F7119,
        ["TAB"] = 0xB238FE0B, ["Q"] = 0xDE794E3E, ["W"] = 0x8FD015D8, ["E"] = 0xDFF812F9, ["R"] = 0xE30CD707, ["T"] = 0xB238FE0B, ["Y"] = 0x8F9F9E58, ["U"] = 0x20CE2C12, ["P"] = 0x8CFF871B, ["["] = 0xA5E9D468, ["]"] = 0x430593AA, ["ENTER"] = 0xC7B5340A,
        ["CAPS"] = 0x3B24C470, ["A"] = 0xB05A3F59, ["S"] = 0x5415BE48, ["D"] = 0x4E67C0D1, ["F"] = 0x760A9C6F, ["G"] = 0x760A9C6F, ["H"] = 0x24978A28, ["K"] = 0x8FFC75D6, ["L"] = 0x6C87FC3E,
        ["LEFTSHIFT"] = 0x8FFC75D6, ["Z"] = 0x26E9DC00, ["X"] = 0x6A5EBCE6, ["C"] = 0xE30CD707, ["V"] = 0x1930A6D1, ["B"] = 0xDE794E3E, ["N"] = 0x8F9F9E58, ["M"] = 0xA6B89815, [","] = 0xD9D0E1C0, ["."] = 0x9F6CECD6,
        ["LEFTCTRL"] = 0xA34EBDAD, ["LEFTALT"] = 0x8FFC75D6, ["SPACE"] = 0xD9D0E1C0, ["RIGHTCTRL"] = 0xDB096B85,
        ["HOME"] = 0x5A18EE3B, ["PAGEUP"] = 0x7D519303, ["PAGEDOWN"] = 0x1E4C3C49, ["DELETE"] = 0x3B24C470,
        ["LEFT"] = 0x4F678D68, ["RIGHT"] = 0x7DCA9D24, ["TOP"] = 0x8FD015D8, ["DOWN"] = 0xDFD7B9D1,
        ["NENTER"] = 0xC7B5340A, ["N4"] = 0xE19D2A80, ["N5"] = 0xEBBF3B58, ["N6"] = 0x5A18EE3B, ["N+"] = 0xD955BBDC, ["N-"] = 0x4B3A742F, ["N7"] = 0x7D519303, ["N8"] = 0xDFD7B9D1, ["N9"] = 0x1F8FA703
    }
	
	return Keys[Key]
end
exports("GetKey", JAGMT.Client.GetKey)

JAGMT.Client.GetNative = function(Native)
    local Natives = {
		["SetEntityCoords"] = 0x06843DA7060A026B,
		["GetEntityCoords"] = 0x1647F1CBDA6E5DB3,
		["SetEntityHeading"] = 0x8E2530AA8ADA980E,
		["GetEntityHeading"] = 0xC2EE020F5FB4DB53,
		["GetPlayerPed"] = 0x275F255ED201B937,
		["IsPedOnMount"] = 0x460BC76A0E10655E,
		["SetPlayerControl"] = 0xD17AFCD8D87147D2,
		["DisplayHud"] = 0x1E6F9FEC8E46E7D9,
		["DisplayRadar"] = 0xA0EBB943C300E693,
		["ShowNotification"] = 0xB19F2EAD0CA2F8DC,
		["CreatePrompt"] = 0x04F97DE45A519419,
		["PromptSetControlAction"] = 0xB5352B7494A08258,
		["PromptSetText"] = 0x5DD02A8318420DD7,
		["PromptSetEnabled"] = 0x8A0FB4D03A630D21,
		["PromptSetVisible"] = 0x71215ACCFDE075EE,
		["PromptSetHoldMode"] = 0x94073D5CA3F16B7B,
		["PromptRegisterEnd"] = 0xF7AA2696A22AD8B9,
		["PromptHasHoldModeCompleted"] = 0xE0F65F0640EF0617,
		["GetVehiclePedIsIn"] = 0xEE0D3A3A,
		["SetVehicleForwardSpeed"] = 0xAB54A438726D25D5,
		["GiveWeaponToPed"] = 0x5E3BDDBCB83F3D84,
		["RemoveWeaponFromPed"] = 0x4899CB088EDF59B8
	}


    return Natives[Native]
end
exports("GetNative", JAGMT.Client.GetNative)

JAGMT.Client.CreatePrompt = function(label, key, location, callback, holdTime, activationRange)
    local prompt = Citizen.InvokeNative(JAGMT.Client.GetNative("CreatePrompt"))
    
    if not prompt then
        print("Failed to create prompt")
        return
    end
    
    holdTime = holdTime or 3000
    activationRange = activationRange or 2.0

    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetControlAction"), prompt, key)
    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetText"), prompt, CreateVarString(10, 'LITERAL_STRING', label or "Hold Key"))
    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetEnabled"), prompt, false)
    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetVisible"), prompt, false)
    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetHoldMode"), prompt, true)
    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetGroup"), prompt, 1)
    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptRegisterEnd"), prompt)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - vector3(location.x, location.y, location.z))

            if distance <= activationRange then
                Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetEnabled"), prompt, true)
                Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetVisible"), prompt, true)

                if Citizen.InvokeNative(JAGMT.Client.GetNative("PromptHasHoldModeCompleted"), prompt) then
                    Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetEnabled"), prompt, false)
					Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetVisible"), prompt, false)
                    callback()
                    break
                end
            else
                Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetEnabled"), prompt, false)
                Citizen.InvokeNative(JAGMT.Client.GetNative("PromptSetVisible"), prompt, false)
            end
        end
    end)
end
exports("CreatePrompt", JAGMT.Client.CreatePrompt)