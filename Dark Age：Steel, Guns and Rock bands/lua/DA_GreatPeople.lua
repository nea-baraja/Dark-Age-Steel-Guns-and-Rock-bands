--[[
local RAMSES_II_INDEX = GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_RAMSES_II"].Index;


function RamsesIIFaithBuyWonder(unitOwner, unitID,greatPersonClassID, greatPersonIndividualID)
   if greatPersonIndividualID ~= RAMSES_II_INDEX then
      return;
   end
   
   local owner = Players[unitOwner];

   local unit = UnitManager.GetUnit(unitOwner, unitID);
   local unitPlot = Map.GetPlot(unit:GetX(), unit:GetY());
   --local districtAtPlot = CityManager.GetDistrictAt(unitPlot);
   local city = Cities.GetPlotPurchaseCity(unitPlot);
   print(city)
   local current = city:GetBuildQueue():CurrentlyBuilding();
   if not current then
      return;
   end
   local buildingInfo = GameInfo.Buildings[current];
   if not buildingInfo.IsWonder then
      return;
   end
   local cost = buildingInfo.Cost;
   local iProductionProgress = city:GetBuildQueue():GetBuildingProgress( buildingInfo.Index );
   local productionNeeded = cost - iProductionProgress;
   local faithBalance = owner:GetReligion():GetFaithBalance();
   if(faithBalance > productionNeeded) then
      owner:GetReligion():ChangeFaithBalance(-productionNeeded);
      city:GetBuildQueue():FinishProgress();
   else
      owner:GetReligion():ChangeFaithBalance(-faithBalance);
      city:GetBuildQueue():AddProgress(faithBalance);
   end
   print('LA II ACTIVATED')
end

Events.UnitGreatPersonActivated.Add( RamsesIIFaithBuyWonder );
]]