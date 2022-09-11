

-- 食物和矿物改良 REQ
INSERT OR IGNORE INTO Vocabularies
		(Vocabulary)
VALUES	('IMPROVEMENT_CLASS');

INSERT OR IGNORE INTO Tags
		(Tag,						Vocabulary)
VALUES	('CLASS_FOOD_IMPROVEMENT',	'IMPROVEMENT_CLASS'),
		('CLASS_MINE_IMPROVEMENT',	'IMPROVEMENT_CLASS'),
		('CLASS_MAKE_WINE_IMPROVEMENT', 	  'IMPROVEMENT_CLASS');


INSERT OR IGNORE INTO TypeTags
		(Tag,						Type)
VALUES	('CLASS_FOOD_IMPROVEMENT',	'IMPROVEMENT_FARM'),
		('CLASS_FOOD_IMPROVEMENT',	'IMPROVEMENT_PLANTATION'),
		('CLASS_FOOD_IMPROVEMENT',	'IMPROVEMENT_PASTURE'),
		('CLASS_FOOD_IMPROVEMENT',	'IMPROVEMENT_CAMP'),
		('CLASS_FOOD_IMPROVEMENT',	'IMPROVEMENT_FISHING_BOATS'),
		('CLASS_MINE_IMPROVEMENT',	'IMPROVEMENT_QUARRY'),
		('CLASS_MINE_IMPROVEMENT',	'IMPROVEMENT_MINE'),
		('CLASS_MAKE_WINE_IMPROVEMENT',	'IMPROVEMENT_FARM'),
		('CLASS_MAKE_WINE_IMPROVEMENT',	'IMPROVEMENT_PLANTATION');

insert or replace into Requirements (RequirementId, RequirementType)
values 	('REQ_PLOT_HAS_MINE_IMPROVEMENT',		          'REQUIREMENT_PLOT_IMPROVEMENT_TAG_MATCHES'),
	   	('REQ_PLOT_HAS_FOOD_IMPROVEMENT',		          'REQUIREMENT_PLOT_IMPROVEMENT_TAG_MATCHES'),
	   	
	   	('REQ_PLOT_HAS_MAKE_WINE_IMPROVEMENT',		      'REQUIREMENT_PLOT_IMPROVEMENT_TAG_MATCHES');
	   	
insert or replace into RequirementArguments (RequirementId, Name, Value)
values 	('REQ_PLOT_HAS_MINE_IMPROVEMENT',			'Tag', 		'CLASS_MINE_IMPROVEMENT'),
	   	('REQ_PLOT_HAS_FOOD_IMPROVEMENT',			'Tag', 		'CLASS_FOOD_IMPROVEMENT'),
	   	
	   	('REQ_PLOT_HAS_MAKE_WINE_IMPROVEMENT',		'Tag', 		'CLASS_MAKE_WINE_IMPROVEMENT');

--单元格有某改良 REQ/RS
insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_PLOT_HAS_'||ImprovementType,				'REQUIREMENTSET_TEST_ALL'
from Improvements;
                                   

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_PLOT_HAS_'||ImprovementType,				'REQ_PLOT_HAS_'||ImprovementType
from Improvements;


insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_PLOT_HAS_'||ImprovementType, 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'
from Improvements;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLOT_HAS_'||ImprovementType, 'ImprovementType', ImprovementType
from Improvements;



--玩家有某科技/市政 REQ
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_PLAYER_HAS_'||TechnologyType, 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY'
from Technologies;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLAYER_HAS_'||TechnologyType, 'TechnologyType', TechnologyType
from Technologies;

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_PLAYER_HAS_'||CivicType, 'REQUIREMENT_PLAYER_HAS_CIVIC'
from Civics;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLAYER_HAS_'||CivicType, 'CivicType', CivicType
from Civics;


--城市有某区域 REQ/RS
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||DistrictType, 'REQUIREMENT_CITY_HAS_DISTRICT'
from Districts;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||DistrictType, 'DistrictType', DistrictType
from Districts;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||DistrictType,				'REQUIREMENTSET_TEST_ALL'
from Districts;
                                   
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||DistrictType,				'REQ_CITY_HAS_'||DistrictType
from Districts;


