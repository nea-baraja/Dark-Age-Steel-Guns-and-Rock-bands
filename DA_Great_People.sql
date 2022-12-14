
update Eras set GreatPersonBaseCost = GreatPersonBaseCost * 1.5;

INSERT INTO Types (Type,	Kind) VALUES
--巴寡妇清  --7铁
('GREAT_PERSON_INDIVIDUAL_WIDOW_QING',	'KIND_GREAT_PERSON_INDIVIDUAL'),
--范蠡   200金*2
('GREAT_PERSON_INDIVIDUAL_FAN_LI',	'KIND_GREAT_PERSON_INDIVIDUAL'),
--阿尼尤斯·普洛卡姆斯   商路
('GREAT_PERSON_INDIVIDUAL_PLOCAMUS',	'KIND_GREAT_PERSON_INDIVIDUAL'),
--子贡  商业中心产琴
('GREAT_PERSON_INDIVIDUAL_ZI_GONG',	'KIND_GREAT_PERSON_INDIVIDUAL'),
--塞尔吉乌斯 渔船产金
('GREAT_PERSON_INDIVIDUAL_SERGIUS',	'KIND_GREAT_PERSON_INDIVIDUAL'),

--拉美西斯二世  信仰买奇观
('GREAT_PERSON_INDIVIDUAL_RAMSES_II',	'KIND_GREAT_PERSON_INDIVIDUAL'),
--郑国  水渠加速，水渠加河粮
('GREAT_PERSON_INDIVIDUAL_ZHENG_GUO',	'KIND_GREAT_PERSON_INDIVIDUAL'),
--希波丹姆  加区域，区域加瓶
('GREAT_PERSON_INDIVIDUAL_HIPPODAMUS',	'KIND_GREAT_PERSON_INDIVIDUAL'),
--维特鲁威  加区域，区域加琴
('GREAT_PERSON_INDIVIDUAL_VITRUVIUS',	'KIND_GREAT_PERSON_INDIVIDUAL');

INSERT INTO GreatPersonIndividuals (GreatPersonIndividualType,	Name,	GreatPersonClassType,	EraType,	Gender,	ActionCharges,	ActionRequiresCompletedDistrictType) VALUES
--巴寡妇清
('GREAT_PERSON_INDIVIDUAL_WIDOW_QING',	'LOC_GREAT_PERSON_INDIVIDUAL_WIDOW_QING_NAME',	'GREAT_PERSON_CLASS_MERCHANT',	'ERA_CLASSICAL',	'W',	1,	'DISTRICT_COMMERCIAL_HUB'),
--范蠡
('GREAT_PERSON_INDIVIDUAL_FAN_LI',	'LOC_GREAT_PERSON_INDIVIDUAL_FAN_LI_NAME',	'GREAT_PERSON_CLASS_MERCHANT',	'ERA_CLASSICAL',	'M',	2,	'DISTRICT_COMMERCIAL_HUB'),
--阿尼尤斯·普洛卡姆斯
('GREAT_PERSON_INDIVIDUAL_PLOCAMUS',	'LOC_GREAT_PERSON_INDIVIDUAL_PLOCAMUS_NAME',	'GREAT_PERSON_CLASS_MERCHANT',	'ERA_CLASSICAL',	'M',	1,	'DISTRICT_COMMERCIAL_HUB'),
--子贡
('GREAT_PERSON_INDIVIDUAL_ZI_GONG',	'LOC_GREAT_PERSON_INDIVIDUAL_ZI_GONG_NAME',	'GREAT_PERSON_CLASS_MERCHANT',	'ERA_CLASSICAL',	'M',	2,	'DISTRICT_COMMERCIAL_HUB'),
--塞尔吉乌斯
('GREAT_PERSON_INDIVIDUAL_SERGIUS',	'LOC_GREAT_PERSON_INDIVIDUAL_SERGIUS_NAME',	'GREAT_PERSON_CLASS_MERCHANT',	'ERA_CLASSICAL',	'M',	1,	'DISTRICT_CITY_CENTER'),


