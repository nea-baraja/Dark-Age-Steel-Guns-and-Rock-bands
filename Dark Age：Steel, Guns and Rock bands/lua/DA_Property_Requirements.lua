include("SupportFunctions")

GameEvents = ExposedMembers.GameEvents
Utils = ExposedMembers.DA.Utils

function AmenityPropertyManager(playerID, cityID)
	local player = Players[playerID]
    local pCity = CityManager.GetCity(playerID, cityID)
    if pCity == nil then 
    	return 
    end
    local cityX = pCity:GetX()
    local cityY = pCity:GetY()
    local CityPlot = Map.GetPlot(cityX, cityY)
    local plotID = CityPlot:GetIndex()
    local pCityGrowth = pCity:GetGrowth()
    local pAmenity = pCityGrowth:GetAmenities() - pCityGrowth:GetAmenitiesNeeded()
    local PROP_AMENITY = 'CITY_AMENITY'

    if pAmenity ~= nil then 
    	GameEvents.SetPlotProperty.Call(plotID, PROP_AMENITY, pAmenity)
    --	print(playerID..':'..cityID..':amenity is '..Utils.GetPlotProperty(CityPlot, PROP_AMENITY))
    end
	print('yes')
end

function SpecialistManager(playerID)
    local player = Players[playerID]
    for _, district in player:GetDistricts():Members() do
    	local districtPlot:table = Map.GetPlot(district:GetX(), district:GetY())
    	local plotID = districtPlot:GetIndex()
    	local citizens = districtPlot:GetWorkerCount()
    	local PROP_WORKER_COUNT = 'WORKER_COUNT'
    	GameEvents.SetPlotProperty.Call(plotID, PROP_WORKER_COUNT, citizens)
    	print(playerID..' district worker count is '..Utils.GetPlotProperty(districtPlot, PROP_WORKER_COUNT))
    end
end

function AdjacencyManager(playerID)
    local player = Players[playerID]
    local pCityDistricts = player:GetDistricts()
    local kTempDistrictYields :table = {}
    local PROP_ADJANCENCY = 'ADJACENCY_'
    for yield in GameInfo.Yields() do
        kTempDistrictYields[yield.Index] = yield
    end
    for i, district in pCityDistricts:Members() do      
        -- ==========
       --[[ function GetDistrictYield( district:table, yieldType:string )
            for i,yield in ipairs( kTempDistrictYields ) do
                if yield.YieldType == yieldType then
                    return district:GetYield(i);
                end
            end
            return 0;
        end     

        --I do not know why we make local functions, but I am keeping standard
        function GetDistrictBonus( district:table, yieldType:string )
            for i,yield in ipairs( kTempDistrictYields ) do
                if yield.YieldType == yieldType then
                    return district:GetAdjacencyYield(i);
                end
            end
            return 0;
        end]]
        local districtPlot:table = Map.GetPlot(district:GetX(), district:GetY())
        local plotID = districtPlot:GetIndex()
        for j,yield in ipairs( kTempDistrictYields ) do
            GameEvents.SetPlotProperty.Call(plotID, PROP_ADJANCENCY..yield.YieldType , district:GetAdjacencyYield(j))
        end
    end
end
  
function OnTurnBegin()
	local players = Game.GetPlayers{Alive = true};
	print('turnbegin')
	for _, player in ipairs(players) do
		SpecialistManager(player:GetID())
        AdjacencyManager(player:GetID())
		for _, city in player:GetCities():Members() do
			AmenityPropertyManager(player:GetID(), city:GetID())
		end
	end
end




Events.TurnBegin.Add(OnTurnBegin);
Events.CityAddedToMap.Add(AmenityPropertyManager)