--城市有某建筑 REQ/RS
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||BuildingType, 'REQUIREMENT_CITY_HAS_BUILDING'
from Buildings;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||BuildingType, 'BuildingType', BuildingType
from Buildings;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||BuildingType,				'REQUIREMENTSET_TEST_ALL'
from Buildings;                                

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||BuildingType,				'REQ_CITY_HAS_'||BuildingType
from Buildings;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values	('RS_CITY_HAS_ENCAMPMENT_TIER1',				'REQUIREMENTSET_TEST_ALL');                              

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values	('RS_CITY_HAS_ENCAMPMENT_TIER1',				'REQ_CITY_HAS_BUILDING_BARRACKS'),  
				('RS_CITY_HAS_ENCAMPMENT_TIER1',				'REQ_CITY_HAS_BUILDING_STABLE');                            

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values	('RS_CITY_HAS_HOLY_SITE_TIER3',				'REQUIREMENTSET_TEST_ALL');                              

insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
select 'RS_CITY_HAS_HOLY_SITE_TIER3', 'REQ_CITY_HAS_'||BuildingType from Buildings where EnabledByReligion = 1;


--城市有/无X人口 REQ/RS
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||numbers||'_POPULATION',		'REQUIREMENT_CITY_HAS_X_POPULATION'
from counter where numbers >= 1 and numbers <= 30;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_POPULATION', 'Amount', numbers
from counter where numbers >= 1 and numbers <= 30;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||numbers||'_POPULATION',				'REQUIREMENTSET_TEST_ALL'
from counter where numbers >= 1 and numbers <= 30;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||numbers||'_POPULATION',				'REQ_CITY_HAS_'||numbers||'_POPULATION'
from counter where numbers >= 1 and numbers <= 30;


insert or replace into Requirements (RequirementId, RequirementType,Inverse)
select 'REQ_CITY_NO_'||(numbers-1)||'_POPULATION',		'REQUIREMENT_CITY_HAS_X_POPULATION', 1
from counter where numbers >= 2 and numbers <= 30;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_NO_'||(numbers-1)||'_POPULATION', 'Amount', numbers
from counter where numbers >= 2 and numbers <= 30;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_NO_'||(numbers-1)||'_POPULATION',				'REQUIREMENTSET_TEST_ALL'
from counter where numbers >= 2 and numbers <= 30;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_NO_'||(numbers-1)||'_POPULATION',				'REQ_CITY_NO_'||(numbers-1)||'_POPULATION'
from counter where numbers >= 2 and numbers <= 30;

--城市宜居度-最少1到20/最多0到19 REQ/RS
/*WITH RECURSIVE
  Indices(i) AS (SELECT 0 UNION ALL SELECT (i + 1) FROM Indices LIMIT 10)
insert or replace into Requirements (RequirementId, RequirementType, Inverse)
select 'REQ_AT_LEAST_'||i||'_AMENITIES', 'REQUIREMENT_PLOT_PROPERTY_MATCHES', 0 from Indices
union all
select 'REQ_AT_MOST_'||(i-1)||'_AMENITIES',  'REQUIREMENT_PLOT_PROPERTY_MATCHES', 1 from Indices;

WITH RECURSIVE
  Indices(i) AS (SELECT 0 UNION ALL SELECT (i + 1) FROM Indices LIMIT 10)
insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_AT_LEAST_'||i||'_AMENITIES', 'PropertyName', 'CITY_AMENITY' from Indices
union all
select 'REQ_AT_LEAST_'||i||'_AMENITIES',  'PropertyMinimum', i from Indices
union all
select 'REQ_AT_MOST_'||(i-1)||'_AMENITIES', 'PropertyName', 'CITY_AMENITY' from Indices
union all
select 'REQ_AT_MOST_'||(i-1)||'_AMENITIES',  'PropertyMinimum', i from Indices; */