--拉美西斯二世
('GREAT_PERSON_INDIVIDUAL_RAMSES_II',	'LOC_GREAT_PERSON_INDIVIDUAL_RAMSES_II_NAME',	'GREAT_PERSON_CLASS_ENGINEER',	'ERA_CLASSICAL',	'M',	1,	null),
--郑国
('GREAT_PERSON_INDIVIDUAL_ZHENG_GUO',	'LOC_GREAT_PERSON_INDIVIDUAL_ZHENG_GUO_NAME',	'GREAT_PERSON_CLASS_ENGINEER',	'ERA_CLASSICAL',	'M',	2,	'DISTRICT_CITY_CENTER'),
--希波丹姆
('GREAT_PERSON_INDIVIDUAL_HIPPODAMUS',	'LOC_GREAT_PERSON_INDIVIDUAL_HIPPODAMUS_NAME',	'GREAT_PERSON_CLASS_ENGINEER',	'ERA_CLASSICAL',	'M',	1,	'DISTRICT_CITY_CENTER'),
--维特鲁威
('GREAT_PERSON_INDIVIDUAL_VITRUVIUS',	'LOC_GREAT_PERSON_INDIVIDUAL_VITRUVIUS_NAME',	'GREAT_PERSON_CLASS_ENGINEER',	'ERA_CLASSICAL',	'M',	1,	'DISTRICT_CITY_CENTER');


update GreatPersonIndividuals set ActionRequiresIncompleteWonder = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_RAMSES_II';




