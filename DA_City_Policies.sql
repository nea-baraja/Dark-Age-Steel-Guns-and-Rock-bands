
insert or replace into Types
	(Type,										Kind)
values
	('GRANT_BUILDING_TO_ALL_CITIES_IGNORE',		'KIND_MODIFIER');

insert or replace into DynamicModifiers
	(ModifierType,							CollectionType,				EffectType)
values
	('GRANT_BUILDING_TO_ALL_CITIES_IGNORE', 'COLLECTION_PLAYER_CITIES', 'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE');
-------------------------------------



create table 'CityPolicies'(
	'CityPolicy' TEXT NOT NULL,
	'PolicyClass' TEXT NOT NULL,
	'BuildingType' TEXT,
	'EnableProjectType' TEXT,
	'DisableProjectType' TEXT,
	'EnableCivicType' TEXT,
	'EnableTechType' TEXT,
	'EnableCost' INT NOT NULL,
	'DisableCost' INT NOT NULL,
	'PreDistrict' TEXT,
	'PreBuilding' TEXT,
	PRIMARY KEY('CityPolicy')
);

insert or replace into CityPolicies
(CityPolicy,	            PolicyClass,	  EnableCivicType,			         EnableTechType,		    EnableCost,	DisableCost,	PreDistrict,		PreBuilding) values
--城市
('FOOD_TAX',	            'TAX',			  'CIVIC_EARLY_EMPIRE',		         NULL,			            10,			10,				NULL,				NULL),
('LABOR_TAX',	            'TAX',			  'CIVIC_STATE_WORKFORCE',	         NULL,			            10,			10,				NULL,				NULL),
('MINE_TAX',	            'TAX',			  'CIVIC_EARLY_EMPIRE',		         NULL,			            10,			10,				NULL,				NULL),
('LUXURY_TAX',	            'TAX',			  'CIVIC_EARLY_EMPIRE',		         NULL,			            10,			10,				NULL,				NULL),
('EMPTY_TAX',	            'TAX',			  'CIVIC_EARLY_EMPIRE',		         NULL,			            10,			10,				NULL,				NULL),

--沿岸海事
('COASTAL_FISHING',         'COASTAL_MARITIME',	NULL,		                     'TECH_SAILING',	        30,			10,			    NULL,				NULL),
('SEA_SALT',	        	'COASTAL_MARITIME',	NULL,		                     'TECH_SAILING',    		30,			10,			    NULL,				NULL),
('EMPTY_COASTAL_MARITIME',	'COASTAL_MARITIME', NULL,		                     NULL,		    			10,			10,			    NULL,				NULL),


--粮仓
('MAKE_WINE',           	'GRAIN_USE',	  NULL,		                         'TECH_POTTERY',	        20,			10,			    NULL,				'BUILDING_GRANARY'),
('WATER_TRANSPORT',	        'GRAIN_USE',	  NULL,		                         'TECH_ENGINEERING',    	20,			10,			    NULL,				'BUILDING_GRANARY'),
('EMPTY_GRAIN_USE',	        'GRAIN_USE',	  NULL,		                         'TECH_POTTERY',		    10,			10,			    NULL,				'BUILDING_GRANARY'),

--石工坊
('MARBLE_CITY',           	'MASONRY',	 	  NULL,		                         'TECH_MASONRY',	        20,			10,			    NULL,				'BUILDING_MASON'),
('BRICK_CITY',	        	'MASONRY',	  	  NULL,		                         'TECH_MASONRY',    		20,			10,			    NULL,				'BUILDING_MASON'),
('EMPTY_MASONRY',	        'MASONRY',	      NULL,		                         NULL,		    			10,			10,			    NULL,				'BUILDING_MASON'),

--图书馆
('REVISION_CALENDAR',	    'LIBRARY',		  NULL,		                         'TECH_ASTROLOGY',			10,			10,				'DISTRICT_CAMPUS',	'BUILDING_LIBRARY'),
('HISTORY_BOOKS',	        'LIBRARY',		  'CIVIC_RECORDED_HISTORY',	         NULL,			      	    10,			10,				'DISTRICT_CAMPUS',	'BUILDING_LIBRARY'),
('COLLECT_SCRIPTURES',	    'LIBRARY',		  'CIVIC_THEOLOGY',                  NULL,			      	    10,			10,				'DISTRICT_CAMPUS',	'BUILDING_LIBRARY'),
('EMPTY_LIBRARY',	        'LIBRARY',		  NULL,		                         'TECH_ASTROLOGY',			10,			10,				'DISTRICT_CAMPUS',	'BUILDING_LIBRARY'),

--古罗马剧场
('HEROIC_LEGEND',	        'PLAYS',		  'CIVIC_RECORDED_HISTORY',		     NULL,			            10,			10,				'DISTRICT_THEATER',	'BUILDING_AMPHITHEATER'),
('MYTHS_LEGENDS',       	'PLAYS',		  'CIVIC_MYSTICISM',		         NULL,			            10,			10,				'DISTRICT_THEATER',	'BUILDING_AMPHITHEATER'),
('EMPTY_PLAYS',	            'PLAYS',		  'CIVIC_MYSTICISM',			     NULL,				        10,			10,				'DISTRICT_THEATER',	'BUILDING_AMPHITHEATER'),

--神社
('PRAY_FOR_RAIN',	        'SACRIFICE',		NULL,							 'TECH_IRRIGATION',		    20,			10,				'DISTRICT_HOLY_SITE',	'BUILDING_SHRINE'),
('DIVINE',       			'SACRIFICE',		NULL,		       				 'TECH_ARCHERY',			20,			10,				'DISTRICT_HOLY_SITE',	'BUILDING_SHRINE'),
('SEA_SACRIFICE',	        'SACRIFICE',		NULL,			     			 'TECH_SAILING',			20,			10,				'DISTRICT_HOLY_SITE',	'BUILDING_SHRINE'),
('EMPTY_SACRIFICE',	        'SACRIFICE',		NULL,			     			 NULL,				        10,			10,				'DISTRICT_HOLY_SITE',	'BUILDING_SHRINE'),

--竞技场
('OLYMPIC',	           	    'ARENA',		  'CIVIC_MYSTICISM',		         NULL,			     	    10,			10,				'DISTRICT_ENTERTAINMENT_COMPLEX',	'BUILDING_ARENA'),
('SLAVE_GLADIATUS',    	    'ARENA',		  'CIVIC_GAMES_RECREATION',	         NULL,			     	    10,			10,				'DISTRICT_ENTERTAINMENT_COMPLEX',	'BUILDING_ARENA'),
('CHIVALRY',      	   	    'ARENA',		  'CIVIC_MERCENARIES',               NULL,			      	    10,			10,				'DISTRICT_ENTERTAINMENT_COMPLEX',	'BUILDING_ARENA'),
('EMPTY_ARENA',     	    'ARENA',		  'CIVIC_MYSTICISM',			     NULL,				  	    10,			10,				'DISTRICT_ENTERTAINMENT_COMPLEX',	'BUILDING_ARENA'),