insert or replace into Requirements (RequirementId, RequirementType, Inverse)
select 'REQ_AT_MOST_'||(numbers-1)||'_AMENITIES', 'REQUIREMENT_PLOT_PROPERTY_MATCHES', 1
from counter where numbers >= -15 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_AT_MOST_'||(numbers-1)||'_AMENITIES', 'PropertyMinimum', numbers
from counter where numbers >= -15 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_AT_MOST_'||(numbers-1)||'_AMENITIES', 'PropertyName', 'CITY_AMENITY'
from counter where numbers >= -15 and numbers <= 20;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_AT_MOST_'||(numbers-1)||'_AMENITIES',				'REQUIREMENTSET_TEST_ALL'
from counter where numbers >= -15 and numbers <= 20;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_AT_MOST_'||(numbers-1)||'_AMENITIES',				'REQ_AT_MOST_'||(numbers-1)||'_AMENITIES'
from counter where numbers >= -15 and numbers <= 20;


insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_AT_LEAST_'||numbers||'_AMENITIES', 'REQUIREMENT_PLOT_PROPERTY_MATCHES'
from counter where numbers >= 1 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_AT_LEAST_'||numbers||'_AMENITIES', 'PropertyMinimum', numbers
from counter where numbers >= 1 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_AT_LEAST_'||numbers||'_AMENITIES', 'PropertyName', 'CITY_AMENITY'
from counter where numbers >= 1 and numbers <= 20;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_AT_LEAST_'||numbers||'_AMENITIES',				'REQUIREMENTSET_TEST_ALL'
from counter where numbers >= 1 and numbers <= 20;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_AT_LEAST_'||numbers||'_AMENITIES',				'REQ_AT_LEAST_'||numbers||'_AMENITIES'
from counter where numbers >= 1 and numbers <= 20;


-- 区域有1-20相邻 REQ/RS

create table "DA_District_Yields" (
'DistrictType' TEXT NOT NULL,
'YieldType' TEXT NOT NULL,
'Amount' INTEGER NOT NULL,
PRIMARY KEY(DistrictType, YieldType)
);

insert into DA_District_Yields
	(DistrictType,							YieldType,					Amount) values 
	('DISTRICT_CAMPUS',					'YIELD_SCIENCE',		1),
	('DISTRICT_COMMERCIAL_HUB',	'YIELD_GOLD',				3),
	('DISTRICT_ENCAMPMENT',			'YIELD_PRODUCTION',	1),
	('DISTRICT_ENCAMPMENT',			'YIELD_FOOD',				1),
	('DISTRICT_HOLY_SITE',			'YIELD_FAITH',		  2),
	('DISTRICT_THEATER',				'YIELD_CULTURE',		1),
	('DISTRICT_INDUSTRIAL_ZONE','YIELD_PRODUCTION',	1),
	('DISTRICT_HARBOR',					'YIELD_GOLD',				3),
	('DISTRICT_HARBOR',					'YIELD_FOOD',				1);

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType,		'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType, 'Amount', numbers
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType, 'YieldType', YieldType
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType, 'DistrictType', DistrictType
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||numbers||'_ADJACENCY_'||DistrictType,					'REQUIREMENTSET_TEST_ANY'
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||numbers||'_ADJACENCY_'||DistrictType,				'REQ_CITY_HAS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;


--单位是某类型 REQ/RS

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_UNIT_IS_'||Tag, 'REQUIREMENT_UNIT_TAG_MATCHES'
from Tags where Vocabulary = 'ABILITY_CLASS';

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_UNIT_IS_'||Tag, 'Tag', Tag
from Tags where Vocabulary = 'ABILITY_CLASS';

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_UNIT_IS_'||Tag,						'REQUIREMENTSET_TEST_ALL'
from Tags where Vocabulary = 'ABILITY_CLASS';
                                   
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_UNIT_IS_'||Tag,				'REQ_UNIT_IS_'||Tag
from Tags where Vocabulary = 'ABILITY_CLASS';


--对象离自己1-10格 REQ/RS

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_OBJECT_WITHIN_'||numbers||'_TILES', 'REQUIREMENT_PLOT_ADJACENT_TO_OWNER'
from counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_OBJECT_WITHIN_'||numbers||'_TILES', 'MinDistance', '0'
from counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_OBJECT_WITHIN_'||numbers||'_TILES', 'MaxDistance', numbers
from counter where numbers >= 1 and numbers <= 10;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_OBJECT_WITHIN_'||numbers||'_TILES',				'REQUIREMENTSET_TEST_ALL'
from counter where numbers >= 1 and numbers <= 10;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_OBJECT_WITHIN_'||numbers||'_TILES',				'REQ_OBJECT_WITHIN_'||numbers||'_TILES'
from counter where numbers >= 1 and numbers <= 10;