INSERT INTO GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId,AttachmentTargetType) VALUES 
--巴寡妇清
('GREAT_PERSON_INDIVIDUAL_WIDOW_QING', 'GREATPERSON_WIDOW_QING_IRON','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
--范蠡
('GREAT_PERSON_INDIVIDUAL_FAN_LI', 'GREATPERSON_FANLI_GOLD','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
--阿尼尤斯·普洛卡姆斯
('GREAT_PERSON_INDIVIDUAL_PLOCAMUS', 'PLOCAMUS_TRADE_ROUTE_CAPACITY','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
('GREAT_PERSON_INDIVIDUAL_PLOCAMUS', 'GREATPERSON_GOLD_FROM_INCOMING_FOREIGN_ROUTES_PLOCAMUS','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'), 
('GREAT_PERSON_INDIVIDUAL_PLOCAMUS', 'GREATPERSON_GOLD_TO_INCOMING_FOREIGN_ROUTES_PLOCAMUS','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'), 
--子贡
('GREAT_PERSON_INDIVIDUAL_ZI_GONG', 'GREATPERSON_ZI_GONG_ADJACENCY_BONUS','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
--塞尔吉乌斯
('GREAT_PERSON_INDIVIDUAL_SERGIUS', 'GREATPERSON_SERGIUS_FISHING_BOATS_GOLD','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),

--拉美西斯二世
('GREAT_PERSON_INDIVIDUAL_RAMSES_II', 'GREAT_PERSON_RAMSES_II_DO_NOTHING','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_WONDER_IN_TILE'),
--郑国
('GREAT_PERSON_INDIVIDUAL_ZHENG_GUO', 'GREATPERSON_ZHENG_GUO_AQUEDUCT','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'), 
('GREAT_PERSON_INDIVIDUAL_ZHENG_GUO', 'GREATPERSON_ZHENG_GUO_FOOD','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
--希波丹姆
('GREAT_PERSON_INDIVIDUAL_HIPPODAMUS', 'GREATPERSON_HIPPODAMUS_EXTRA_DISTRICT','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
('GREAT_PERSON_INDIVIDUAL_HIPPODAMUS', 'GREATPERSON_HIPPODAMUS_DISTRICT_YIELD','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
--维特鲁威
('GREAT_PERSON_INDIVIDUAL_VITRUVIUS', 'GREATPERSON_VITRUVIUS_EXTRA_DISTRICT','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
('GREAT_PERSON_INDIVIDUAL_VITRUVIUS', 'GREATPERSON_VITRUVIUS_DISTRICT_YIELD','GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY');


INSERT INTO Modifiers (ModifierId, 			ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
--巴寡妇清
('GREATPERSON_WIDOW_QING_IRON', 'MODIFIER_SINGLE_CITY_ADJUST_FREE_RESOURCE_EXTRACTION', 1, 1, 0, NULL, NULL),
--范蠡
('GREATPERSON_FANLI_GOLD', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, 0, NULL, NULL),
--阿尼尤斯·普洛卡姆斯
('PLOCAMUS_TRADE_ROUTE_CAPACITY', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 1, 1, 0, NULL, NULL), 
('GREATPERSON_GOLD_FROM_INCOMING_FOREIGN_ROUTES_PLOCAMUS', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS', 1, 1, 0, NULL, NULL), 
('GREATPERSON_GOLD_TO_INCOMING_FOREIGN_ROUTES_PLOCAMUS', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS', 1, 1, 0, NULL, NULL),
--子贡
('GREATPERSON_ZI_GONG_ADJACENCY_BONUS', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 1, 1, 0, NULL, NULL),
--塞尔吉乌斯
('GREATPERSON_SERGIUS_FISHING_BOATS_GOLD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 1, 1, 0, NULL, 'RS_PLOT_HAS_IMPROVEMENT_FISHING_BOATS'),
--拉美西斯二世
('GREAT_PERSON_RAMSES_II_DO_NOTHING', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, 0, NULL, NULL),

--郑国
('GREATPERSON_ZHENG_GUO_AQUEDUCT', 'MODIFIER_PLAYER_CITIES_ADJUST_ZHENG_GUO_DISTRICT_PRODUCTION', 1, 1, 0, NULL, NULL),
('GREATPERSON_ZHENG_GUO_FOOD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 1, 0, NULL, 'ZHENG_GUO_FOOD'),
--希波丹姆
('GREATPERSON_HIPPODAMUS_EXTRA_DISTRICT', 'MODIFIER_SINGLE_CITY_EXTRA_DISTRICT', 1, 1, 0, NULL, NULL),
('GREATPERSON_HIPPODAMUS_DISTRICT_YIELD', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 1, 0, NULL, 'RS_CITY_HAS_2_DISTRICTS'),
--维特鲁威
('GREATPERSON_VITRUVIUS_EXTRA_DISTRICT', 'MODIFIER_SINGLE_CITY_EXTRA_DISTRICT', 1, 1, 0, NULL, NULL),
('GREATPERSON_VITRUVIUS_DISTRICT_YIELD', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 0, 1, 0, NULL, 'RS_CITY_HAS_2_DISTRICTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
--巴寡妇清
('GREATPERSON_WIDOW_QING_IRON', 'Amount', '7'), 
('GREATPERSON_WIDOW_QING_IRON', 'ResourceType', 'RESOURCE_IRON'), 
--范蠡
('GREATPERSON_FANLI_GOLD', 'Amount', '200'), 
('GREATPERSON_FANLI_GOLD', 'YieldType', 'YIELD_GOLD'), 
--阿尼尤斯·普洛卡姆斯
('PLOCAMUS_TRADE_ROUTE_CAPACITY', 'Amount', '1'), 
('GREATPERSON_GOLD_FROM_INCOMING_FOREIGN_ROUTES_PLOCAMUS', 'Amount', '4'), 
('GREATPERSON_GOLD_FROM_INCOMING_FOREIGN_ROUTES_PLOCAMUS', 'YieldType', 'YIELD_GOLD'), 
('GREATPERSON_GOLD_TO_INCOMING_FOREIGN_ROUTES_PLOCAMUS', 'Amount', '4'), 
('GREATPERSON_GOLD_TO_INCOMING_FOREIGN_ROUTES_PLOCAMUS', 'YieldType', 'YIELD_GOLD'), 
--子贡
('GREATPERSON_ZI_GONG_ADJACENCY_BONUS', 'DistrictType', 'DISTRICT_COMMERCIAL_HUB'), 
('GREATPERSON_ZI_GONG_ADJACENCY_BONUS', 'YieldTypeToGrant', 'YIELD_SCIENCE'), 
('GREATPERSON_ZI_GONG_ADJACENCY_BONUS', 'YieldTypeToMirror', 'YIELD_GOLD'),
--塞尔吉乌斯
('GREATPERSON_SERGIUS_FISHING_BOATS_GOLD', 'Amount', '4'), 
('GREATPERSON_SERGIUS_FISHING_BOATS_GOLD', 'YieldType', 'YIELD_GOLD'),
--拉二
('GREAT_PERSON_RAMSES_II_DO_NOTHING', 'Amount', '0'), 
('GREAT_PERSON_RAMSES_II_DO_NOTHING', 'YieldType', 'YIELD_GOLD'), 

--郑国
('GREATPERSON_ZHENG_GUO_AQUEDUCT', 'Amount', '50'), 
('GREATPERSON_ZHENG_GUO_AQUEDUCT', 'DistrictType', 'DISTRICT_AQUEDUCT'),
('GREATPERSON_ZHENG_GUO_FOOD', 'Amount', '1'), 
('GREATPERSON_ZHENG_GUO_FOOD', 'YieldType', 'YIELD_FOOD'),
--希波丹姆
('GREATPERSON_HIPPODAMUS_EXTRA_DISTRICT', 'Amount', '1'),
('GREATPERSON_HIPPODAMUS_DISTRICT_YIELD', 'Amount', '2'), 
('GREATPERSON_HIPPODAMUS_DISTRICT_YIELD', 'YieldType', 'YIELD_SCIENCE'), 
--维特鲁威
('GREATPERSON_VITRUVIUS_EXTRA_DISTRICT', 'Amount', '1'),
('GREATPERSON_VITRUVIUS_DISTRICT_YIELD', 'Amount', '2'), 
('GREATPERSON_VITRUVIUS_DISTRICT_YIELD', 'YieldType', 'YIELD_CULTURE');


INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
--郑国
('ZHENG_GUO_FOOD', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
--郑国
('ZHENG_GUO_FOOD', 'REQ_ZHENG_GUO_RIVER'), 
('ZHENG_GUO_FOOD', 'REQ_CITY_HAS_DISTRICT_AQUEDUCT');



INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
--郑国
('REQ_ZHENG_GUO_RIVER', 'REQUIREMENT_PLOT_ADJACENT_TO_RIVER');

--INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
--郑国



INSERT INTO ModifierStrings(ModifierId,	Context,	Text) VALUES
--巴寡妇清
('GREATPERSON_WIDOW_QING_IRON', 'Summary', 'LOC_WIDOW_QING_IRON'),
--范蠡
('GREATPERSON_FANLI_GOLD', 'Summary', 'LOC_FANLI_GOLD'),
--阿尼尤斯·普洛卡姆斯
('PLOCAMUS_TRADE_ROUTE_CAPACITY', 'Summary', 'LOC_PLOCAMUS_TRADE_ROUTE_CAPACITY'),
--子贡
('GREATPERSON_ZI_GONG_ADJACENCY_BONUS', 'Summary', 'LOC_GREATPERSON_ZI_GONG_ADJACENCY_BONUS'),
--塞尔吉乌斯
('GREATPERSON_SERGIUS_FISHING_BOATS_GOLD', 'Summary', 'LOC_SERGIUS_FISHING_BOATS_GOLD'),
--拉二
('GREAT_PERSON_RAMSES_II_DO_NOTHING', 'Summary', 'LOC_RAMSES_II_BUY_WONDER'), 
--郑国
--('GREATPERSON_ZHENG_GUO_AQUEDUCT', 'Summary', 'LOC_ZHENG_GUO_AQUEDUCT'),
('GREATPERSON_ZHENG_GUO_FOOD', 'Summary', 	  'LOC_ZHENG_GUO_FOOD'),
--希波丹姆
('GREATPERSON_HIPPODAMUS_EXTRA_DISTRICT', 'Summary', 'LOC_HIPPODAMUS_EXTRA_DISTRICT'),
--维特鲁威
('GREATPERSON_VITRUVIUS_EXTRA_DISTRICT', 'Summary', 'LOC_VITRUVIUS_EXTRA_DISTRICT');




--范蠡
UPDATE ModifierArguments SET Type = 'ScaleByGameSpeed' WHERE ModifierId = 'GREATPERSON_FANLI_GOLD' AND Name = 'Amount';


create table 'GreatPersonSpeedUp'(
	'GreatPersonIndividualType' TEXT NOT NULL,
	'SpeedUpWonder' BOOLEAN NOT NULL CHECK (SpeedUpWonder IN (0,1)) DEFAULT 0,
	'SpeedUpTechs' TEXT,
	PRIMARY KEY('GreatPersonIndividualType')
);

insert or replace into GreatPersonSpeedUp(GreatPersonIndividualType,	SpeedUpWonder,		SpeedUpTechs) values
	('GREAT_PERSON_RAMSES_II_DO_NOTHING',				1,		NULL),
	('GREAT_PERSON_INDIVIDUAL_IMHOTEP',					1,		NULL),
	('GREAT_PERSON_INDIVIDUAL_ISIDORE_OF_MILETUS',		1,		NULL),
	('GREAT_PERSON_INDIVIDUAL_FILIPPO_BRUNELLESCHI',	1,		NULL),	
	('GREAT_PERSON_INDIVIDUAL_SHAH_JAHAN',				1,		NULL),
	('GREAT_PERSON_INDIVIDUAL_GUSTAVE_EIFFEL',			1,		NULL);

