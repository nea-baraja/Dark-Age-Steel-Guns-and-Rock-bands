
update Buildings set Description = 'LOC_BUILDING_GRANARY_DESCRIPTION' where BuildingType = 'BUILDING_GRANARY';
--update Buildings set Description = 'LOC_BUILDING_UNIVERSITY_DESCRIPTION' where BuildingType = 'BUILDING_UNIVERSITY';
--update Buildings set Description = 'LOC_BUILDING_RESEARCH_LAB_DESCRIPTION' where BuildingType = 'BUILDING_RESEARCH_LAB';
--update Buildings set Description = 'LOC_BUILDING_LIBRARY_DESCRIPTION' where BuildingType = 'BUILDING_LIBRARY';
update Buildings set Description = 'LOC_BUILDING_AMPHITHEATER_DESCRIPTION' where BuildingType = 'BUILDING_AMPHITHEATER';

--update Buildings set Description = 'LOC_BUILDING_BROADCAST_CENTER_DESCRIPTION' where BuildingType = 'BUILDING_BROADCAST_CENTER';
--update Buildings set Description = 'LOC_BUILDING_BANK_DESCRIPTION' where BuildingType = 'BUILDING_BANK';
--update Buildings set Description = 'LOC_BUILDING_STOCK_EXCHANGE_DESCRIPTION' where BuildingType = 'BUILDING_STOCK_EXCHANGE';
--update Buildings set Description = 'LOC_BUILDING_WORKSHOP_DESCRIPTION' where BuildingType = 'BUILDING_WORKSHOP';
--update Buildings set Description = 'LOC_BUILDING_FACTORY_DL_DESCRIPTION' where BuildingType = 'BUILDING_FACTORY';
--update Buildings set Description = 'LOC_BUILDING_COAL_POWER_PLANT_DL_DESCRIPTION' where BuildingType = 'BUILDING_COAL_POWER_PLANT';
--update Buildings set Description = 'LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DL_DESCRIPTION' where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';
--update Buildings set Description = 'LOC_BUILDING_POWER_PLANT_DL_DESCRIPTION' where BuildingType = 'BUILDING_POWER_PLANT';

insert or replace into Types
    (Type,                                      Kind)
values
    ('BUILDING_MASON',                         'KIND_BUILDING');

insert or replace into Buildings
    (BuildingType,                      Name,                                       Cost,   Maintenance,    Description,                                        
        PrereqTech,                     PrereqCivic,                                PrereqDistrict,         PurchaseYield,          Housing) 
values
    ('BUILDING_MASON',                  'LOC_BUILDING_MASON_NAME',                  70,     4,              'LOC_BUILDING_MASON_DESCRIPTION',                
    'TECH_MINING',                      null,                                       'DISTRICT_CITY_CENTER', 'YIELD_GOLD',           null);


delete from Building_CitizenYieldChanges
    where BuildingType in ('BUILDING_LIBRARY','BUILDING_AMPHITHEATER','BUILDING_SHRINE','BUILDING_TEMPLE','BUILDING_LIGHTHOUSE','BUILDING_BARRACKS','BUILDING_MARKET');
insert or replace into Building_CitizenYieldChanges
    (BuildingType,                          YieldType,          YieldChange)
values
    -- Campus
    ('BUILDING_LIBRARY',                    'YIELD_SCIENCE',    1),

    ('BUILDING_AMPHITHEATER',               'YIELD_CULTURE',    1),

    ('BUILDING_SHRINE',                     'YIELD_FAITH',      2),
    ('BUILDING_TEMPLE',                     'YIELD_FAITH',      2),
    ('BUILDING_TEMPLE',                     'YIELD_GOLD',       -3),

    ('BUILDING_LIGHTHOUSE',                 'YIELD_FOOD',       1),

    ('BUILDING_BARRACKS',                   'YIELD_PRODUCTION', 1),
    ('BUILDING_STABLE',                     'YIELD_FOOD',       1),

    ('BUILDING_MARKET',                     'YIELD_GOLD',       3);


