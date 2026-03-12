local open = false
local object = nil

 
-- Utils
local function LoadDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
end

local function LoadProp(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
end

-- Toggle tablet & animation
local function ToggleTablet(state)
    local ped = PlayerPedId()
    open = state
    
    if state then
        LoadDict(anim)

        if not object then
            LoadProp(prop)

            local coords = GetEntityCoords(ped)
            local hand = GetPedBoneIndex(ped, bone)

            object = CreateObject(GetHashKey(prop), coords, 1, 1, 1)
            AttachEntityToEntity(object, ped, hand, 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end

        if not IsEntityPlayingAnim(ped, anim, 'base', 3) then
            TaskPlayAnim(ped, anim, 'base', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end

        SetNuiFocus(state, state)
        SendNUIMessage({ 
            action = 'open' 
        })
    else
        DeleteEntity(object)
        DetachEntity(object, 1, 1)
        ClearPedTasks(ped)

        SetNuiFocus(state, state)
        SendNUIMessage({ 
            action = 'close' 
        })
    end
end

-- Event for server-side
RegisterNetEvent('portJob-tablet:client:open', function()
    ToggleTablet(true)
end)



-- Close 
RegisterNUICallback('close', function(data, cb)
    ToggleTablet(false)
    cb('ok')
end)
