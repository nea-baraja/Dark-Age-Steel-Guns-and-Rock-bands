
ExposedMembers.GameEvents = GameEvents
ExposedMembers.DA = ExposedMembers.DA or {};
ExposedMembers.DA.Utils = ExposedMembers.DA.Utils or {};
Utils = ExposedMembers.DA.Utils;
GameEvents.SetPlotProperty.Add(function(plotID, key, value)
    local plot = Map.GetPlotByIndex(plotID)
  --  print(plot:GetX(), plot:GetY(), plot)
    plot:SetProperty(key, value)
end)

GameEvents.GetGameProperty.Add(function(key)
    return Game.GetProperty(key)
end)

GameEvents.SetGameProperty.Add(function(key, value)
    Game.SetProperty(key, value)
end)

GameEvents.GetPlayerProperty.Add(function(playerID, key)
    local player = Players[playerID]
    return player:GetProperty(key, value)
end)

GameEvents.SetPlayerProperty.Add(function(playerID, key, value)
    local player = Players[playerID]
    player:SetProperty(key, value)
end)

--[[GameEvents.GetPlotWonderType.Add(function(plotID)
    local plot = Map.GetPlotByIndex(plotID)
    print(plot:GetWonderType())
    return plot:GetWonderType()
end)
--]]

Utils.SetPlayerProperty = function(playerID, key, value)
    local player = Players[playerID]
    player:SetProperty(key, value)
end

Utils.SetGameProperty = function(key, value)
    Game.SetProperty(key, value)
end

Utils.GetGameProperty = function(key)
    return Game.GetProperty(key)
end

Utils.GetPlotProperty = function(plot, key)
    return plot:GetProperty(key)
end

--Utils.SetPlotProperty.Add(function(plotID, key, value)
--    local plot = Map.GetPlotByIndex(plotID)
--    print(plot:GetX(), plot:GetY(), plot)
--    plot:SetProperty(key, value)
--end)

function ChangeFaithBalance(playerID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetReligion():ChangeFaithBalance(amount)
    end
end
GameEvents.RequestChangeFaithBalance.Add(ChangeFaithBalance)


function GetCurrentlyBuilding(playerID, cityID)
    local city = CityManager.GetCity(playerID,    cityID);
    return city:GetBuildQueue():CurrentlyBuilding();
end

Utils.GetCurrentlyBuilding = GetCurrentlyBuilding;
--GameEvents.GetCurrentlyBuilding.Add(Get_CurrentlyBuilding)

GameEvents.RequestFinishProgress.Add(function(playerID, cityID)
    local city = CityManager.GetCity(playerID,    cityID);    
    city:GetBuildQueue():FinishProgress();
end)

GameEvents.RequestAddProgress.Add(function(playerID, cityID,produnction)   
    local city = CityManager.GetCity(playerID,    cityID);
    city:GetBuildQueue():AddProgress(produnction);
end)

GameEvents.AddGreatPeoplePoints.Add(function(playerID, gppID, amount)
    local player = Players[playerID]
    if player ~= nil then
        print('DA DEBUG add great people point', playerID, gppID, amount)
        player:GetGreatPeoplePoints():ChangePointsTotal(gppID, amount)
    end
end)

GameEvents.RequestCreateBuilding.Add(function (playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    print('HD DEBUG create building requested', playerID, cityID, buildingID)
    if city then
        local buildingQueue = city:GetBuildQueue()
        -- print(city, buildingQueue)
        buildingQueue:CreateBuilding(buildingID) 
    end
end)


Utils.RequestAddWorldView = function (text, iX, iY)
    Game.AddWorldViewText(0,text,iX,iY);
end