--某格是某地形  REQ/RS

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_PLOT_IS_'||TerrainType, 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES'
from Terrains;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLOT_IS_'||TerrainType, 'TerrainType', TerrainType
from Terrains;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_PLOT_IS_'||TerrainType,						'REQUIREMENTSET_TEST_ALL'
from Terrains;
                                   
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_PLOT_IS_'||TerrainType,						'REQ_PLOT_IS_'||TerrainType
from Terrains;


--城市至少有几格某地形  REQ/RS  --警告：这个req很有可能刷新频率低，特别是数全国格子数量的时候

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainType, 'REQUIREMENT_COLLECTION_COUNT_ATLEAST'
from Terrains, counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainType, 'CollectionType', 'COLLECTION_CITY_PLOT_YIELDS'
from Terrains, counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainType, 'Count', numbers
from Terrains, counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainType, 'RequirementSetId', 'RS_PLOT_IS_'||TerrainType
from Terrains, counter where numbers >= 1 and numbers <= 10;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||numbers||'_'||TerrainType,						'REQUIREMENTSET_TEST_ALL'
from Terrains, counter where numbers >= 1 and numbers <= 10;
                                   
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||numbers||'_'||TerrainType,						'REQ_CITY_HAS_'||numbers||'_'||TerrainType
from Terrains, counter where numbers >= 1 and numbers <= 10;




--某格是某类地形 官方定义了山和五种气候类的地形 实际上我还在地形文件定义了平坦和丘陵类 REQ/RS

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_PLOT_IS_'||TerrainClassType, 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES'
from TerrainClasses;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLOT_IS_'||TerrainClassType, 'TerrainClass', TerrainClassType
from TerrainClasses;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_PLOT_IS_'||TerrainClassType,						'REQUIREMENTSET_TEST_ALL'
from TerrainClasses;
                                   
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_PLOT_IS_'||TerrainClassType,						'REQ_PLOT_IS_'||TerrainClassType
from TerrainClasses;


--城市至少有几格某类地形  REQ/RS  --警告：这个req很有可能刷新频率低，特别是数全国格子数量的时候

insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainClassType, 'REQUIREMENT_COLLECTION_COUNT_ATLEAST'
from TerrainClasses, counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainClassType, 'CollectionType', 'COLLECTION_CITY_PLOT_YIELDS'
from TerrainClasses, counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainClassType, 'Count', numbers
from TerrainClasses, counter where numbers >= 1 and numbers <= 10;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_'||TerrainClassType, 'RequirementSetId', 'RS_PLOT_IS_'||TerrainClassType
from TerrainClasses, counter where numbers >= 1 and numbers <= 10;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||numbers||'_'||TerrainClassType,						'REQUIREMENTSET_TEST_ALL'
from TerrainClasses, counter where numbers >= 1 and numbers <= 10;
                                   
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||numbers||'_'||TerrainClassType,						'REQ_CITY_HAS_'||numbers||'_'||TerrainClassType
from TerrainClasses, counter where numbers >= 1 and numbers <= 10;



