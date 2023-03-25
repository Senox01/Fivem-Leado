--ESX Import
ESX = exports['es_extended']:getSharedObject()

local display = false

--árak

--pozició
local pos = vector3(1793.3, 4589.9, 37.68)

--nui

RegisterNUICallback("exit", function()
    SetDisplay(false)
    back()
  end)
  
  RegisterNUICallback("main", function(data)
    print(data.text)
    SetDisplay(false)
  end)
  
  RegisterNUICallback("error", function(data)
    print(data.error)
    SetDisplay(false)
  end)
  
  function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
      type = "ui",
      status = bool,
    })
  end

  
  function showinteraction(msgtxt)
    SetTextFont(0)
    SetTextProportional(2)
    SetTextScale(0.0, 0.4)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(msgtxt)
    DrawText(0.350, 0.840)
    DrawRect(0.484, 0.856,0.39,0.04,30,30,30,200) --hátér 
end

  AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        CreateThread(function()
            local coords = vector3(pos.x, pos.y, pos.z-1)
            local model = "s_m_y_sheriff_01"
            RequestCollisionAtCoord(coords)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(50)
            end
            alapped = CreatePed('CIVMALE', model, coords, 202.0, true, true)
            CreateThread(function()
                while true do
                    FreezeEntityPosition(alapped, true)
                    SetEntityInvincible(alapped, true)
                    SetBlockingOfNonTemporaryEvents(alapped, true)
                    if GetDistanceBetweenCoords( pos.x, pos.y, pos.z, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
                      Draw3DText( pos.x, pos.y, pos.z -0.9, "~g~[NPC] ~w~Leadó", 4, 0.1, 0.1)
                    end
                 Wait(1)
                end
            end)
        end)
    end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
  local scale = (1/dist)*20
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov   
  SetTextScale(scaleX*scale, scaleY*scale)
  SetTextFont(fontId)
  SetTextProportional(1)
  SetTextColour(250, 250, 250, 255)		-- You can change the text color here
  SetTextDropshadow(1, 1, 1, 1, 255)
  SetTextEdge(2, 0, 0, 0, 150)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(textInput)
  SetDrawOrigin(x,y,z+2, 0)
  DrawText(0.0, 0.0)
  ClearDrawOrigin()
 end


  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local ped = GetPlayerPed(GetPlayerFromServerId(playerid))
      local pos = GetEntityCoords(ped, true)
      local TargetEntityPos = vector3(1793.3, 4589.9, 37.68)
      local distance = #(TargetEntityPos - pos)
      print(distance)
      if distance <= 2 then
        showinteraction("Nyomd meg az ~g~[E]~w~ betüt a menü megnyitásához.")
        if IsControlJustPressed(0, 38) then
          SetDisplay(not display)
        end
      end
    end
  end)

  local wood = 5
  local coal = 15
  local stone = 10
  local gold = 100
  local iron = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SendNUIMessage({
            action = 'show',
            wood = wood,
            stone = stone,
            coal = coal,
            iron = iron,
            gold = gold
        })
    end
end)

--blip
Citizen.CreateThread(function()
  
      blip = AddBlipForCoord(pos)
      SetBlipSprite(blip, 197)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 0.7)
      SetBlipColour(blip, 2)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Leadó")
      EndTextCommandSetBlipName(blip)
   end)

--chat üzenetek
function notify(prefix, text)
    TriggerEvent('chat:addMessage', {
        color = { 124,197,118},
        multiline = true,
        args = {"["..prefix.."]", text}
      })
end

RegisterNUICallback("buy-1", function()
  TriggerServerEvent('vl_leado:buyWood')
  notify("VLRP - Leadó", "Vedtél egy Fá-t, ára: "..wood.."$")
end)

RegisterNUICallback("sell-1", function()
  TriggerServerEvent('vl_leado:sellWood')
  notify("VLRP - Leadó", "Eladtál egy Fá-t, ára: "..wood.."$")
end)

RegisterNUICallback("buy-2", function()
  TriggerServerEvent('vl_leado:buyStone')
  notify("VLRP - Leadó", "Vedtél egy Kő-vet, ára: "..stone.."$")
end)

RegisterNUICallback("sell-2", function()
  TriggerServerEvent('vl_leado:sellStone')
  notify("VLRP - Leadó", "Eladtál egy Kő-vet, ára: "..stone.."$")
end)

RegisterNUICallback("buy-3", function()
  TriggerServerEvent('vl_leado:buyCoal')
  notify("VLRP - Leadó", "Vedtél egy Szen-et, ára: "..coal.."$")
end)

RegisterNUICallback("sell-3", function()
  TriggerServerEvent('vl_leado:sellCoal')
  notify("VLRP - Leadó", "Eladtál egy Szen-et, ára: "..coal.."$")
end)

RegisterNUICallback("buy-4", function()
  TriggerServerEvent('vl_leado:buyIron')
  notify("VLRP - Leadó", "Vedtél egy Vas-at, ára: "..iron.."$")
end)

RegisterNUICallback("sell-4", function()
  TriggerServerEvent('vl_leado:sellIron')
  notify("VLRP - Leadó", "Eladtál egy Vas-at, ára: "..iron.."$")
end)

RegisterNUICallback("buy-5", function()
  TriggerServerEvent('vl_leado:buyGold')
  notify("VLRP - Leadó", "Vedtél egy Arany-at, ára: "..gold.."$")
end)

RegisterNUICallback("sell-5", function()
  TriggerServerEvent('vl_leado:sellGold')
  notify("VLRP - Leadó", "Eladtál egy Arany-at, ára: "..gold.."$")
end)