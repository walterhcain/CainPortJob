local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local port = 0
local working = false
local portCart = nil
local cartBlip = nil
local containers = {}
local container = 0
local containerFront = nil
local containerSide = nil
local containerBack = nil
local containerBlip = nil
local shadyContainer = nil
local stolen = false
local unionName = "None"
local object = nil
local anim = Config.AnimDict
local prop = Config.Prop
local bone = Config.Bone
local carGarageBlip = nil
local garageZone = nil
local xPlayer = GetPlayerPed(-1)
local garageCoords = nil
local shadyPed = nil
local shadyCoords = nil
local shadyItem = ""
local shadySpoken = false
local shadyCorrect = false
local pedSpawned = false
local retrievedStolen = false
local stolenHold = nil
local stolenTruck = nil
local russian = nil
local russianCoords = nil
local stolenDriver = nil
local stolenTrailer = nil


StartAnim = function(lib, anim)
RequestAnimDict(lib)
while not HasAnimDictLoaded(lib) do
    Wait(1)
end
TaskPlayAnim(PlayerPedId(), lib, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
end



local function unionFired()
    --Fire from union if under 0
end

local function triggerPortPolice()
    --Generic always changing police trigger
end

local function giveShipmentItem()
    --Fill out with potential shipmentItem
end

local function spawnRussianTruckDriver(spawn)

    Citizen.CreateThread(function()
        LoadDict(Config.RussianInfo.driverAnimDist)
        RequestModel(Config.RussianInfo.driverPed)
        while not HasModelLoaded(Config.RussianInfo.driverPed) do
            Wait(0)
        end
        stolenDriver = CreatePed(0, Config.RussianInfo.driverPed, spawn.driver.x, spawn.driver.y, spawn.driver.z, spawn.driver.w, false, true)
        FreezeEntityPosition(stolenDriver, true)
        SetEntityInvincible(stolenDriver, true)
        SetBlockingOfNonTemporaryEvents(stolenDriver, true)
        TaskStartScenarioInPlace(stolenDriver, 'WORLD_HUMAN_AA_SMOKE', 0, true)

        local truckHash = GetHashKey(Config.RussianInfo.truckModel)
        RequestModel(truckHash)
        while not HasModelLoaded(truckHash) do
            Wait(1)
        end
        print("truck model loaded")
        stolenTruck = CreateVehicle(truckHash, spawn.truck.x, spawn.truck.y, spawn.truck.z, spawn.truck.w, true, true)
        while not DoesEntityExist(stolenTruck) do
            Wait(0)
        end
        print("entity exists")
        if not NetworkGetEntityIsNetworked(stolenTruck) then
            NetworkRegisterEntityAsNetworked(stolenTruck)
        end
        SetEntityAsMissionEntity(stolenTruck, true, true)
        SetEntityHeading(stolenTruck, spawn.truck.w)
        SetVehicleEngineOn(stolenTruck, false, false)
        SetVehicleOnGroundProperly(stolenTruck)
        SetVehicleDoorsLocked(stolenTruck, 2)
        local vehicleplate = "PORT" .. tostring(math.random(1000, 9999))
        SetVehicleNumberPlateText(stolenTruck, vehicleplate)
        TriggerServerEvent('cain-policejob:server:setVehicleAsStolen', vehicleplate)
        --SetVehicleIsStolen(stolenTruck, true)

        local trailerHash = GetHashKey(Config.RussianInfo.trailerModel)
        RequestModel(trailerHash)
        while not HasModelLoaded(trailerHash) do
            Wait(1)
        end
        stolenTrailer = CreateVehicle(trailerHash ,spawn.truck.x,spawn.truck.y,spawn.truck.z , spawn.truck.w, true, false)
	    AttachVehicleToTrailer(stolenTruck, stolenTrailer, 1.1)

    end)

end

local function setupRussianZone()
    local russianSpawn = Config.RussianSpawns[math.random(1,#Config.RussianSpawns)]
    russianCoords = russianSpawn.russian
    spawnRussianTruckDriver(russianSpawn)
    RequestAnimDict(Config.RussianInfo.animDist)
    RequestModel(Config.RussianInfo.ped)

    while not HasAnimDictLoaded(Config.RussianInfo.animDist) do
        Wait(0)
    end
    while not HasModelLoaded(Config.RussianInfo.ped) do
        Wait(0)
    end


	Citizen.CreateThread(function()
		local ped = PlayerPedId()
		russian = exports['rep-talkNPC']:CreateNPC({
			npc = Config.RussianInfo.ped,
			coords = russianSpawn.russian,
			heading = russianSpawn.russian.w,
			name = Config.RussianInfo.name,
            animName = "mini@strip_club@idles@bouncer@base", --Config.RussianInfo.animName,
			animDist = "base", --Config.RussianInfo.animDist,
			tag = Config.RussianInfo.tag,
			color = Config.RussianInfo.tagcolor,
			startMSG = 'Ah yes, you are the one that retrieved our shipment for us.'
		}, {
			[1] = {
				label = "I am.",
				shouldClose = false,
				action = function()
                    if retrievedStolen == false then
                        exports['rep-talkNPC']:changeDialog('Good, good.' , {
                        [1] = {
                                label =  "Your man at the docks said you had something for me?",
                                shouldClose = false,
                                action = function()
                                    --Give money
                                    retrievedStolen = true
                                    local payment = math.random(Config.RussianPaymentMin, Config.RussianPaymentMax)
                                    TriggerServerEvent('cain-portjob:server:AddItem', 'cash', payment)
                                    giveShipmentItem()
                                    exports['rep-talkNPC']:changeDialog("Yes, I have been told you have done good work. Here is something as a thank you. Come see me again sometime.", {
                                        [1] = {
                                            label =  "I will.",
                                            shouldClose = true,
                                            action = function()
                                            end
                                        },
                                        [2] = {
                                            label = "I'll think about it.",
                                            shouldClose = true,
                                            action = function()
                                            end
                                         }
                                    })
                                end
                        },
                        [2] = {
                            label = "Who are you?",
                            shouldClose = false,
                            action = function()
                                exports['rep-talkNPC']:changeDialog('People call me "The Russian". Outside of that, it is none of your concern.' , {
                                    [1] = {
                                        label =  "Your man at the docks said you had something for me?",
                                        shouldClose = false,
                                        action = function()
                                            --Give money
                                            retrievedStolen = true
                                            local payment = math.random(Config.RussianPaymentMin, Config.RussianPaymentMax)
                                            TriggerServerEvent('cain-portjob:server:AddItem', 'cash', payment)
                                            giveShipmentItem()
                                            exports['rep-talkNPC']:changeDialog("Yes, I have been told you have done good work. Come see me again sometime.", {
                                                [1] = {
                                                    label =  "I will.",
                                                    shouldClose = true,
                                                    action = function()
                                                    end
                                                },
                                                [2] = {
                                                    label = "I'll think about it.",
                                                    shouldClose = true,
                                                    action = function()
                                                    end
                                                }
                                            })
                                        end
                                    },
                                    [2] = {
                                        label = "I'll think about it.",
                                        shouldClose = true,
                                        action = function()
                                        end
                                    }
                                })
                            end
                        },
                        [3] = {
                            label = "I'll come back later.",
                            shouldClose = true,
                            action = function()
                            end
                        },
                
                        })
                    else
                        exports['rep-talkNPC']:changeDialog("Well, come back for me again at some point if you need the work.", {
                            [1] = {
                                label =  "I will.",
                                shouldClose = true,
                                action = function()
                                end
                            },
                            [2] = {
                                label = "I'll think about it.",
                                shouldClose = true,
                                action = function()
                                end
                            }
                        })
                    end
	            end
            }
        })
    end)
end


local function sendShadyContainer()
    TriggerServerEvent('cain-portjob:server:updatePortRep', -Config.NegativeRep, unionName)

    triggerPortPolice()

    --if rep is less than 0, fire
    
    --Setup zone
    setupRussianZone()

    Wait(Config.ShadyWait)
    if stolenHold then
        
        --Send email
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "The Russian",
            subject = "Shopping List",
            message = "Come get the groceries from the car.",
            button = {
                enabled = true,
                buttonEvent = "cain-missions:client:setWaypoint",
                buttonData = russianCoords
            }
        })
    end
    --Wait
end

local function resetShady()
    if shadyContainer then 
        shadyContainer = nil
    end
    stolen = false
    if shadyPed then
        --DeleteEntity(shadyPed)
        DeletePed(shadyPed)
        shadyPed = nil
    end
    if stolenDriver then
        DeletePed(stolenDriver)
        stolenDriver = nil
    end
    if russian then
        DeletePed(russian)
        russian = nil
    end
    if stolenTruck then
        DeleteVehicle(stolenTruck)
        stolenTruck = nil
    end
    if stolenHold then
        stolenHold = nil
    end
    if stolenTrailer then
        DeleteVehicle(stolenTrailer)
        stolenTrailer = nil
    end
    shadyCoords = nil
    shadyItem = ""
    shadySpoken = false
    shadyCorrect = false
    retrievedStolen = false
    russianCoords = nil
end

local function spawnShadyMan()
    
    shadyCoords = Config.ShadySpawns[port][math.random(1,#Config.ShadySpawns[port])]
    --Create Ped
    
    print("shadySpawning")
    LoadDict(Config.ShadyMan.animDist)
    print("animLoaded")
    RequestModel(Config.ShadyMan.ped)
    while not HasModelLoaded(Config.ShadyMan.ped) do
        Wait(1)
    end
    print("modelSpawned")

	Citizen.CreateThread(function()
		local ped = PlayerPedId()
		shadyPed = exports['rep-talkNPC']:CreateNPC({
			npc = Config.ShadyMan.ped,
			coords = shadyCoords,
			heading = shadyCoords.w,
			name = Config.ShadyMan.name,
			animName = "mini@strip_club@idles@bouncer@base", --Config.ShadyMan.animName,
			animDist = "base",--.ShadyMan.animDist,
			tag = Config.ShadyMan.tag,
			color = Config.ShadyMan.tagcolor,
			startMSG = 'Hey, you workin a shift today, pal?'
		}, {
			[1] = {
				label = "Yeah, what do you need?",
				shouldClose = false,
				action = function()
                    --Check if shadyContainer
                    if shadyContainer then
                        local origin = shadyContainer.origin
                        local manifest = shadyItem

                        if shadySpoken == false then
				            exports['rep-talkNPC']:changeDialog("I got a hookup with some guys downtown. We need a container 'lost' for us.", {
                            [1] = {
                                label =  "How would I do that?",
                                shouldClose = false,
                                action = function()
                                    
                                    exports['rep-talkNPC']:changeDialog("I'll give you some info about the shipment and I'll need you to give me the barcode and bay number. After that, I'll send the info to my driver and send you details of where to meet.", {
                                        [1] = {
                                            label =  "Alright. Give me the info.",
                                            shouldClose = false,
                                            action = function()
                                                shadySpoken = true
                                                exports['rep-talkNPC']:changeDialog("My guy is looking for a shipment that has "..manifest..". He says it's coming from "..origin..". Remember, it's important that you don't register the container into the database or else we can't take it.", {
                                                    [1] = {
                                                        label =  "Alright, I'll come back with the info.",
                                                        shouldClose = true,
                                                        action = function()
                                                        end
                                                    },
                                                    [2] = {
                                                        label = "I'll think about it.",
                                                        shouldClose = true,
                                                        action = function()
                                                        end
                                                    }
                                                })
                                            end
                                        },
                                        [2] = {
                                            label = "I'll think about it.",
                                            shouldClose = true,
                                            action = function()
                                            end
                                        }
                                    })
                                end
                            },
                            [2] = {
                                label = "See you later.",
                                shouldClose = true,
                                action = function()
                                end
                            }
                        })
                        else
                            exports['rep-talkNPC']:changeDialog("You have the shipment info? Remember, we're looking for a shipment with "..manifest.." and originating from "..origin..".", {
                                [1] = {
                                    label =  "Yeah, I have the info.",
                                    shouldClose = false,
                                    action = function()
                                        exports['rep-talkNPC']:changeDialog("Oh yeah? Give it here then.", {
                                            [1] = {
                                                label =  "Alright, here you go.",
                                                shouldClose = false,
                                                action = function()
                                                    
                                                    
                                                    TriggerEvent('rep-talkNPC:client:close')
                                                    local input = exports['qb-input']:ShowInput({ 
                                                        header = "Give Container Information", 
                                                        submitText = "Submit", 
                                                        inputs = {
                                                            {
                                                                text = "Barcode #", -- text you want to be displayed as a place holder
                                                                name = "barcode", -- name of the input should be unique otherwise it might override
                                                                type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                                                                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                                                                -- default = 1, -- Default number option, this is optional
                                                            },
                                                            {
                                                                text = "Bay #", -- text you want to be displayed as a place holder
                                                                name = "bay", -- name of the input should be unique otherwise it might override
                                                                type = "text", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                                                                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                                                                -- default = 1, -- Default number option, this is optional
                                                            },
                                                        },
                                                    })
                                                    if input then 
                                                        local bar = not input.barcode and 0 or tostring(input.barcode)
                                                        local bay = not input.bay and 0 or tostring(input.bay)
                                                        if bar == shadyContainer.barcode and string.lower(bay) == string.lower(shadyContainer.bay) then
                                                            stolenHold = shadyContainer
                                                            shadyContainer = nil
                                                            shadyCorrect = true
                                                            resetContainer()
                                                            sendShadyContainer()
                                                            
                                                        else
                                                            shadyContainer = nil
                                                            shadyCorrect = false
                                                        end
                                                        
                                                    end
                                                    
                                                    
                                                end
                                            },
                                            [2] = {
                                                label = "On second though, I'll go double check these.",
                                                shouldClose = true,
                                                action = function()
                                                end
                                            }
                                        })
                                    end
                                },
                                [2] = {
                                    label = "Not yet, I'll come back.",
                                    shouldClose = true,
                                    action = function()
                                    end
                                }
                            })
                        end
                    else
                        if shadySpoken == false then
                            exports['rep-talkNPC']:changeDialog("Ah, well I had some work  you but looks like it's too late. Come find me at the start of your shift next time.", {
                                [1] = {
                                    label = "Alright, never mind",
                                    shouldClose = true,
                                    action = function()
                                    end
                                },
                                [2] = {
                                    label = "See you later.",
                                    shouldClose = true,
                                    action = function()
                                    end
                                }
                            })
                        else
                            if shadyCorrect == true then
                                exports['rep-talkNPC']:changeDialog("Good work, the info you gave should be the right one. Don't finish your shift just yet. Wait for us to contact you and meet the truck.", {
                                    [1] = {
                                        label = "Alright, will do.",
                                        shouldClose = true,
                                        action = function()
                                        end
                                    },
                                    [2] = {
                                        label = "Goodbye.",
                                        shouldClose = true,
                                        action = function()
                                        end
                                    }
                                })
                            
                            else
                                exports['rep-talkNPC']:changeDialog("You idiot...you got the wrong container info. If I ever ask you to work with me again, make sure you get the right one.", {
                                    [1] = {
                                        label = "Sorry about that...",
                                        shouldClose = true,
                                        action = function()
                                        end
                                    },
                                })
                            end
                        end
                    end
				end
			},
			[2] = {
				label = "See you later!",
				shouldClose = true,
				action = function()
				end
			},
		})
	end)
end

local function chooseShadyContainer()
    local shade = math.random(1,#containers)
    shadyContainer = containers[shade]
    shadyItem = shadyContainer.cargo[math.random(1,#shadyContainer.cargo)]
    spawnShadyMan()
end

local function getCargo()
    return Config.Cargo[math.random(1, #Config.Cargo)]
end

local function getOrigin()
    return Config.Cities[math.random(1, #Config.Cities)]
end

local function getBarcode()
    return tostring(math.random(100000,999999))
end

local function getDamaged()
    local bool = math.random(1,2)
    return bool == 1 or false
end

local function inspectDamage(area)
    if area == "front" then
        return containers[container].frontDamage
    elseif area == "back" then
        return containers[container].backDamage
    else
        return containers[container].sideDamage
    end
end

local function scanBarcode()
    --Show barcode
    if QBCore.Functions.HasItem('porttablet') then
        ToggleScan(true, "barcode")
    else
        QBCore.Functions.Notify("You need your Port Tablet to scan the barcode.", "error")
    end
end

function pickNewContainer()
    local num = math.random(1, #containers)
    container = num
    local con = containers[num]
    local blip = AddBlipForCoord(containers[num].front.x, containers[num].front.y, containers[num].front.z)
    SetBlipSprite(blip, 306)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 20)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Undocumented Container")
    EndTextCommandSetBlipName(blip)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, 16)
    containerBlip = blip

    containerFront = exports['qb-target']:AddBoxZone("containerFront"..PlayerData.citizenid, vector3(containers[container].front.x, containers[container].front.y, containers[container].front.z), 1.0, 2.0, { 
		name = "containerFront"..PlayerData.citizenid, 
		heading = containers[container].front.w, 
		debugPoly = false,
		minZ = containers[container].front.z-0.55, 
		maxZ = containers[container].front.z + 2.0
	    }, {
		    options = {
		        {
			        label = 'Scan Barcode',
			        icon = 'fa-solid fa-barcode',
			        action = function(entity)
				    --Scan Barcode
                    scanBarcode()
			        end,
			        canInteract = function()
				        return true
			        end,
		        },
                {
			        label = 'Inspect Front',
                    num = 2,
			        icon = 'fa-solid fa-magnifying-glass',
			        action = function(entity)
				        --Inspect Front
                        local damage = inspectDamage("front")
                        if damage then
                            QBCore.Functions.Notify("The front of the container is dented.", "error")
                        else
                            QBCore.Functions.Notify("There is no visible damage.", "success")
                        end
			        end,
			        canInteract = function()
				        return true
			        end,
		        }
		    },
		distance = 2.0,
	})
    if containers[container].side then
        containerSide =  exports['qb-target']:AddBoxZone("containerSide"..PlayerData.citizenid, vector3(containers[container].side.x, containers[container].side.y, containers[container].side.z), 1.0, 9.0, { 
		name = "containerSide"..PlayerData.citizenid, 
		heading = containers[container].side.w, 
		debugPoly = false,
		minZ = containers[container].side.z-0.55, 
		maxZ = containers[container].side.z+2.0
	    }, {
		    options = {
		        {
			        label = 'Inspect Side',
			        icon = 'fa-solid fa-magnifying-glass',
			        action = function(entity)
				        --Inspect Side
                        local damage = inspectDamage("side")
                        if damage then
                            QBCore.Functions.Notify("The side of the container is dented.", "error")
                        else
                            QBCore.Functions.Notify("There is no visible damage.", "success")
                        end

			        end,
			        canInteract = function()
				        return true
			        end,
		        }
		    },
		distance = 2.0,
	    })
    end
    containerBack = exports['qb-target']:AddBoxZone("containerBack"..PlayerData.citizenid, vector3(containers[container].back.x, containers[container].back.y, containers[container].back.z), 1.0, 2.0, { 
		name = "containerBack"..PlayerData.citizenid, 
		heading = containers[container].back.w, 
		debugPoly = false,
		minZ = containers[container].back.z-0.55, 
		maxZ = containers[container].back.z + 2.0
	    }, {
		    options = {
		        {
			        label = 'Inspect Back',
			        icon = 'fa-solid fa-magnifying-glass',
			        action = function(entity)
				        --Inspect Back
                        local damage = inspectDamage("back")
                        if damage then
                            QBCore.Functions.Notify("The back of the container is dented.", "error")
                        else
                            QBCore.Functions.Notify("There is no visible damage.", "success")
                        end
			        end,
			        canInteract = function()
				        return true
			        end,
		        }
		    },
		distance = 2.0,
	})
end



function resetContainer()
    if containerFront then
        exports['qb-target']:RemoveZone("containerFront"..PlayerData.citizenid)
        --containerFront:destroy()
    end
    if containerSide then
        exports['qb-target']:RemoveZone("containerSide"..PlayerData.citizenid)
        --containerSide:destroy()
    end
    if containerBack then
        exports['qb-target']:RemoveZone("containerBack"..PlayerData.citizenid)
        --containerBack:destroy()
    end
    if containerBlip then
        RemoveBlip(containerBlip)
        containerBlip = nil
    end
    if containers[container] == shadyContainer then
        shadyContainer = nil
    end
    table.remove(containers, container)
    container = 0

    if #containers > 0 then
        pickNewContainer()
        Notificacion(tostring(#containers)..Config.Locales["newContainer"], -1)
        
    else
        --Open Garage
        beginEndJob()
    end
end




local function grabContainers(numPort)
    local count = Config.ContainerNum
    local tempContainers = {}
    for _,v in pairs(Config.Ports[numPort]) do
        local num = math.random(1, #Config.Ports[numPort])
        if not tempContainers[Config.Ports[numPort][num]] then
            tempCon = Config.Ports[numPort][num]
            tempCon.cargo = getCargo()
            tempCon.origin = getOrigin()
            tempCon.barcode = getBarcode()
            tempCon.frontDamage = getDamaged()
            tempCon.backDamage = getDamaged()
            if tempCon.side then
                tempCon.sideDamage = getDamaged()
            end
            table.insert(tempContainers, tempCon)
            count = count-1
        end
        if count <= 0 then
            containers = tempContainers
            while #containers ~= Config.ContainerNum do
                Wait(1)
            end
            chooseShadyContainer()
            break;
        end
    end
    pickNewContainer()
end

local function spawnJobCar()
    local cartHash = GetHashKey(Config.Car.model)
    RequestModel(cartHash)
    while not HasModelLoaded(cartHash) do
        Wait(0)
    end
    local union = QBCore.Functions.GetPlayerData().unions.name
    unionName = union
    local spawn
    if union == "electrical" then
        spawn = Config.GarageSpawns["electric"]
        garageCoords = Config.GarageSpawns["electric"]
    elseif union == "construction" then
        spawn = Config.GarageSpawns["construction"]
        garageCoords = Config.GarageSpawns["construction"]
    elseif union == "port" then
        spawn = Config.GarageSpawns["port"]
        garageCoords = Config.GarageSpawns["port"]
    elseif union == "garbage" then
        spawn = Config.GarageSpawns["garbage"]
        garageCoords = Config.GarageSpawns["garbage"]
    else
        print("Error: Shouldn't have this.")
        unionName = "none"
        return
    end

    unionName = union
    portCart = CreateVehicle(cartHash, spawn.x, spawn.y, spawn.z, spawn.w, true, true)
    local plate = Config.Car.plate..tostring(math.random(1000,9999))
        
    SetVehicleNumberPlateText(portCart, plate)
    while GetVehicleNumberPlateText(portCart) ~= plate do
        Wait(0)
    end
    print(GetVehicleNumberPlateText(portCart))
    TriggerServerEvent('qb-vehiclekeys:server:GiveTempKey', GetVehicleNumberPlateText(portCart))
    --SetVehicleLivery(veh, Config.Car.livery)
    local blip = AddBlipForEntity(portCart)
    SetBlipSprite(blip, 225)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 18)
    SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Dock Cart")
    EndTextCommandSetBlipName(blip)
    cartBlip = blip
    Notificacion(Config.Locales["jobStarted"], -1)
end

local function ChangeClothes()
    local gender = QBCore.Functions.GetPlayerData().charinfo.gender
    if gender == 0 then
        TriggerEvent('qb-clothing:client:loadOutfit', Config.PortUniforms.male)
    else
        TriggerEvent('qb-clothing:client:loadOutfit', Config.PortUniforms.female)
    end
end

local function startJob()
    if working == false then
		working = true
        port = math.random(1,2)
        ChangeClothes()
        spawnJobCar()
        grabContainers(port)
        if QBCore.Functions.HasItem('porttablet') == false then
            TriggerServerEvent('cain-portjob:server:AddItem', 'porttablet', 1)
            QBCore.Functions.Notify("Port Tablet received. Use it to register the containers.", "success")
        else
            QBCore.Functions.Notify("Use your Port Tablet to register the containers.", "success")
        end
    else
        Notificacion(Config.Locales["stillActive"], -1)
    end
end

local function GetClothes()
    TriggerServerEvent('cain-unions:loadPlayerSkin') 
end

local function endJob()
    GetClothes()
    if working == true then
        if QBCore.Functions.HasItem('porttablet') == true then
            TriggerServerEvent('cain-portjob:server:RemoveItem', 'porttablet', 1)
            QBCore.Functions.Notify("Port Tablet returned. Get another during your next shift.", "success")
        end
    end
    working = false
    ClearAllBlipRoutes()
    port = 0

    if portCart then
        DeleteVehicle(portCart)
        portCart = nil
    end

    containers = {}
    container = 0
    if containerFront then
        exports['qb-target']:RemoveZone("containerFront"..PlayerData.citizenid)
        --containerFront:destroy()
        containerFront = nil
    end

    if containerSide then
        exports['qb-target']:RemoveZone("containerSide"..PlayerData.citizenid)
        --containerSide:destroy()
        containerSide = nil
    end

    if containerBack then
        exports['qb-target']:RemoveZone("containerBack"..PlayerData.citizenid)
        --containerBack:destroy()
        containerSide = nil
    end

    if containerBlip then
        RemoveBlip(containerBlip)
        containerBlip = nil
    end
    
    unionName = "None"

    if object then
        DeleteEntity(object)
        DetachEntity(object, 1, 1)
        object = nil
    end

    if garageZone then
        exports['qb-target']:RemoveZone("unionGarage"..PlayerData.citizenid)
        --garageZone:destroy()
        garageZone = nil
    end
    if carGarageBlip then
        RemoveBlip(carGarageBlip)
        carGarageBlip = nil
    end
    if cartBlip then
        RemoveBlip(cartBlip)
        cartBlip = nil
    end
    garageCoords = nil
    resetShady()
    
end







function Notificacion(text, time)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, time)
end

function createGarageBlip(spawn)
    Citizen.CreateThread(function()
        local blip = AddBlipForCoord(spawn.x,spawn.y, spawn.z)
        SetBlipSprite(blip, 357)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.9)
        SetBlipColour(blip, 3)
        SetBlipAsShortRange(blip, true)
	    BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Return Cart")
        EndTextCommandSetBlipName(blip)
        carGarageBlip = blip
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, 32)
    end)
end

local function CheckForUnionGarageKeypress()
    if working and portCart then
        CreateThread(function()
            while carGarageBlip do
                if IsControlJustReleased(0, 38) then
                    if GetVehiclePedIsIn(GetPlayerPed(-1), false) == portCart then
                        TaskLeaveVehicle(GetPlayerPed(-1), portCart, 0)
                        TaskTurnPedToFaceEntity(GetPlayerPed(-1), portCart)
                        
                        endJob()
                        Notificacion(Config.Locales["jobEnded"], 2000)
                    end
                end
                Wait(0)
            end
        end)
    end
end

function beginEndJob()
    createGarageBlip(garageCoords)
    Notificacion(Config.Locales["returnVan"], -1)
    --Create garage

    garageZone = BoxZone:Create(garageCoords, 10, 10, {
        name = "unionGarage"..PlayerData.citizenid,
        debugPoly = false,
        heading = garageCoords.w,
        minZ = garageCoords.z - 3.0,
        maxZ = garageCoords.z + 3.0
    })
    garageZone:onPlayerInOut(function(isPointInside, _)
        if isPointInside then
            local ped = PlayerPedId()
            if GetVehiclePedIsIn(ped, false) == portCart then
                Notificacion(Config.Locales["endjob"], -1)
                CheckForUnionGarageKeypress()
            end
        else
        end
    end)
end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    endJob()
end)



AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    local ped = PlayerPedId()
    DeleteEntity(object)
    DetachEntity(object, 1, 1)
    ClearPedTasks(ped)
    endJob()
end)



RegisterNetEvent('cain-unions:startPortWork', function()
    TriggerServerEvent('cain-unions:server:startPort')
    startJob()
end)

RegisterNetEvent('cain-unions:client:finishPort', function()
    endJob()
end)

-- Utils
function LoadDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
end

function LoadProp(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
end

function ToggleScan(state, screen)
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
        if container ~= 0 then
            SendNUIMessage({ 
                action = 'open',
                page = screen,
                barcode = containers[container].barcode,
                origin = containers[container].origin,
                manifest = containers[container].cargo,
                frontDamage = containers[container].frontDamage,
                sideDamage = containers[container].sideDamage,
                backDamage = containers[container].backDamage,
                bay = containers[container].bay,
            })
        else
            SendNUIMessage({ 
                action = 'open',
                page = screen,
            })
        end
        
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

RegisterNetEvent('cain-portjob:client:openPortTablet', function()
    if working and working == true then
        ToggleScan(true, "submitmenu")
    else
        ToggleScan(true, "login")
    end
end)

RegisterNUICallback('close', function(data, cb)
    ToggleScan(false, "placeholder")
    cb('ok')
end)

RegisterNUICallback('wrongBar', function(data, cb)
    QBCore.Functions.Notify('Unknown barcode!', "error")
    cb('ok')
end)

local function removeUnionDues(num)
    local union = unionName
    --Add to Union account
end

RegisterNUICallback('registerContainer', function(data, cb)
    ToggleScan(false)

    local rep = Config.DefaultRep
    local payment = Config.Pay
    if unionName == "port" then
        rep = rep + Config.PortRepBonus
        payment = payment + Config.PayBonus
    end
    
    payment = payment - Config.UnionDues
    removeUnionDues(Config.UnionDues)

    if data.barcode ~= containers[container].barcode then
        rep = 0
        payment = payment - 2
        QBCore.Functions.Notify("Your pay was reduced for incorrect barcode.", "error")
    end
    if string.lower(data.bay) ~= string.lower(containers[container].bay) then 
        rep = 0
        payment = payment - 2
        QBCore.Functions.Notify("Your pay was reduced for incorrect bay.", "error")
    end
    local wrongDamage = false
    if data.front ~= containers[container].frontDamage then 
        rep = 0
        payment = payment - 2
        wrongDamage = true
    end
    if data.back ~= containers[container].backDamage then 
        rep = 0
        payment = payment - 2
        wrongDamage = true
    end
    if containers[container].sideDamage then
        if data.side ~= containers[container].sideDamage then 
            rep = 0
            payment = payment - 2
            wrongDamage = true
        end
    end
    if wrongDamage == true then
        QBCore.Functions.Notify("Your pay was reduced for failed damage inspection.", "error")
    end

    --AddRep
    TriggerServerEvent('cain-portjob:server:updatePortRep', rep, unionName)
    --AddMoney
    TriggerServerEvent('cain-portjob:server:payForJob', payment)
    --GetNewPole
    resetContainer()
    cb('ok')
end)