--兵营
('IRON_SMELTING',	        'BARRACK',		  NULL,		                         'TECH_IRON_WORKING',		10,			10,				'DISTRICT_ENCAMPMENT',	'BUILDING_BARRACKS'),
('EMPTY_BARRACK',	        'BARRACK',		  NULL,		                         'TECH_IRON_WORKING',		10,			10,				'DISTRICT_ENCAMPMENT',	'BUILDING_BARRACKS'),

--马厩
('WAR_HORSE',    	        'STABLED',		  NULL,		                         'TECH_HORSEBACK_RIDING',	10,			10,				'DISTRICT_ENCAMPMENT',	'BUILDING_STABLE'),
('EMPTY_STABLED',	        'STABLED',		  NULL,		                         'TECH_HORSEBACK_RIDING',	10,			10,				'DISTRICT_ENCAMPMENT',	'BUILDING_STABLE');


--根据表格生成城市政策的建筑/开启项目/关闭项目
update CityPolicies set
	BuildingType 			= 'BUILDING_CITY_POLICY_' || CityPolicy,
	EnableProjectType 		= 'PROJECT_CITY_POLICY_ENABLE_' || CityPolicy,
	DisableProjectType 		= 'PROJECT_CITY_POLICY_DISABLE_' || CityPolicy;

insert or replace into Types (Type, Kind) select BuildingType, 'KIND_BUILDING' from CityPolicies;
insert or replace into Types (Type, Kind) select EnableProjectType, 'KIND_PROJECT' from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into Types (Type, Kind) select DisableProjectType, 'KIND_PROJECT' from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';

insert or replace into Buildings (BuildingType,	Name,	Cost,	Description,	PrereqDistrict,	MustPurchase)
select BuildingType, 'LOC_'||BuildingType||'_NAME',		1, 		'LOC_'||BuildingType||'_DESCRIPTION',	PreDistrict,	1
from CityPolicies;

insert or replace into Buildings_XP2 (BuildingType, Pillage)
select BuildingType, 0 from CityPolicies;

update Buildings set Maintenance = 6 where BuildingType = 'BUILDING_CITY_POLICY_REVISION_CALENDAR';
update Buildings set Maintenance = 6 where BuildingType = 'BUILDING_CITY_POLICY_HISTORY_BOOKS';
update Buildings set Maintenance = 6 where BuildingType = 'BUILDING_CITY_POLICY_COLLECT_SCRIPTURES';
update Buildings set Maintenance = 2 where BuildingType = 'BUILDING_CITY_POLICY_PRAY_FOR_RAIN';
update Buildings set Maintenance = 2 where BuildingType = 'BUILDING_CITY_POLICY_SEA_SACRIFICE';
update Buildings set Maintenance = 2 where BuildingType = 'BUILDING_CITY_POLICY_DIVINE';

--送空税务政策到每座城
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
SELECT  'TRAIT_LEADER_MAJOR_CIV',	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER' 
FROM CityPolicies WHERE CityPolicy IS 'EMPTY_TAX';

insert or replace into TraitModifiers
	(TraitType,					ModifierId)
SELECT  'MINOR_CIV_DEFAULT_TRAIT',	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER' 
FROM CityPolicies WHERE CityPolicy IS 'EMPTY_TAX';

insert or replace into Modifiers
	(ModifierId,								ModifierType)
select
	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER', 'GRANT_BUILDING_TO_ALL_CITIES_IGNORE'
	FROM CityPolicies WHERE CityPolicy IS 'EMPTY_TAX';

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
select
	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER', 'BuildingType', BuildingType
FROM CityPolicies WHERE CityPolicy IS 'EMPTY_TAX';

--送空建筑政策到每座城
insert or replace into BuildingModifiers(BuildingType,		ModifierId)
select PreBuilding,		'DA_'||PreBuilding||'_EMPTY_POLICY' 
from CityPolicies where CityPolicy like 'EMPTY%' and PreBuilding is not null;

insert or replace into Modifiers(ModifierId,	ModifierType)
	select 'DA_'||PreBuilding||'_EMPTY_POLICY',		'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE'
from CityPolicies where CityPolicy like 'EMPTY%' and PreBuilding is not null;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'DA_'||PreBuilding||'_EMPTY_POLICY',		'BuildingType',		'BUILDING_CITY_POLICY_' || CityPolicy
from CityPolicies where CityPolicy like 'EMPTY%' and PreBuilding is not null;

--送空沿岸海事政策到每座城
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
SELECT  'TRAIT_LEADER_MAJOR_CIV',	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER' 
FROM CityPolicies WHERE CityPolicy IS 'EMPTY_COASTAL_MARITIME';

insert or replace into TraitModifiers
	(TraitType,					ModifierId)
SELECT  'MINOR_CIV_DEFAULT_TRAIT',	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER' 
FROM CityPolicies WHERE CityPolicy IS 'EMPTY_COASTAL_MARITIME';

insert or replace into Modifiers
	(ModifierId,								ModifierType,			SubjectRequirementSetId)
select
	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER', 'GRANT_BUILDING_TO_ALL_CITIES_IGNORE',		'RS_IS_COASTAL_LAND'
	FROM CityPolicies WHERE CityPolicy IS 'EMPTY_COASTAL_MARITIME';

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
select
	'TRAIT_GRANT_'||CityPolicy||'_MODIFIER', 'BuildingType', BuildingType
FROM CityPolicies WHERE CityPolicy IS 'EMPTY_COASTAL_MARITIME';


--项目定义
insert or replace into Projects
	(ProjectType, Name, ShortName, Description, Cost, PrereqCivic, PrereqTech, AdvisorType, PrereqDistrict)
select
	EnableProjectType,
	'LOC_'||EnableProjectType||'_NAME',
	'LOC_'||EnableProjectType||'_SHORT_NAME',
	'LOC_'||EnableProjectType||'_DESCRIPTION',
	EnableCost,
	EnableCivicType,
	EnableTechType,
	'ADVISOR_GENERIC',
	PreDistrict
from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';

insert or replace into Projects
	(ProjectType, Name, ShortName, Description, Cost, PrereqCivic, PrereqTech, AdvisorType)
select
	DisableProjectType,
	'LOC_'||DisableProjectType||'_NAME',
	'LOC_'||DisableProjectType||'_SHORT_NAME',
	'LOC_'||DisableProjectType||'_DESCRIPTION',
	DisableCost,
	NULL,
	NULL,
	'ADVISOR_GENERIC'
from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';

--ENABLE PROJECTS
insert or replace into Project_BuildingCosts
	(ProjectType,			ConsumedBuildingType)
select
	EnableProjectType,		'BUILDING_CITY_POLICY_EMPTY_' || PolicyClass
from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into Projects_XP2
	(ProjectType,			RequiredBuilding,				CreateBuilding)