--城市有信教/不信教 REQ/RS
INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,     RequirementSetType) 	VALUES
('RS_CITY_FOLLOWS_RELIGION' , 			'REQUIREMENTSET_TEST_ALL'),
('RS_CITY_NO_RELIGION' , 		'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,   RequirementId) 			VALUES
('RS_CITY_FOLLOWS_RELIGION' , 'REQ_CITY_FOLLOWS_RELIGION'),
('RS_CITY_NO_RELIGION' , 		  'REQ_CITY_NO_RELIGION');
 
INSERT OR REPLACE INTO 		Requirements (RequirementId,				   RequirementType) VALUES		
('REQ_CITY_FOLLOWS_RELIGION',                      'REQUIREMENT_CITY_FOLLOWS_RELIGION');

INSERT OR REPLACE INTO 		Requirements (RequirementId,				   RequirementType,			             Inverse) VALUES		
('REQ_CITY_NO_RELIGION',                  'REQUIREMENT_CITY_FOLLOWS_RELIGION', 1);

--城市有xx改良 REQ/RS
insert or ignore into RequirementArguments (RequirementId, Name, Value)
	select 'REQ_CITY_HAS_IMPROVED_' || ResourceType, 'ResourceType', ResourceType from Resources;

insert or ignore into Requirements (RequirementId, RequirementType)
	select 'REQ_CITY_HAS_IMPROVED_' || ResourceType, 'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED' from Resources;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_IMPROVED_' || ResourceType,						'REQUIREMENTSET_TEST_ALL'
from Resources;        
                           
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_IMPROVED_' || ResourceType,						'REQ_CITY_HAS_IMPROVED_' || ResourceType
from Resources;


insert or ignore into RequirementArguments (RequirementId, Name, Value)
	select 'REQ_PLOT_APPEAL_' || numbers, 'MaximumAppeal', numbers from counter where numbers >= -4 and numbers <= 20;

insert or ignore into RequirementArguments (RequirementId, Name, Value)
	select 'REQ_PLOT_APPEAL_' || numbers, 'MinimumAppeal', numbers from counter where numbers >= -4 and numbers <= 20;

insert or ignore into Requirements (RequirementId, RequirementType)
	select 'REQ_PLOT_APPEAL_' || numbers, 'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN' 
from counter where numbers >= -4 and numbers <= 20;


-- PLOT_ADJACENT_TO_RIVER_REQUIREMENTS

--某格有xx地形/地貌  REQ
insert or ignore into RequirementArguments (RequirementId, Name, Value)
	select 'REQ_IS_' || TerrainType, 'TerrainType', TerrainType from Terrains;

insert or ignore into Requirements (RequirementId, RequirementType)
	select 'REQ_IS_' || TerrainType, 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES' from Terrains;


insert or ignore into RequirementArguments (RequirementId, Name, Value)
	select 'REQ_IS_' || FeatureType, 'FeatureType', FeatureType from Features;

insert or ignore into Requirements (RequirementId, RequirementType)
	select 'REQ_IS_' || FeatureType, 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES' from Features;


--水相关 REQ/RS
insert or replace into RequirementSets 				(RequirementSetId ,     RequirementSetType) 	values
('RS_IS_FRESH' , 										'REQUIREMENTSET_TEST_ALL'),
('RS_NOT_FRESH' , 									'REQUIREMENTSET_TEST_ALL'),
('RS_IS_COASTAL_LAND' , 						'REQUIREMENTSET_TEST_ALL'),
('RS_NEAR_COAST' , 									'REQUIREMENTSET_TEST_ANY'),
('RS_NO_WATER' , 										'REQUIREMENTSET_TEST_ALL');
--('RS_HAS_WATER' , 									'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements 	(RequirementSetId ,   RequirementId) 			values
('RS_IS_FRESH' , 		'REQ_IS_FRESH'),
('RS_NOT_FRESH' , 	'REQ_NOT_FRESH'),
('RS_IS_COASTAL_LAND' , 'REQ_IS_COASTAL_LAND'),
('RS_NEAR_COAST' , 	'REQ_IS_COAST'),
('RS_NEAR_COAST' , 	'REQ_IS_COASTAL_LAND'),
('RS_NO_WATER' , 		'REQ_NOT_FRESH'),
('RS_NO_WATER' , 		'REQ_NOT_COASTAL_LAND'),
('RS_NO_WATER' , 		'REQ_NOT_COAST'),
('RS_NO_WATER' , 		'REQ_NOT_OCEAN');

insert or replace into		Requirements (RequirementId,				   RequirementType, Inverse) values		
('REQ_IS_FRESH',                      'REQUIREMENT_PLOT_IS_FRESH_WATER',			0),
('REQ_NOT_FRESH',                     'REQUIREMENT_PLOT_IS_FRESH_WATER',			1),
('REQ_IS_COAST',                      'REQUIREMENT_PLOT_IS_COAST',						0),
('REQ_IS_COASTAL_LAND',               'REQUIREMENT_PLOT_IS_COASTAL_LAND',			0),
('REQ_NOT_COASTAL_LAND',              'REQUIREMENT_PLOT_IS_COASTAL_LAND',			1),
('REQ_NOT_COAST',              				'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	1),
('REQ_NOT_OCEAN',              				'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	1);


insert or replace into RequirementArguments (RequirementId, Name, Value) values
('REQ_NOT_COAST',                      'TerrainType',						'TERRAIN_COAST'),
('REQ_NOT_OCEAN',                      'TerrainType',						'TERRAIN_OCEAN');


--地块有某区域  RS/REQ
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_PLOT_HAS_'||DistrictType, 'REQUIREMENT_DISTRICT_TYPE_MATCHES'
from Districts;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLOT_HAS_'||DistrictType, 'DistrictType', DistrictType
from Districts;


insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_PLOT_HAS_'||DistrictType,				'REQUIREMENTSET_TEST_ALL'
from Districts;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_PLOT_HAS_'||DistrictType,				'REQ_PLOT_HAS_'||DistrictType
from Districts;


--地块工作人口  RS/REQ
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_PLOT_HAS_'||numbers||'_WORKERS', 'REQUIREMENT_PLOT_PROPERTY_MATCHES'
from counter where numbers >= 0 and numbers <= 8;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLOT_HAS_'||numbers||'_WORKERS', 'PropertyMinimum', numbers
from counter where numbers >= 0 and numbers <= 8;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_PLOT_HAS_'||numbers||'_WORKERS', 'PropertyName', 'WORKER_COUNT'
from counter where numbers >= 0 and numbers <= 8;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_PLOT_HAS_'||numbers||'_WORKERS',				'REQUIREMENTSET_TEST_ALL'
from counter where numbers >= 0 and numbers <= 8;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_PLOT_HAS_'||numbers||'_WORKERS',				'REQ_PLOT_HAS_'||numbers||'_WORKERS'
from counter where numbers >= 0 and numbers <= 8;


insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_'||DistrictType||'_HAS_'||numbers||'_WORKERS',				'REQUIREMENTSET_TEST_ALL'
from counter, Districts where numbers >= 0 and numbers <= 8;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_'||DistrictType||'_HAS_'||numbers||'_WORKERS',				'REQ_PLOT_HAS_'||numbers||'_WORKERS'
from counter, Districts where numbers >= 0 and numbers <= 8;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_'||DistrictType||'_HAS_'||numbers||'_WORKERS',				'REQ_PLOT_HAS_'||DistrictType
from counter, Districts where numbers >= 0 and numbers <= 8;

--区域相邻加成FIX  RS/REQ
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_IS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType||'_FIX',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_IS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType||'_FIX', 'PropertyName', 'ADJACENCY_'||YieldType
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_IS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType||'_FIX', 'PropertyMinimum', numbers
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;


insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_IS_'||numbers||'_ADJACENCY_'||DistrictType||'_FIX',					'REQUIREMENTSET_TEST_ALL'
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_IS_'||numbers||'_ADJACENCY_'||DistrictType||'_FIX',				'REQ_IS_'||numbers||'_ADJACENCY_'||YieldType||'_'||DistrictType||'_FIX'
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_IS_'||numbers||'_ADJACENCY_'||DistrictType||'_FIX',				'REQ_PLOT_HAS_'||DistrictType
from counter CROSS JOIN DA_District_Yields where numbers >= 1 and numbers <= 20;


--城市有几个专业区域  REQ/RS
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||numbers||'_DISTRICTS', 'REQUIREMENT_CITY_HAS_X_SPECIALTY_DISTRICTS'
from counter where numbers >= 1 and numbers <= 8;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||numbers||'_DISTRICTS', 'Amount', numbers
from counter where numbers >= 1 and numbers <= 8;


insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||numbers||'_DISTRICTS',				'REQUIREMENTSET_TEST_ALL'
from counter where numbers >= 1 and numbers <= 8;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||numbers||'_DISTRICTS',				'REQ_CITY_HAS_'||numbers||'_DISTRICTS'
from counter where numbers >= 1 and numbers <= 8;