-- 不再从建筑本身获得伟人点
--注意  未来可能会需要有建筑的大音乐家大艺术家点
delete from Building_GreatPersonPoints;

update Buildings set Entertainment = 1
where BuildingType = 'BUILDING_ARENA';

update Buildings set Housing = 1
where BuildingType = 'BUILDING_GRANARY'  or BuildingType = 'BUILDING_WATER_MILL';

delete from Building_YieldChanges 
    where BuildingType in ('BUILDING_PALACE','BUILDING_MONUMENT','BUILDING_SHRINE','BUILDING_TEMPLE','BUILDING_LIBRARY','BUILDING_AMPHITHEATER','BUILDING_LIGHTHOUSE',
        'BUILDING_BARRACKS','BUILDING_STABLE','BUILDING_MARKET','BUILDING_GRANARY','BUILDING_WATER_MILL','BUILDING_ARENA');
insert or replace into Building_YieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    -- City Center
    ('BUILDING_PALACE',             'YIELD_FOOD',       1),
    ('BUILDING_PALACE',             'YIELD_PRODUCTION', 3),
    ('BUILDING_PALACE',             'YIELD_SCIENCE',    2),
    ('BUILDING_PALACE',             'YIELD_CULTURE',    2),
    ('BUILDING_PALACE',             'YIELD_GOLD',       7),

    ('BUILDING_MONUMENT',           'YIELD_CULTURE',    2),

  --  ('BUILDING_GRANARY',           'YIELD_FOOD',        2),
    ('BUILDING_WATER_MILL',        'YIELD_FOOD',        1),
  --  ('BUILDING_WATER_MILL',        'YIELD_PRODUCTION',  1),
    ('BUILDING_MASON',             'YIELD_PRODUCTION',  1),


    ('BUILDING_SHRINE',             'YIELD_FAITH',      3),
    ('BUILDING_TEMPLE',             'YIELD_FAITH',      6),

    ('BUILDING_LIBRARY',            'YIELD_SCIENCE',    2),

    ('BUILDING_AMPHITHEATER',       'YIELD_CULTURE',    2),

    ('BUILDING_LIGHTHOUSE',         'YIELD_FOOD',       2);


-- Maintainance and Cost
-- City Center
update Buildings set Maintenance = 2,   Cost = 50   where BuildingType = 'BUILDING_MONUMENT';
update Buildings set Maintenance = 4,   Cost = 70   where BuildingType = 'BUILDING_GRANARY';
update Buildings set Maintenance = 4,   Cost = 70   where BuildingType = 'BUILDING_WATER_MILL';

update Buildings set Maintenance = 3,   Cost = 100  where BuildingType = 'BUILDING_LIBRARY';

update Buildings set Maintenance = 3,   Cost = 100  where BuildingType = 'BUILDING_AMPHITHEATER';

update Buildings set Maintenance = 0,   Cost = 80   where BuildingType = 'BUILDING_MARKET';

update Buildings set Maintenance = 3,   Cost = 70   where BuildingType = 'BUILDING_SHRINE';
update Buildings set Maintenance = 5,   Cost = 90   where BuildingType = 'BUILDING_TEMPLE';

update Buildings set Maintenance = 3,   Cost = 80   where BuildingType = 'BUILDING_BARRACKS';
update Buildings set Maintenance = 3,   Cost = 80   where BuildingType = 'BUILDING_STABLE';

update Buildings set Maintenance = 3,   Cost = 80   where BuildingType = 'BUILDING_LIGHTHOUSE';

update Buildings set Maintenance = 3,   Cost = 70   where BuildingType = 'BUILDING_ARENA';


insert or replace into Building_YieldsPerEra
    (BuildingType,                  YieldType,          YieldChange)  values
    ('BUILDING_MONUMENT',           'YIELD_CULTURE',    '1');

