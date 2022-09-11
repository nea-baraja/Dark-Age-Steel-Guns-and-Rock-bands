--include("EventPopup")
function OnTurnBegin()
	print(1111);
	unlockA = {};
	unlockA.Units = {GameInfo.Units["UNIT_SETTLER"].Index};
	unlockA.Buildings = {GameInfo.Buildings["BUILDING_LIBRARY"].Index};
	unlockB = {};
	unlockB.Units = {GameInfo.Units["UNIT_WARRIOR_MONK"].Index};
	unlockB.Effects = {"immediate victory"};
	ReportingEvents.Send("EVENT_POPUP_REQUEST", { ForPlayer = 0, EventKey = "POPUP_SCENARIO_PLAGUE_APPEARS", ChoiceAText ="qqq", ChoiceBText="www",ChoiceAUnlocks=unlockA,ChoiceBUnlocks=unlockB});
	--ReportingEvents.Send("EVENT_POPUP_REQUEST", { ForPlayer = 0, EventKey = "POPUP_SCENARIO_PLAGUE_APPEARS", ChoiceAText ="qqq", ChoiceBText="www"});

	--ReportingEvents.Send("EVENT_POPUP_REQUEST", { ForPlayer = 0, EventKey = "POPUP_SCENARIO_PLAGUE_APPEARS"});


end

--Events.TurnBegin.Add(OnTurnBegin);