select
	EnableProjectType,		'BUILDING_CITY_POLICY_EMPTY_' || PolicyClass,			BuildingType
from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';

--DISABLE PROJECTS
insert or replace into Projects_XP2
	(ProjectType,			RequiredBuilding,				CreateBuilding)
select
	DisableProjectType,		BuildingType,					'BUILDING_CITY_POLICY_EMPTY_' || PolicyClass
from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into Project_BuildingCosts
	(ProjectType,			ConsumedBuildingType)
select
	DisableProjectType,		BuildingType
from CityPolicies where CityPolicy NOT LIKE 'EMPTY%';

insert or replace into MutuallyExclusiveBuildings (Building, MutuallyExclusiveBuilding)
select a.BuildingType, b.BuildingType from CityPolicies a, CityPolicies b where a.BuildingType != b.BuildingType and a.PolicyClass = b.PolicyClass;



--城市政策效果
insert or replace into BuildingModifiers 
	(BuildingType,								                ModifierId)
values 
--城市
	('BUILDING_CITY_POLICY_FOOD_TAX',		                	'DA_FOOD_TAX_GOLD'),
	('BUILDING_CITY_POLICY_FOOD_TAX',		                	'DA_FOOD_TAX_FOOD'),
	('BUILDING_CITY_POLICY_FOOD_TAX',		                	'DA_FOOD_TAX_EXTRA_GOLD'),

	('BUILDING_CITY_POLICY_MINE_TAX',		                	'DA_MINE_TAX_GOLD'),
	('BUILDING_CITY_POLICY_MINE_TAX',		                	'DA_MINE_TAX_PRODUCTION'),
	('BUILDING_CITY_POLICY_MINE_TAX',		                	'DA_MINE_TAX_EXTRA_GOLD'),

	('BUILDING_CITY_POLICY_LABOR_TAX',		                	'DA_LABOR_TAX_BUILDER_PRODUCTION'),
	('BUILDING_CITY_POLICY_LABOR_TAX',		                	'DA_LABOR_TAX_AMENITY'),

	('BUILDING_CITY_POLICY_LUXURY_TAX',		                	'DA_LUXURY_TAX_RESOURCE_AMENITY'),
	('BUILDING_CITY_POLICY_LUXURY_TAX',			                'DA_LUXURY_TAX_GOLD_DEBUFF'),
	('BUILDING_CITY_POLICY_LUXURY_TAX',			                'DA_LUXURY_TAX_LESS_GOLD_DEBUFF'),


--沿岸海事
	--('BUILDING_CITY_POLICY_COASTAL_FISHING',		            'DA_COASTAL_FISHING_FOOD'),
	('BUILDING_CITY_POLICY_SEA_SALT',		                	'DA_SEA_SALT_GOLD'),

--粮仓  --能力重做
	/*('BUILDING_CITY_POLICY_MAKE_WINE',		                	'DA_MAKE_WINE_LESS_FOOD_DEBUFF'),
	('BUILDING_CITY_POLICY_MAKE_WINE',		                	'DA_MAKE_WINE_GOLD'), --条件集我不知道是否成功   --e-应该没问题
	('BUILDING_CITY_POLICY_MAKE_WINE',		                	'DA_MAKE_WINE_GOLD_AMENITIES'), --同上	
	
	('BUILDING_CITY_POLICY_WATER_TRANSPORT',		        	'DA_WATER_TRANSPORT_FOOD_BUFF'), --同样是条件集
	('BUILDING_CITY_POLICY_WATER_TRANSPORT',		        	'DA_WATER_TRANSPORT_GOLD_DEBUFF'),
	('BUILDING_CITY_POLICY_WATER_TRANSPORT',		        	'DA_WATER_TRANSPORT_FOOD_DEBUFF'),
	('BUILDING_CITY_POLICY_WATER_TRANSPORT',			        'DA_WATER_TRANSPORT_LESS_GOLD_DEBUFF'),*/

	('BUILDING_CITY_POLICY_MAKE_WINE',		                	'DA_MAKE_WINE_AMENITIES'),	
	('BUILDING_CITY_POLICY_MAKE_WINE',		                	'DA_MAKE_WINE_COST_FOOD'),	

	('BUILDING_CITY_POLICY_WATER_TRANSPORT',		        	'DA_WATER_TRANSPORT_SUPPLY_FOOD'),
	('BUILDING_CITY_POLICY_WATER_TRANSPORT',		        	'DA_WATER_TRANSPORT_COST_FOOD'),

--石工坊
	('BUILDING_CITY_POLICY_MARBLE_CITY',		                'DA_MARBLE_CITY_AMENITIES'),	
	('BUILDING_CITY_POLICY_MARBLE_CITY',		                'DA_MARBLE_CITY_COST_PRODUCTION'),	

	('BUILDING_CITY_POLICY_BRICK_CITY',		                	'DA_BRICK_CITY_HOUSING'),	
	('BUILDING_CITY_POLICY_BRICK_CITY',		                	'DA_BRICK_CITY_COST_PRODUCTION'),	


--图书馆
	('BUILDING_CITY_POLICY_REVISION_CALENDAR',		        	'DA_REVISION_CALENDAR_SCIENCE'), --未写城市有3格山脉加2瓶  --e 现在加在条件文件了
	('BUILDING_CITY_POLICY_REVISION_CALENDAR',		        	'DA_REVISION_CALENDAR_SCIENCE_EXTRA'), 
	--('BUILDING_CITY_POLICY_REVISION_CALENDAR',		        	'DA_REVISION_CALENDAR_GOLD_DEBUFF'),
	('BUILDING_CITY_POLICY_HISTORY_BOOKS',		        	    'DA_HISTORY_BOOKS_CULTURE'), --未写首都或有市政广场加2琴  --现在加了
	('BUILDING_CITY_POLICY_HISTORY_BOOKS',		        	    'DA_HISTORY_BOOKS_CULTURE_EXTRA'),
	--('BUILDING_CITY_POLICY_HISTORY_BOOKS',			            'DA_REVISION_CALENDAR_GOLD_DEBUFF'), --效果一致，我就直接引用了
	('BUILDING_CITY_POLICY_COLLECT_SCRIPTURES',		        	'DA_COLLECT_SCRIPTURES_FAITH'),
	--('BUILDING_CITY_POLICY_COLLECT_SCRIPTURES',			        'DA_REVISION_CALENDAR_GOLD_DEBUFF'), --同上
	('BUILDING_CITY_POLICY_COLLECT_SCRIPTURES',			        'DA_COLLECT_SCRIPTURES_FAITH_DISTRICT'),