delete from BuildingModifiers
     where BuildingType in ('BUILDING_PALACE','BUILDING_MONUMENT','BUILDING_SHRINE','BUILDING_TEMPLE','BUILDING_LIBRARY','BUILDING_AMPHITHEATER','BUILDING_LIGHTHOUSE',
        'BUILDING_BARRACKS','BUILDING_STABLE','BUILDING_MARKET','BUILDING_GRANARY','BUILDING_WATER_MILL','BUILDING_ARENA');


insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
 --   ('BUILDING_GRANARY',            'GRANARY_POP_GROWTH'),
 --   ('BUILDING_WATER_MILL',         'WATER_MILL_FOOD_FOR_RIVER_FARM'),
  --  ('BUILDING_WATER_MILL',         'WATER_MILL_FOOD_FOR_RIVER_PLANTATION'),
 --   ('BUILDING_WATER_MILL',         'WATER_MILL_PRODUCTION_FOR_RIVER_LUMBER_MILL'),
    ('BUILDING_GRANARY',            'GRANARY_FARM_FOOD'),
 --   ('BUILDING_GRANARY',            'GRANARY_ADJACENT_GRASS_FOOD'),
 --   ('BUILDING_GRANARY',            'GRANARY_ADJACENT_PLAINS_FOOD'),       
    ('BUILDING_WATER_MILL',         'WATER_MILL_DISTRICTS_PRODUCTION'),
    ('BUILDING_MASON',              'MASON_QUARRY_PRODUCTION'),
  --  ('BUILDING_MASON',              'MASON_ADJACENT_GRASS_HILL_PRODUCTION'),
  --  ('BUILDING_MASON',              'MASON_ADJACENT_PLAINS_HILL_PRODUCTION'),
    ('BUILDING_MONUMENT',             'MONUMENT_CAN_BUILD_TEST'),

    ('BUILDING_SHRINE',             'SHRINE_BUILDER_PURCHASE'),
    ('BUILDING_TEMPLE',             'TEMPLE_SETTLER_PURCHASE'),
    ('BUILDING_BARRACKS',           'BARRACKS_UNIT_PRODUCTION'),
    ('BUILDING_BARRACKS',           'BARRACKS_TRAINED_UNIT_PROMOTION'),
    ('BUILDING_MARKET',             'MARKET_TRADE_ROUTE_CAPACITY'),
    ('BUILDING_MARKET',             'MARKET_GOLD_FOR_CAMP'),
    ('BUILDING_MARKET',             'MARKET_GOLD_FOR_PANTATION'),
    ('BUILDING_ARENA',              'ARENA_CULTURE_FOR_CAMP'),
    ('BUILDING_ARENA',              'ARENA_CULTURE_FOR_PASTURE'),
    ('BUILDING_STABLE',             'STABLE_PRODUCTION_FOR_PASTURE'),
    ('BUILDING_STABLE',             'STABLE_TRAINED_UNIT_PROMOTION'),
    ('BUILDING_LIGHTHOUSE',         'LIGHTHOUSE_TRADE_ROUTE_CAPACITY'),
    ('BUILDING_LIGHTHOUSE',         'LIGHTHOUSE_FOOD_FOR_FISHING_BOATS');
   
insert or replace into TraitModifiers
    (TraitType,                         ModifierId)
values
    ('TRAIT_LEADER_MAJOR_CIV',          'WATER_MILL_DISTRICTS_PRODUCTION_MOD'),
    ('TRAIT_LEADER_MAJOR_CIV',          'AMPHITHEATER_WRITING_CULTURE_BOOST'),
    ('TRAIT_LEADER_MAJOR_CIV',          'AMPHITHEATER_WRITING_TOURISM_BOOST'),
    ('TRAIT_LEADER_MAJOR_CIV',          'PLAYERS_HOLY_SITE_FAITH_PURCHASE'),
    ('TRAIT_LEADER_MAJOR_CIV',          'GRANARY_ADJACENT_GRASS_FOOD'),
    ('TRAIT_LEADER_MAJOR_CIV',          'GRANARY_ADJACENT_PLAINS_FOOD'),
    ('TRAIT_LEADER_MAJOR_CIV',          'MASON_ADJACENT_GRASS_HILL_PRODUCTION'),
    ('TRAIT_LEADER_MAJOR_CIV',          'MASON_ADJACENT_PLAINS_HILL_PRODUCTION');


insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                                                   SubjectRequirementSetId)
values
  --   ('MONUMENT_CAN_BUILD_TEST',                     'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK',                     NULL),
  
    --('GRANARY_POP_GROWTH',                          'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH',                      NULL),
    ('SHRINE_BUILDER_PURCHASE',                     'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',                     NULL),
    ('TEMPLE_SETTLER_PURCHASE',                     'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',                     NULL),
    ('BARRACKS_UNIT_PRODUCTION',                    'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_CHANGE',           NULL),
    ('MARKET_TRADE_ROUTE_CAPACITY',                 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',                  NULL),
    ('LIGHTHOUSE_TRADE_ROUTE_CAPACITY',             'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',                  NULL),
--    ('WATER_MILL_FOOD_FOR_RIVER_FARM',              'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_RIVER_FARM'),
--    ('WATER_MILL_PRODUCTION_FOR_RIVER_LUMBER_MILL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_RIVER_LUMBER_MILL'),
    ('MARKET_GOLD_FOR_CAMP',                        'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_CAMP'),
    ('MARKET_GOLD_FOR_PANTATION',                   'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_PLANTATION'),
    ('ARENA_CULTURE_FOR_CAMP',                      'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_CAMP'),
    ('ARENA_CULTURE_FOR_PASTURE',                   'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_PASTURE'),
    ('STABLE_PRODUCTION_FOR_PASTURE',               'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_PASTURE'),
    ('LIGHTHOUSE_FOOD_FOR_FISHING_BOATS',           'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_FISHING_BOATS'),
    ('AMPHITHEATER_WRITING_CULTURE_BOOST',          'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',                       'RS_AT_LEAST_4_AMENITIES_AND_HAS_AMPHITHEATER'),--RS_AT_LEAST_4_HAPPINESS
    ('AMPHITHEATER_WRITING_TOURISM_BOOST',          'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',                       'RS_AT_LEAST_4_AMENITIES_AND_HAS_AMPHITHEATER'),
    ('AMPHITHEATER_WRITING_CULTURE_BOOST_MOD',      'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',                  NULL),
    ('AMPHITHEATER_WRITING_TOURISM_BOOST_MOD',      'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',                          NULL),
    ('BARRACKS_TRAINED_UNIT_PROMOTION',             'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',          'BARRACKS_UNIT_REQUIREMENTS'),
    ('STABLE_TRAINED_UNIT_PROMOTION',               'MODIFIER_CITY_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',          'STABLE_UNIT_REQUIREMENTS'),
    ('PLAYERS_HOLY_SITE_FAITH_PURCHASE',            'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE',        NULL),
    --('WATER_MILL_DISTRICTS_PRODUCTION',             'MODIFIER_CITY_OWNER_ATTACH_MODIFIER',                          NULL),
    ('WATER_MILL_DISTRICTS_PRODUCTION_MOD',         'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',                'CITY_ADJACENT_TO_RIVER_AND_HAS_WATER_MILL'),
    ('GRANARY_FARM_FOOD',                           'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_FARM'),
    ('MASON_QUARRY_PRODUCTION',                     'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',                  'RS_PLOT_HAS_IMPROVEMENT_QUARRY'),
    ('GRANARY_ADJACENT_GRASS_FOOD',                 'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',                     'RS_CITY_HAS_BUILDING_GRANARY'),
    ('GRANARY_ADJACENT_PLAINS_FOOD',                'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',                     'RS_CITY_HAS_BUILDING_GRANARY'),
    ('MASON_ADJACENT_GRASS_HILL_PRODUCTION',        'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',                     'RS_CITY_HAS_BUILDING_MASON'),
    ('MASON_ADJACENT_PLAINS_HILL_PRODUCTION',       'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',                     'RS_CITY_HAS_BUILDING_MASON');
   
   



insert or replace into ModifierArguments
    (ModifierId,                                    Name,                       Value)
values
   --  ('MONUMENT_CAN_BUILD_TEST',                     'DistrictType',                      'DISTRICT_TEST'),
  --   ('MONUMENT_CAN_BUILD_TEST',                     'TechType',                      'TECH_POTTERY'),

   -- ('GRANARY_POP_GROWTH',                          'Amount',                   '20'),
    ('SHRINE_BUILDER_PURCHASE',                     'Tag',                      'CLASS_BUILDER'),
    ('SHRINE_BUILDER_PURCHASE',                     'Tag',                      'CLASS_BUILDER'),
    ('TEMPLE_SETTLER_PURCHASE',                     'Tag',                      'CLASS_SETTLER'),
    ('TEMPLE_SETTLER_PURCHASE',                     'Tag',                      'CLASS_SETTLER'),
    ('BARRACKS_UNIT_PRODUCTION',                    'Amount',                   '4'),
    ('MARKET_TRADE_ROUTE_CAPACITY',                 'Amount',                   '1'),
    ('LIGHTHOUSE_TRADE_ROUTE_CAPACITY',             'Amount',                   '1'),
   -- ('WATER_MILL_FOOD_FOR_RIVER_FARM',              'YieldType',                'YIELD_FOOD'),
   -- ('WATER_MILL_FOOD_FOR_RIVER_FARM',              'Amount',                   '1'),
   -- ('WATER_MILL_FOOD_FOR_RIVER_PLANTATION',        'YieldType',                'YIELD_FOOD'),
   -- ('WATER_MILL_FOOD_FOR_RIVER_PLANTATION',        'Amount',                   '1'),
    --('WATER_MILL_PRODUCTION_FOR_RIVER_LUMBER_MILL', 'YieldType',                'YIELD_PRODUCTION'),
    --('WATER_MILL_PRODUCTION_FOR_RIVER_LUMBER_MILL', 'Amount',                   '1'),
    ('MARKET_GOLD_FOR_CAMP',                        'YieldType',                'YIELD_GOLD'),
    ('MARKET_GOLD_FOR_CAMP',                        'Amount',                   '3'),
    ('MARKET_GOLD_FOR_PANTATION',                   'YieldType',                'YIELD_GOLD'),
    ('MARKET_GOLD_FOR_PANTATION',                   'Amount',                   '3'),
    ('ARENA_CULTURE_FOR_CAMP',                      'YieldType',                'YIELD_CULTURE'),
    ('ARENA_CULTURE_FOR_CAMP',                      'Amount',                   '1'),
    ('ARENA_CULTURE_FOR_PASTURE',                   'YieldType',                'YIELD_CULTURE'),
    ('ARENA_CULTURE_FOR_PASTURE',                   'Amount',                   '1'),
    ('STABLE_PRODUCTION_FOR_PASTURE',               'YieldType',                'YIELD_PRODUCTION'),
    ('STABLE_PRODUCTION_FOR_PASTURE',               'Amount',                   '1'),
    ('LIGHTHOUSE_FOOD_FOR_FISHING_BOATS',           'YieldType',                'YIELD_FOOD'),
    ('LIGHTHOUSE_FOOD_FOR_FISHING_BOATS',           'Amount',                   '1'),
    ('AMPHITHEATER_WRITING_CULTURE_BOOST_MOD',      'GreatWorkObjectType',      'GREATWORKOBJECT_WRITING'),
    ('AMPHITHEATER_WRITING_CULTURE_BOOST_MOD',      'YieldType',                'YIELD_CULTURE'),
    ('AMPHITHEATER_WRITING_CULTURE_BOOST_MOD',      'ScalingFactor',            '200'),
    ('AMPHITHEATER_WRITING_TOURISM_BOOST_MOD',      'GreatWorkObjectType',      'GREATWORKOBJECT_WRITING'),
    ('AMPHITHEATER_WRITING_TOURISM_BOOST_MOD',      'ScalingFactor',            '200'),
    ('AMPHITHEATER_WRITING_CULTURE_BOOST',          'ModifierId',               'AMPHITHEATER_WRITING_CULTURE_BOOST_MOD'),
    ('AMPHITHEATER_WRITING_TOURISM_BOOST',          'ModifierId',               'AMPHITHEATER_WRITING_TOURISM_BOOST_MOD'),
    ('BARRACKS_TRAINED_UNIT_PROMOTION',             'Amount',                   '-1'),
    ('STABLE_TRAINED_UNIT_PROMOTION',               'Amount',                   '-1'),
    ('PLAYERS_HOLY_SITE_FAITH_PURCHASE',            'DistrictType',             'DISTRICT_HOLY_SITE'),
    --('WATER_MILL_DISTRICTS_PRODUCTION',             'ModifierId',               'WATER_MILL_DISTRICTS_PRODUCTION_MOD'),
    ('WATER_MILL_DISTRICTS_PRODUCTION_MOD',         'Amount',                   '2'),
    ('WATER_MILL_DISTRICTS_PRODUCTION_MOD',         'YieldType',                'YIELD_PRODUCTION'),
    ('GRANARY_ADJACENT_GRASS_FOOD',                 'DistrictType',             'DISTRICT_CITY_CENTER'),
    ('GRANARY_ADJACENT_GRASS_FOOD',                 'Amount',                   1),
    ('GRANARY_ADJACENT_GRASS_FOOD',                 'TerrainType',              'TERRAIN_GRASS'),
    ('GRANARY_ADJACENT_GRASS_FOOD',                 'YieldType',                'YIELD_FOOD'),
    ('GRANARY_ADJACENT_GRASS_FOOD',                 'Description',              'LOC_BUILDING_GRANARY_GRASS_FOOD'),
    ('GRANARY_ADJACENT_GRASS_FOOD',                 'TilesRequired',            1),
    ('GRANARY_ADJACENT_PLAINS_FOOD',                'DistrictType',             'DISTRICT_CITY_CENTER'),
    ('GRANARY_ADJACENT_PLAINS_FOOD',                'Amount',                   1),
    ('GRANARY_ADJACENT_PLAINS_FOOD',                'TerrainType',              'TERRAIN_PLAINS'),
    ('GRANARY_ADJACENT_PLAINS_FOOD',                'YieldType',                'YIELD_FOOD'),
    ('GRANARY_ADJACENT_PLAINS_FOOD',                'Description',              'LOC_BUILDING_GRANARY_PLAINS_FOOD'),
    ('GRANARY_ADJACENT_PLAINS_FOOD',                'TilesRequired',            1),
    ('MASON_ADJACENT_GRASS_HILL_PRODUCTION',        'DistrictType',             'DISTRICT_CITY_CENTER'),
    ('MASON_ADJACENT_GRASS_HILL_PRODUCTION',        'Amount',                   '1'),
    ('MASON_ADJACENT_GRASS_HILL_PRODUCTION',        'TerrainType',              'TERRAIN_GRASS_HILLS'),
    ('MASON_ADJACENT_GRASS_HILL_PRODUCTION',        'YieldType',                'YIELD_PRODUCTION'),
    ('MASON_ADJACENT_GRASS_HILL_PRODUCTION',        'Description',              'LOC_BUILDING_MASON_GRASS_HILLS_PRODUCTION'),
    ('MASON_ADJACENT_GRASS_HILL_PRODUCTION',        'TilesRequired',            '1'),

    ('MASON_ADJACENT_PLAINS_HILL_PRODUCTION',       'DistrictType',             'DISTRICT_CITY_CENTER'),
    ('MASON_ADJACENT_PLAINS_HILL_PRODUCTION',       'Amount',                   '1'),
    ('MASON_ADJACENT_PLAINS_HILL_PRODUCTION',       'TerrainType',              'TERRAIN_PLAINS_HILLS'),
    ('MASON_ADJACENT_PLAINS_HILL_PRODUCTION',       'YieldType',                'YIELD_PRODUCTION'),
    ('MASON_ADJACENT_PLAINS_HILL_PRODUCTION',       'Description',              'LOC_BUILDING_MASON_PLAINS_HILLS_PRODUCTION'),
    ('MASON_ADJACENT_PLAINS_HILL_PRODUCTION',       'TilesRequired',            '1'),
    ('GRANARY_FARM_FOOD',                           'Amount',                   '1'),
    ('GRANARY_FARM_FOOD',                           'YieldType',                'YIELD_FOOD'),
    ('MASON_QUARRY_PRODUCTION',                     'Amount',                   '1'),
    ('MASON_QUARRY_PRODUCTION',                     'YieldType',                'YIELD_PRODUCTION');


insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values
    ('CITY_ADJACENT_TO_RIVER_AND_HAS_WATER_MILL',       'REQUIREMENTSET_TEST_ALL'),
    ('RS_RIVER_FARM',                                   'REQUIREMENTSET_TEST_ALL'),
    ('RS_RIVER_PLANTATION',                             'REQUIREMENTSET_TEST_ALL'),
    ('RS_RIVER_LUMBER_MILL',                            'REQUIREMENTSET_TEST_ALL'),
    ('RS_AT_LEAST_4_AMENITIES_AND_HAS_AMPHITHEATER',    'REQUIREMENTSET_TEST_ALL');


insert or ignore into Requirements
    (RequirementId,                                     RequirementType)
values
    ('REQ_RIVER_PLOT',                                  'REQUIREMENT_PLOT_ADJACENT_TO_RIVER'),
    ('HD_REQUIRES_DISTRICT_IS_NOT_DISTRICT_WONDER','REQUIREMENT_DISTRICT_TYPE_MATCHES');
--update Requirements set Inverse = 1 where RequirementId = 'HD_REQUIRES_DISTRICT_IS_NOT_DISTRICT_WONDER';

/*insert or ignore into RequirementArguments
    (RequirementId,                                     Name,                   Value)
values
    ('HD_REQUIRES_DISTRICT_IS_NOT_DISTRICT_WONDER','DistrictType',  'DISTRICT_WONDER');

   */

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ('CITY_ADJACENT_TO_RIVER_AND_HAS_WATER_MILL',       'REQ_RIVER_PLOT'),
    ('CITY_ADJACENT_TO_RIVER_AND_HAS_WATER_MILL',       'REQ_CITY_HAS_BUILDING_WATER_MILL'),

    ('RS_RIVER_FARM',                                   'REQ_PLOT_HAS_IMPROVEMENT_FARM'),
    ('RS_RIVER_FARM',                                   'REQ_RIVER_PLOT'),
    ('RS_RIVER_PLANTATION',                             'REQ_PLOT_HAS_IMPROVEMENT_PLANTATION'),
    ('RS_RIVER_PLANTATION',                             'REQ_RIVER_PLOT'),
    ('RS_RIVER_LUMBER_MILL',                            'REQ_PLOT_HAS_IMPROVEMENT_LUMBER_MILL'),
    ('RS_RIVER_LUMBER_MILL',                            'REQ_RIVER_PLOT'),
    ('RS_AT_LEAST_4_AMENITIES_AND_HAS_AMPHITHEATER',    'REQ_AT_LEAST_4_AMENITIES'),
    ('RS_AT_LEAST_4_AMENITIES_AND_HAS_AMPHITHEATER',    'REQ_CITY_HAS_BUILDING_AMPHITHEATER');