/*--古罗马剧场
	('BUILDING_CITY_POLICY_HEROIC_LEGEND',			            'DA_HEROIC_LEGEND_ADJACENT'), -- 这个的modi我还没用过
	('BUILDING_CITY_POLICY_HEROIC_LEGEND',		        	    'DA_HEROIC_LEGEND_GOLD_DEBUFF'),  --未写伟人激活
	('BUILDING_CITY_POLICY_MYTHS_LEGENDS',			            'DA_MYTHS_LEGENDS_ADJACENT'),   --未写有主流宗教不再生效 --OK
	('BUILDING_CITY_POLICY_MYTHS_LEGENDS',			            'DA_MYTHS_LEGENDS_GOLD_DEBUFF'),  
*/
--神社
	('BUILDING_CITY_POLICY_PRAY_FOR_RAIN',			            'DA_PRAY_FOR_RAIN_NO_WATER_FAITH'),
	--('BUILDING_CITY_POLICY_DIVINE',			            		'DA_DIVINE_DISTRICT_FAITH'),
	('BUILDING_CITY_POLICY_SEA_SACRIFICE',			            'DA_SEA_SACRIFICE_NEAR_COAST_FAITH'),


--竞技场
--每点宜居度给城市产出，我没想明白怎么写  --写在下面了
	
--兵营
	('BUILDING_CITY_POLICY_IRON_SMELTING',		                'DA_IRON_SMELTING_IRON'),  --回档了我不太确定兵营是否有问题，我好像改了东西，只能测试看看
	('BUILDING_CITY_POLICY_IRON_SMELTING',		                'DA_IRON_SMELTING_PRODUCTION_DEBUFF'),
	('BUILDING_CITY_POLICY_IRON_SMELTING',		                'DA_IRON_SMELTING_LESS_PRODUCTION_DEBUFF'),
	
--马厩
	('BUILDING_CITY_POLICY_WAR_HORSE',		                	'DA_WAR_HORSE_HORSE'),
	('BUILDING_CITY_POLICY_WAR_HORSE',		                	'DA_WAR_HORSE_FOOD_DEBUFF'),
	('BUILDING_CITY_POLICY_WAR_HORSE',		                	'DA_WAR_HORSE_LESS_FOOD_DEBUFF');

--竞技场


insert or replace into TraitModifiers(TraitType,	ModifierId) values
	('TRAIT_LEADER_MAJOR_CIV',		'DA_DIVINE_DISTRICT_FAITH_MOD'),
	('TRAIT_LEADER_MAJOR_CIV',		'DA_SEA_SALT_GOLD_MOD'),
	('TRAIT_LEADER_MAJOR_CIV',		'DA_COASTAL_FISHING_FOOD_MOD');



insert or replace into TraitModifiers(TraitType,	ModifierId)
	select 'TRAIT_LEADER_MAJOR_CIV',		'DA_OLYMPIC_FAITH_FROM_AMENITY_'||numbers
	from counter where numbers >=1 and numbers <= 14;

insert or replace into TraitModifiers(TraitType,	ModifierId)
	select 'TRAIT_LEADER_MAJOR_CIV',	'DA_SLAVE_GLADIATUS_GOLD_FROM_AMENITY_'||numbers
	from counter where numbers >=1 and numbers <= 14;

insert or replace into TraitModifiers(TraitType,	ModifierId)
	select 'TRAIT_LEADER_MAJOR_CIV',		'DA_CHIVALRY_UNIT_PRODUCTION_FROM_AMENITY_'||numbers
	from counter where numbers >=1 and numbers <= 14;

insert or replace into TraitModifiers(TraitType,	ModifierId)
	select 'TRAIT_LEADER_MAJOR_CIV',		'DA_CHIVALRY_EXTRA_UNIT_PRODUCTION_FROM_AMENITY_'||numbers
	from counter where numbers >=1 and numbers <= 14;


insert or replace into Modifiers
	(ModifierId,														ModifierType,												SubjectRequirementSetId)
values
--城市
	('DA_FOOD_TAX_GOLD',												'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'RS_PLOT_HAS_FOOD_IMPROVEMENTS'),
	('DA_FOOD_TAX_FOOD',												'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'RS_PLOT_HAS_FOOD_IMPROVEMENTS'),
	('DA_FOOD_TAX_EXTRA_GOLD',											'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'RS_PLOT_HAS_FOOD_IMPROVEMENTS_FEUDALISM'),

	('DA_MINE_TAX_GOLD',												'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'RS_PLOT_HAS_MINE_IMPROVEMENTS'),
	('DA_MINE_TAX_PRODUCTION',											'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'RS_PLOT_HAS_MINE_IMPROVEMENTS'),
	('DA_MINE_TAX_EXTRA_GOLD',											'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'RS_PLOT_HAS_MINE_IMPROVEMENTS_APPRENTICESHIP'),

	('DA_LABOR_TAX_BUILDER_PRODUCTION',									'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_MODIFIER',		NULL),
	('DA_LABOR_TAX_AMENITY',											'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',			NULL),

	('DA_LUXURY_TAX_RESOURCE_AMENITY',									'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_AMENITY_FOR_LUXURY_DIVERSITY',NULL),
	('DA_LUXURY_TAX_GOLD_DEBUFF',										'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			NULL),
	('DA_LUXURY_TAX_LESS_GOLD_DEBUFF',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			'RS_CITY_HAS_DISTRICT_COMMERCIAL_HUB'),

--沿岸海事
	--('DA_COASTAL_FISHING_FOOD',											'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',					'RS_CITY_HAS_BUILDING_CITY_POLICY_COASTAL_FISHING'),
	('DA_COASTAL_FISHING_FOOD_MOD',										'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',					'RS_CITY_HAS_BUILDING_CITY_POLICY_COASTAL_FISHING'),
	
	--('DA_SEA_SALT_GOLD',												'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				NULL),	--'RS_CITY_HAS_BUILDING_CITY_POLICY_SEA_SALT'),
	('DA_SEA_SALT_GOLD_MOD',											'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',					'RS_CITY_HAS_BUILDING_CITY_POLICY_SEA_SALT'),
	


--粮仓
    /*('DA_MAKE_WINE_LESS_FOOD_DEBUFF',                             	 	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',          NULL),
    ('DA_MAKE_WINE_GOLD',                                         	 	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'RS_PLOT_HAS_MAKE_WINE_IMPROVEMENT'), --我在条件集写了一个新的分类，不知道是否正确
    ('DA_MAKE_WINE_GOLD_AMENITIES',                                		'MODIFIER_CITY_OWNER_ATTACH_MODIFIER',              		'RS_AT_LEAST_4_AMENITIES'), --上面分类不正确的话，这条应该也不能正确使用
    ('DA_MAKE_WINE_GOLD_AMENITIES_MOD',                                	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'RS_PLOT_HAS_MAKE_WINE_IMPROVEMENT'), --上面分类不正确的话，这条应该也不能正确使用
   
    ('DA_WATER_TRANSPORT_FOOD_BUFF',                                     'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',          'RS_CITY_HAS_TRANSPORT'),
    ('DA_WATER_TRANSPORT_GOLD_DEBUFF',                                   'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            	NULL),
 --我在ModifierType写了个新的，修改单个城市资源产出
    ('DA_WATER_TRANSPORT_FOOD_DEBUFF',                                   'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',           	 	NULL),
    ('DA_WATER_TRANSPORT_LESS_GOLD_DEBUFF',                              'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            	'RS_CITY_HAS_DISTRICT_COMMERCIAL_HUB'),
    */
    ('DA_MAKE_WINE_AMENITIES',                                    		'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',          NULL),
    ('DA_MAKE_WINE_COST_FOOD',                                    		'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),

    ('DA_WATER_TRANSPORT_SUPPLY_FOOD',                                  'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_CHANGE',           	'RS_CITY_NO_7_POP_AND_WITHIN_5_TILES'),
    ('DA_WATER_TRANSPORT_COST_FOOD',                                  	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',           		NULL),

--石工坊
    ('DA_MARBLE_CITY_AMENITIES',                                  		'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',          NULL),
    ('DA_MARBLE_CITY_COST_PRODUCTION',                                  'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',           		NULL),

    ('DA_BRICK_CITY_HOUSING',                                  			'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING',          NULL),
    ('DA_BRICK_CITY_COST_PRODUCTION',                                  	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',           		NULL),


--图书馆
    ('DA_REVISION_CALENDAR_SCIENCE',                                    'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),
    ('DA_REVISION_CALENDAR_SCIENCE_EXTRA',                              'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',      			'RS_CITY_HAS_3_TERRAIN_CLASS_MOUNTAIN'),
    --('DA_REVISION_CALENDAR_GOLD_DEBUFF',                                'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),
    ('DA_HISTORY_BOOKS_CULTURE',                                        'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),
    ('DA_HISTORY_BOOKS_CULTURE_EXTRA',                                  'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		'RS_CITY_HAS_PALACE_OR_DISTRICT_GOVERNMENT'),
    ('DA_COLLECT_SCRIPTURES_FAITH',                                     'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),
    ('DA_COLLECT_SCRIPTURES_FAITH_DISTRICT',                            'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		'RS_CITY_HAS_DISTRICT_HOLY_SITE'),

/*--古罗马剧场
    ('DA_HEROIC_LEGEND_ADJACENT',                                    	'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',            'DISTRICT_IS_THEATER'),
    ('DA_HEROIC_LEGEND_GOLD_DEBUFF',                                    'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),
    ('DA_MYTHS_LEGENDS_ADJACENT',                                       'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS','RS_CITY_NO_RELIGION'),
    ('DA_MYTHS_LEGENDS_GOLD_DEBUFF',                                    'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),
*/
--神社
    ('DA_PRAY_FOR_RAIN_NO_WATER_FAITH',                                 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',            'RS_NO_WATER'),
    ('DA_SEA_SACRIFICE_NEAR_COAST_FAITH',                               'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',            'RS_NEAR_COAST'),
--    ('DA_DIVINE_DISTRICT_FAITH',                               			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',            	  NULL),
    ('DA_DIVINE_DISTRICT_FAITH_MOD',                               		'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',     'RS_CITY_HAS_BUILDING_CITY_POLICY_DIVINE'),



--竞技场   --批量写在下面了

--兵营
    ('DA_IRON_SMELTING_IRON',                                       	'MODIFIER_SINGLE_CITY_ADJUST_FREE_RESOURCE_EXTRACTION',     NULL),
    ('DA_IRON_SMELTING_PRODUCTION_DEBUFF',                          	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),    
    ('DA_IRON_SMELTING_LESS_PRODUCTION_DEBUFF',            				'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		'RS_CITY_HAS_IMPROVED_IRON_OR_DISTRICT_INDUSTRIAL_ZONE'),

--马厩
    ('DA_WAR_HORSE_HORSE',                                          	'MODIFIER_SINGLE_CITY_ADJUST_FREE_RESOURCE_EXTRACTION',     NULL),
    ('DA_WAR_HORSE_FOOD_DEBUFF',                                    	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		NULL),    
    ('DA_WAR_HORSE_LESS_FOOD_DEBUFF',                  					'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',            		'RS_CITY_HAS_IMPROVED_HORSE_OR_DISTRICT_ENTERTAINMENT_COMPLEX');
     

--竞技场   

insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_OLYMPIC_FAITH_FROM_AMENITY_'||numbers,	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'RS_AT_LEAST_'||numbers||'_AMENITIES'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_SLAVE_GLADIATUS_GOLD_FROM_AMENITY_'||numbers,	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'RS_AT_LEAST_'||numbers||'_AMENITIES'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_CHIVALRY_UNIT_PRODUCTION_FROM_AMENITY_'||numbers,	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'RS_AT_LEAST_'||numbers||'_AMENITIES'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_CHIVALRY_EXTRA_UNIT_PRODUCTION_FROM_AMENITY_'||numbers,	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'RS_AT_LEAST_'||numbers||'_AMENITIES'
	from counter where numbers >=1 and numbers <= 14;


insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_OLYMPIC_FAITH_FROM_AMENITY_'||numbers||'_MOD',	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',	'RS_CITY_HAS_BUILDING_CITY_POLICY_OLYMPIC'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_SLAVE_GLADIATUS_GOLD_FROM_AMENITY_'||numbers||'_MOD',	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',	'RS_CITY_HAS_BUILDING_CITY_POLICY_SLAVE_GLADIATUS'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_CHIVALRY_UNIT_PRODUCTION_FROM_AMENITY_'||numbers||'_MOD',	'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_CHANGE',	'RS_CITY_HAS_BUILDING_CITY_POLICY_CHIVALRY'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into Modifiers(ModifierId,	ModifierType,		SubjectRequirementSetId)
	select 'DA_CHIVALRY_EXTRA_UNIT_PRODUCTION_FROM_AMENITY_'||numbers||'_MOD',	'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_CHANGE',	'RS_CITY_HAS_BUILDING_CITY_POLICY_CHIVALRY'
	from counter where numbers >=1 and numbers <= 14;



insert or ignore into RequirementSets
	(RequirementSetId,								      		RequirementSetType)
values
--城市
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS',       		      		'REQUIREMENTSET_TEST_ANY'),
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS_FEUDALISM',          		'REQUIREMENTSET_TEST_ALL'),
	('RS_PLOT_HAS_MINE_IMPROVEMENTS',       		      		'REQUIREMENTSET_TEST_ANY'),
	('RS_PLOT_HAS_MINE_IMPROVEMENTS_APPRENTICESHIP',      		'REQUIREMENTSET_TEST_ALL'),
	('RS_CITY_HAS_DISTRICT_COMMERCIAL_HUB',			      		'REQUIREMENTSET_TEST_ALL'),

--粮仓
/*	('RS_PLOT_HAS_MAKE_WINE_IMPROVEMENT',       		      	'REQUIREMENTSET_TEST_ANY'),
	('RS_PLOT_HAS_MAKE_WINE_IMPROVEMENT_AMENITIES',			    'REQUIREMENTSET_TEST_ALL'),

	('RS_CITY_HAS_TRANSPORT',       		      	            'REQUIREMENTSET_TEST_ALL'),
*/


	('RS_CITY_NO_7_POP_AND_WITHIN_5_TILES',			    		'REQUIREMENTSET_TEST_ALL'),

--图书馆
	--('RS_CITY_HAS_DISTRICT_HOLY_SITE',			      		    'REQUIREMENTSET_TEST_ALL'),  --e不需要，条件文件已经定义了
	('RS_CITY_HAS_PALACE_OR_DISTRICT_GOVERNMENT',       		    'REQUIREMENTSET_TEST_ALL'),

--古罗马剧场

--竞技场

--兵营
	('RS_CITY_HAS_IMPROVED_IRON_OR_DISTRICT_INDUSTRIAL_ZONE',   'REQUIREMENTSET_TEST_ANY'),
	
--马厩
	('RS_CITY_HAS_IMPROVED_HORSE_OR_DISTRICT_ENTERTAINMENT_COMPLEX', 'REQUIREMENTSET_TEST_ANY');



	
insert or ignore into RequirementSetRequirements
	(RequirementSetId,								 		RequirementId)
values
--城市
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS',       		 		'REQ_PLOT_HAS_IMPROVEMENT_FARM'),
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS',       		 		'REQ_PLOT_HAS_IMPROVEMENT_PASTURE'),
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS',       		 		'REQ_PLOT_HAS_IMPROVEMENT_CAMP'),
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS',       		 		'REQ_PLOT_HAS_IMPROVEMENT_PLANTATION'),
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS',       		 		'REQ_PLOT_HAS_IMPROVEMENT_FISHING_BOATS'),

	('RS_PLOT_HAS_FOOD_IMPROVEMENTS_FEUDALISM',    		    'REQ_PLOT_HAS_FOOD_IMPROVEMENT'),
	('RS_PLOT_HAS_FOOD_IMPROVEMENTS_FEUDALISM',    		    'REQ_PLAYER_HAS_CIVIC_FEUDALISM'),

	('RS_PLOT_HAS_MINE_IMPROVEMENTS',       		 		'REQ_PLOT_HAS_IMPROVEMENT_MINE'),
	('RS_PLOT_HAS_MINE_IMPROVEMENTS',       		 		'REQ_PLOT_HAS_IMPROVEMENT_QUARRY'),

	('RS_PLOT_HAS_MINE_IMPROVEMENTS_APPRENTICESHIP', 		'REQ_PLOT_HAS_MINE_IMPROVEMENT'),
	('RS_PLOT_HAS_MINE_IMPROVEMENTS_APPRENTICESHIP', 		'REQ_PLAYER_HAS_TECH_APPRENTICESHIP'),

	('RS_CITY_HAS_DISTRICT_COMMERCIAL_HUB',		    		'REQ_CITY_HAS_DISTRICT_COMMERCIAL_HUB'),

--粮仓
	/*('RS_PLOT_HAS_MAKE_WINE_IMPROVEMENT',       	 		'REQ_PLOT_HAS_MAKE_WINE_IMPROVEMENT'),
	('RS_PLOT_HAS_MAKE_WINE_IMPROVEMENT_AMENITIES',       	'REQ_PLOT_HAS_MAKE_WINE_IMPROVEMENT'),
	('RS_PLOT_HAS_MAKE_WINE_IMPROVEMENT_AMENITIES',       	'REQ_AT_LEAST_4_AMENITIES'),	
	
	('RS_CITY_HAS_TRANSPORT',               	    	  	'REQ_CITY_NO_7_POPULATION'),  --没看见条件反向，先写个7人口，反向了就是7人口以下的城市才触发
	('RS_CITY_HAS_TRANSPORT',                  	  	     	'REQ_CITY_HAS_BUILDING_CITY_POLICY_WATER_TRANSPORT'),  --报错，没有这个建筑，奇怪了  --e。现在补在下面了
*/
	('RS_CITY_NO_7_POP_AND_WITHIN_5_TILES',		   			'REQ_CITY_NO_7_POPULATION'),
	('RS_CITY_NO_7_POP_AND_WITHIN_5_TILES',		   			'REQ_OBJECT_WITHIN_5_TILES'),

--图书馆
	--('RS_CITY_HAS_DISTRICT_HOLY_SITE',		    		  	'REQ_CITY_HAS_DISTRICT_HOLY_SITE'),
	('RS_CITY_HAS_PALACE_OR_DISTRICT_GOVERNMENT',		   	'REQ_CITY_HAS_BUILDING_PALACE'),
	('RS_CITY_HAS_PALACE_OR_DISTRICT_GOVERNMENT',		    'REQ_CITY_HAS_DISTRICT_GOVERNMENT'),	
--古罗马剧场

--神社



--竞技场

--兵营 REQ_CITY_HAS_IMPROVED_
	('RS_CITY_HAS_IMPROVED_IRON_OR_DISTRICT_INDUSTRIAL_ZONE','REQ_CITY_HAS_DISTRICT_INDUSTRIAL_ZONE'),
	('RS_CITY_HAS_IMPROVED_IRON_OR_DISTRICT_INDUSTRIAL_ZONE','REQ_CITY_HAS_IMPROVED_RESOURCE_IRON'),

    --('RS_CITY_HAS_IMPROVEMENTS_IRON',               	    'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');  没看到条件集有城市有某一资源，我就不乱加了

--马厩


	('RS_CITY_HAS_IMPROVED_HORSE_OR_DISTRICT_ENTERTAINMENT_COMPLEX',          'REQ_CITY_HAS_DISTRICT_ENTERTAINMENT_COMPLEX'),
	('RS_CITY_HAS_IMPROVED_HORSE_OR_DISTRICT_ENTERTAINMENT_COMPLEX',          'REQ_CITY_HAS_IMPROVED_RESOURCE_HORSES');


    --('RS_CITY_HAS_IMPROVEMENTS_HORSES',               	    'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');  没看到条件集有城市有某一资源，我就不乱加了
/*
--是否有某城市政策	REQ/RS
insert or replace into Requirements (RequirementId, RequirementType)
select 'REQ_CITY_HAS_'||BuildingType, 'REQUIREMENT_CITY_HAS_BUILDING'
from CityPolicies;

insert or replace into RequirementArguments (RequirementId, Name, Value)
select 'REQ_CITY_HAS_'||BuildingType, 'BuildingType', BuildingType
from CityPolicies;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select	'RS_CITY_HAS_'||BuildingType,				'REQUIREMENTSET_TEST_ALL'
from CityPolicies;                                

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select	'RS_CITY_HAS_'||BuildingType,				'REQ_CITY_HAS_'||BuildingType
from CityPolicies;
*/
	
insert or replace into ModifierArguments
	(ModifierId,													Name,						Value)
values
--城市
	('DA_FOOD_TAX_GOLD',											'YieldType',				'YIELD_GOLD'),
	('DA_FOOD_TAX_GOLD',											'Amount',					'3'),
	('DA_FOOD_TAX_FOOD',											'YieldType',				'YIELD_FOOD'),
	('DA_FOOD_TAX_FOOD',											'Amount',					'-1'),
	('DA_FOOD_TAX_EXTRA_GOLD',										'YieldType',				'YIELD_GOLD'),
	('DA_FOOD_TAX_EXTRA_GOLD',										'Amount',					'2'),

	('DA_MINE_TAX_GOLD',											'YieldType',				'YIELD_GOLD'),
	('DA_MINE_TAX_GOLD',											'Amount',					'3'),
	('DA_MINE_TAX_PRODUCTION',										'YieldType',				'YIELD_PRODUCTION'),
	('DA_MINE_TAX_PRODUCTION',										'Amount',					'-1'),
	('DA_MINE_TAX_EXTRA_GOLD',										'YieldType',				'YIELD_GOLD'),
	('DA_MINE_TAX_EXTRA_GOLD',										'Amount',					'2'),

	('DA_LABOR_TAX_BUILDER_PRODUCTION',								'Amount',					'20'),
	('DA_LABOR_TAX_AMENITY',										'Amount',					'-1'),

	('DA_LUXURY_TAX_RESOURCE_AMENITY',								'Amount',					'1'),
	('DA_LUXURY_TAX_GOLD_DEBUFF',									'YieldType',				'YIELD_GOLD'),
	('DA_LUXURY_TAX_GOLD_DEBUFF',									'Amount',					'-50'),
	('DA_LUXURY_TAX_LESS_GOLD_DEBUFF',								'YieldType',				'YIELD_GOLD'),
	('DA_LUXURY_TAX_LESS_GOLD_DEBUFF',								'Amount',					'40'),

--沿海海事
    ('DA_COASTAL_FISHING_FOOD_MOD',                 'DistrictType',             'DISTRICT_CITY_CENTER'),
    ('DA_COASTAL_FISHING_FOOD_MOD',                 'Amount',                   1),
    ('DA_COASTAL_FISHING_FOOD_MOD',                 'TerrainType',              'TERRAIN_COAST'),
    ('DA_COASTAL_FISHING_FOOD_MOD',                 'YieldType',                'YIELD_FOOD'),
    ('DA_COASTAL_FISHING_FOOD_MOD',                 'Description',              'LOC_COASTAL_FISHING_FOOD'),
    ('DA_COASTAL_FISHING_FOOD_MOD',                 'TilesRequired',            1),
   -- ('DA_COASTAL_FISHING_FOOD',             'ModifierId',            	'DA_COASTAL_FISHING_FOOD_MOD'),

    ('DA_SEA_SALT_GOLD_MOD',                 'DistrictType',             'DISTRICT_CITY_CENTER'),
    ('DA_SEA_SALT_GOLD_MOD',                 'Amount',                   3),
    ('DA_SEA_SALT_GOLD_MOD',                 'TerrainType',              'TERRAIN_COAST'),
    ('DA_SEA_SALT_GOLD_MOD',                 'YieldType',                'YIELD_GOLD'),
    ('DA_SEA_SALT_GOLD_MOD',                 'Description',              'LOC_SEA_SALT_GOLD'),
    ('DA_SEA_SALT_GOLD_MOD',                 'TilesRequired',            1),
   -- ('DA_SEA_SALT_GOLD',             'ModifierId',               'DA_SEA_SALT_GOLD_MOD'),

--粮仓
	/*('DA_MAKE_WINE_LESS_FOOD_DEBUFF',								'YieldType',				'YIELD_FOOD'),
	('DA_MAKE_WINE_LESS_FOOD_DEBUFF',								'Amount',					'-10'),
	('DA_MAKE_WINE_GOLD',											'YieldType',				'YIELD_GOLD'),
	('DA_MAKE_WINE_GOLD',											'Amount',					'2'),
	('DA_MAKE_WINE_GOLD_AMENITIES',									'ModifierId',				'DA_MAKE_WINE_GOLD_AMENITIES_MOD'),
	('DA_MAKE_WINE_GOLD_AMENITIES_MOD',								'YieldType',				'YIELD_GOLD'),
	('DA_MAKE_WINE_GOLD_AMENITIES_MOD',								'Amount',					'2'),

	('DA_WATER_TRANSPORT_FOOD_BUFF',						    		'YieldType',		'YIELD_FOOD'),
	('DA_WATER_TRANSPORT_FOOD_BUFF',						    		'Amount',			'2'),
	('DA_WATER_TRANSPORT_GOLD_DEBUFF',									'YieldType',			'YIELD_GOLD'),
	('DA_WATER_TRANSPORT_GOLD_DEBUFF',									'Amount',				'-4'),
	('DA_WATER_TRANSPORT_FOOD_DEBUFF',									'YieldType',			'YIELD_FOOD'),
	('DA_WATER_TRANSPORT_FOOD_DEBUFF',									'Amount',				'-4'),
	('DA_WATER_TRANSPORT_LESS_GOLD_DEBUFF',								'YieldType',			'YIELD_GOLD'),
	('DA_WATER_TRANSPORT_LESS_GOLD_DEBUFF',								'Amount',				'4'),
*/
	('DA_MAKE_WINE_COST_FOOD',										'YieldType',				'YIELD_FOOD'),
	('DA_MAKE_WINE_COST_FOOD',										'Amount',					'-4'),
	('DA_MAKE_WINE_AMENITIES',										'Amount',					'2'),

	('DA_WATER_TRANSPORT_COST_FOOD',								'YieldType',				'YIELD_FOOD'),
	('DA_WATER_TRANSPORT_COST_FOOD',								'Amount',					'-4'),
	('DA_WATER_TRANSPORT_SUPPLY_FOOD',								'YieldType',				'YIELD_FOOD'),
	('DA_WATER_TRANSPORT_SUPPLY_FOOD',								'Amount',					'4'),

--石工坊
	('DA_MARBLE_CITY_AMENITIES',									'Amount',					'2'),
	('DA_MARBLE_CITY_COST_PRODUCTION',								'YieldType',				'YIELD_PRODUCTION'),
	('DA_MARBLE_CITY_COST_PRODUCTION',								'Amount',					'-4'),

	('DA_BRICK_CITY_HOUSING',										'Amount',					'2'),
	('DA_BRICK_CITY_COST_PRODUCTION',								'YieldType',				'YIELD_PRODUCTION'),
	('DA_BRICK_CITY_COST_PRODUCTION',								'Amount',					'-2'),


--图书馆
	('DA_REVISION_CALENDAR_SCIENCE',						    		'YieldType',			'YIELD_SCIENCE'),
	('DA_REVISION_CALENDAR_SCIENCE',						    		'Amount',				'2'),
	('DA_REVISION_CALENDAR_SCIENCE_EXTRA',						    	'YieldType',			'YIELD_SCIENCE'),
	('DA_REVISION_CALENDAR_SCIENCE_EXTRA',						    	'Amount',				'2'),
	--('DA_REVISION_CALENDAR_GOLD_DEBUFF',								'YieldType',			'YIELD_GOLD'),
	--('DA_REVISION_CALENDAR_GOLD_DEBUFF',								'Amount',				'-8'),
	('DA_HISTORY_BOOKS_CULTURE',										'YieldType',			'YIELD_CULTURE'),
	('DA_HISTORY_BOOKS_CULTURE',										'Amount',				'2'),
	('DA_HISTORY_BOOKS_CULTURE_EXTRA',									'YieldType',			'YIELD_CULTURE'),
	('DA_HISTORY_BOOKS_CULTURE_EXTRA',									'Amount',				'2'),
	('DA_COLLECT_SCRIPTURES_FAITH',										'YieldType',			'YIELD_FAITH'),
	('DA_COLLECT_SCRIPTURES_FAITH',										'Amount',				'4'),
	('DA_COLLECT_SCRIPTURES_FAITH_DISTRICT',							'YieldType',			'YIELD_FAITH'),
	('DA_COLLECT_SCRIPTURES_FAITH_DISTRICT',							'Amount',				'4'),
	
--古罗马剧场DA_HEROIC_LEGEND_ADJACENT
	/*('DA_MYTHS_LEGENDS_ADJACENT', 										'DistrictType', 		'DISTRICT_THEATER'), 
	('DA_MYTHS_LEGENDS_ADJACENT', 										'YieldTypeToGrant', 	'YIELD_FAITH'), 
	('DA_MYTHS_LEGENDS_ADJACENT', 										'YieldTypeToMirror', 	'YIELD_CULTURE'),
	('DA_HEROIC_LEGEND_ADJACENT',										'YieldType',		 	'YIELD_CULTURE'),
	('DA_HEROIC_LEGEND_ADJACENT',										'Amount',		 		'50'),
	('DA_HEROIC_LEGEND_GOLD_DEBUFF',									'YieldType',		 	'YIELD_GOLD'),
	('DA_HEROIC_LEGEND_GOLD_DEBUFF',									'Amount',			 	'-4'),
	('DA_MYTHS_LEGENDS_GOLD_DEBUFF',									'YieldType',		 	'YIELD_GOLD'),
	('DA_MYTHS_LEGENDS_GOLD_DEBUFF',									'Amount',			 	'-4'),
*/

--神社
	('DA_PRAY_FOR_RAIN_NO_WATER_FAITH', 								'YieldType', 	'YIELD_FAITH'),
	('DA_PRAY_FOR_RAIN_NO_WATER_FAITH', 								'Amount', 		'1'),
	('DA_SEA_SACRIFICE_NEAR_COAST_FAITH', 								'YieldType', 	'YIELD_FAITH'),
	('DA_SEA_SACRIFICE_NEAR_COAST_FAITH', 								'Amount', 		'1'),
--	('DA_DIVINE_DISTRICT_FAITH', 										'ModifierId', 	'DA_DIVINE_DISTRICT_FAITH_MOD'),
	('DA_DIVINE_DISTRICT_FAITH_MOD', 									'YieldType', 	'YIELD_FAITH'),
	('DA_DIVINE_DISTRICT_FAITH_MOD', 									'Amount', 		'1'),



--竞技场


--兵营
	('DA_IRON_SMELTING_IRON',											'ResourceType',			'RESOURCE_IRON'),
	('DA_IRON_SMELTING_IRON',											'Amount',				'3'),
	('DA_IRON_SMELTING_PRODUCTION_DEBUFF',								'YieldType',			'YIELD_PRODUCTION'),
	('DA_IRON_SMELTING_PRODUCTION_DEBUFF',								'Amount',				'-6'),
	('DA_IRON_SMELTING_LESS_PRODUCTION_DEBUFF',							'YieldType',			'YIELD_PRODUCTION'),
	('DA_IRON_SMELTING_LESS_PRODUCTION_DEBUFF',							'Amount',				'4'),

--马厩
	('DA_WAR_HORSE_HORSE',												'ResourceType',			'RESOURCE_HORSES'),
	('DA_WAR_HORSE_HORSE',												'Amount',				'3'),
	('DA_WAR_HORSE_FOOD_DEBUFF',										'YieldType',			'YIELD_FOOD'),
	('DA_WAR_HORSE_FOOD_DEBUFF',										'Amount',				'-6'),
	('DA_WAR_HORSE_LESS_FOOD_DEBUFF',						'YieldType',			'YIELD_FOOD'),
	('DA_WAR_HORSE_LESS_FOOD_DEBUFF',						'Amount',				'4');

--竞技场

insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_OLYMPIC_FAITH_FROM_AMENITY_'||numbers,	'ModifierId',	'DA_OLYMPIC_FAITH_FROM_AMENITY_'||numbers||'_MOD'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_SLAVE_GLADIATUS_GOLD_FROM_AMENITY_'||numbers,	'ModifierId',	'DA_SLAVE_GLADIATUS_GOLD_FROM_AMENITY_'||numbers||'_MOD'
	from counter where numbers >=1 and numbers <= 14;



insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_CHIVALRY_UNIT_PRODUCTION_FROM_AMENITY_'||numbers,	'ModifierId',	'DA_CHIVALRY_UNIT_PRODUCTION_FROM_AMENITY_'||numbers||'_MOD'
	from counter where numbers >=1 and numbers <= 14;	

insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_CHIVALRY_EXTRA_UNIT_PRODUCTION_FROM_AMENITY_'||numbers,	'ModifierId',	'DA_CHIVALRY_EXTRA_UNIT_PRODUCTION_FROM_AMENITY_'||numbers||'_MOD'
	from counter where numbers >=1 and numbers <= 14;




insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_OLYMPIC_FAITH_FROM_AMENITY_'||numbers||'_MOD',	'YieldType',	'YIELD_FAITH'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_OLYMPIC_FAITH_FROM_AMENITY_'||numbers||'_MOD',	'Amount',	2
	from counter where numbers >=1 and numbers <= 14;

insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_SLAVE_GLADIATUS_GOLD_FROM_AMENITY_'||numbers||'_MOD',	'YieldType',	'YIELD_GOLD'
	from counter where numbers >=1 and numbers <= 14;

insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_SLAVE_GLADIATUS_GOLD_FROM_AMENITY_'||numbers||'_MOD',	'Amount',	3
	from counter where numbers >=1 and numbers <= 14;


insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_CHIVALRY_UNIT_PRODUCTION_FROM_AMENITY_'||numbers||'_MOD',	'Amount',	2
	from counter where numbers >=1 and numbers <= 14;	

insert or replace into ModifierArguments(ModifierId,			Name,						Value)
	select 'DA_CHIVALRY_EXTRA_UNIT_PRODUCTION_FROM_AMENITY_'||numbers||'_MOD',	'Amount',	1
	from counter where numbers >=1 and numbers <= 14;

