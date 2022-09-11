
/*
delete from BeliefModifiers
	where BeliefType in
	('BELIEF_RELIGIOUS_SETTLEMENTS',
	'BELIEF_GOD_OF_THE_FORGE');

insert or replace into BeliefModifiers
	(BeliefType,						ModifierID)
values
	('BELIEF_RELIGIOUS_SETTLEMENTS',	'RELIGIOUS_SETTLEMENTS_EXPANSION'), 
	('BELIEF_RELIGIOUS_SETTLEMENTS',	'RELIGIOUS_SETTLEMENTS_GOLD'), 
	('BELIEF_RELIGIOUS_SETTLEMENTS',	'RELIGIOUS_SETTLEMENTS_FAITH'), 
	('BELIEF_GOD_OF_THE_FORGE',			'GOD_OF_THE_FORGE_UNIT_PRODUCTION'), 
	('BELIEF_GOD_OF_THE_FORGE',			'GOD_OF_THE_FORGE_UNIT_FAITH');

insert or replace into Modifiers
	(ModifierId,												ModifierType,													SubjectRequirementSetId)
values
	('RELIGIOUS_SETTLEMENTS_EXPANSION',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('RELIGIOUS_SETTLEMENTS_EXPANSION_MOD',						'MODIFIER_SINGLE_CITY_CULTURE_BORDER_EXPANSION',				null),
	('RELIGIOUS_SETTLEMENTS_GOLD',								'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('RELIGIOUS_SETTLEMENTS_GOLD_MOD',							'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'RS_3_TILES_TO_CITY_CENTER'),
	('RELIGIOUS_SETTLEMENTS_FAITH',								'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('RELIGIOUS_SETTLEMENTS_FAITH_MOD',							'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'RS_3_TILES_TO_CITY_CENTER'),
	('GOD_OF_THE_FORGE_UNIT_PRODUCTION',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('GOD_OF_THE_FORGE_UNIT_PRODUCTION_MOD',					'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION',		null),
	('GOD_OF_THE_FORGE_UNIT_FAITH',								'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('GOD_OF_THE_FORGE_UNIT_FAITH_MOD',							'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST',				'RS_3_TILES_TO_CITY_CENTER');
	

insert or replace into ModifierArguments
	(ModifierId,												Name,					Value)
values
	-- Follower
	('RELIGIOUS_SETTLEMENTS_EXPANSION',							'ModifierId',			'RELIGIOUS_SETTLEMENTS_EXPANSION_MOD'),
	('RELIGIOUS_SETTLEMENTS_EXPANSION_MOD',						'Amount',				'20'),
	('RELIGIOUS_SETTLEMENTS_GOLD',								'ModifierId',			'RELIGIOUS_SETTLEMENTS_GOLD_MOD'),
	('RELIGIOUS_SETTLEMENTS_GOLD_MOD',							'YieldType',			'YIELD_GOLD'),
	('RELIGIOUS_SETTLEMENTS_GOLD_MOD',							'Amount',				'1'),
	('RELIGIOUS_SETTLEMENTS_FAITH',								'ModifierId',			'RELIGIOUS_SETTLEMENTS_FAITH_MOD'),
	('RELIGIOUS_SETTLEMENTS_FAITH_MOD',							'YieldType',			'YIELD_FAITH'),
	('RELIGIOUS_SETTLEMENTS_FAITH_MOD',							'Amount',				'1');


insert or replace INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('RS_3_TILES_TO_CITY_CENTER', 			'REQUIREMENTSET_TEST_ALL'),

insert or replace INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('RS_3_TILES_TO_CITY_CENTER', 			'REQ_3_TILES_TO_CITY_CENTER'),


insert or replace INTO Requirements (RequirementId, RequirementType) VALUES 
('REQ_3_TILES_TO_CITY_CENTER', 		'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES'),

insert or replace INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQ_3_TILES_TO_CITY_CENTER', 'MaxRange', 		'3'), 
('REQ_3_TILES_TO_CITY_CENTER', 'MinRange', 		'3'),
('REQ_3_TILES_TO_CITY_CENTER', 'DistrictType', 	'DISTRICT_CITY_CENTER'),


*/
--================================



delete from BeliefModifiers
	where BeliefType in
	('BELIEF_FEED_THE_WORLD',
	'BELIEF_CHORAL_MUSIC',
	'BELIEF_RELIGIOUS_COMMUNITY',
	'BELIEF_WORK_ETHIC',
	'BELIEF_ZEN_MEDITATION'



		);


insert or replace into BeliefModifiers
	(BeliefType,						ModifierID)
values
	('BELIEF_FEED_THE_WORLD',			'FEED_THE_WORLD_TIER1'),  --每级给每人口减0.2粮食消耗
	('BELIEF_FEED_THE_WORLD',			'FEED_THE_WORLD_TIER2'),  --每级给每人口减0.2粮食消耗
	('BELIEF_FEED_THE_WORLD',			'FEED_THE_WORLD_TIER3'),  --每级给每人口减0.2粮食消耗
	('BELIEF_CHORAL_MUSIC',				'CHORAL_MUSIC_CULTURE'),  --圣地相邻加琴
	('BELIEF_CHORAL_MUSIC',				'CHORAL_MUSIC_FAITH'),  --剧院相邻加鸽子
	('BELIEF_CHORAL_MUSIC',				'CHORAL_MUSIC_FAITH'),  --剧院相邻加鸽子
	('BELIEF_RELIGIOUS_COMMUNITY',		'RELIGIOUS_COMMUNITY_DISTRICT_HOUSING'),  
	('BELIEF_RELIGIOUS_COMMUNITY',		'RELIGIOUS_COMMUNITY_IMPROVEMENT_HOUSING'),  
	('BELIEF_WORK_ETHIC',				'WORK_ETHIC_PRODUCTION'),  
	('BELIEF_WORK_ETHIC',				'WORK_ETHIC_PRODUCTION_EX'),  
	('BELIEF_ZEN_MEDITATION',			'MEDITATION_TIER1'),  
	('BELIEF_ZEN_MEDITATION',			'MEDITATION_TIER2'),  
	('BELIEF_ZEN_MEDITATION',			'MEDITATION_TIER3'),  
	('BELIEF_ZEN_MEDITATION',			'MEDITATION_TIER4');



insert or replace into Modifiers
	(ModifierId,												ModifierType,													SubjectRequirementSetId)
values
	('FEED_THE_WORLD_TIER1',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('FEED_THE_WORLD_TIER1_MOD',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		'RS_CITY_HAS_BUILDING_SHRINE'),
	('FEED_THE_WORLD_TIER2',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('FEED_THE_WORLD_TIER2_MOD',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		'RS_CITY_HAS_BUILDING_TEMPLE'),
	('FEED_THE_WORLD_TIER3',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('FEED_THE_WORLD_TIER3_MOD',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		'RS_CITY_HAS_HOLY_SITE_TIER3'),
	('CHORAL_MUSIC_CULTURE',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('CHORAL_MUSIC_CULTURE_MOD',						'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	'RS_CITY_HAS_DISTRICT_THEATER'),
	('CHORAL_MUSIC_FAITH',								'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('CHORAL_MUSIC_FAITH_MOD',							'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	'RS_CITY_HAS_DISTRICT_HOLY_SITE'),
	('RELIGIOUS_COMMUNITY_DISTRICT_HOUSING',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('RELIGIOUS_COMMUNITY_DISTRICT_HOUSING_MOD',		'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_HOUSING',					'RS_ADJACENT_TO_HOLY_SITE'),
	('RELIGIOUS_COMMUNITY_IMPROVEMENT_HOUSING',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('RELIGIOUS_COMMUNITY_IMPROVEMENT_HOUSING_MOD',		'MODIFIER_SINGLE_CITY_PLOT_ADJUST_HOUSING',						'RS_IMPROVED_ADJACENT_TO_HOLY_SITE'),
	('WORK_ETHIC_PRODUCTION',							'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('WORK_ETHIC_PRODUCTION_MOD',						'MODIFIER_FOLLOWER_YIELD_MODIFIER',								NULL),
	('WORK_ETHIC_PRODUCTION_EX',						'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',							'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('WORK_ETHIC_PRODUCTION_EX_MOD',					'MODIFIER_FOLLOWER_YIELD_MODIFIER',								'RS_CITY_HAS_5_ADJACENCY_DISTRICT_HOLY_SITE');


insert or replace into ModifierArguments
	(ModifierId,												Name,					Value)
values
	-- Follower
	('FEED_THE_WORLD_TIER1',								'ModifierId',			'FEED_THE_WORLD_TIER1_MOD'),
	('FEED_THE_WORLD_TIER1_MOD',							'YieldType',			'YIELD_FOOD'),
	('FEED_THE_WORLD_TIER1_MOD',							'Amount',				0.2),
	('FEED_THE_WORLD_TIER2',								'ModifierId',			'FEED_THE_WORLD_TIER2_MOD'),
	('FEED_THE_WORLD_TIER2_MOD',							'YieldType',			'YIELD_FOOD'),
	('FEED_THE_WORLD_TIER2_MOD',							'Amount',				0.2),
	('FEED_THE_WORLD_TIER3',								'ModifierId',			'FEED_THE_WORLD_TIER3_MOD'),
	('FEED_THE_WORLD_TIER3_MOD',							'YieldType',			'YIELD_FOOD'),
	('FEED_THE_WORLD_TIER3_MOD',							'Amount',				0.2),
	('CHORAL_MUSIC_CULTURE',								'ModifierId',			'CHORAL_MUSIC_CULTURE_MOD'),
	('CHORAL_MUSIC_CULTURE_MOD',							'DistrictType',			'DISTRICT_HOLY_SITE'),
	('CHORAL_MUSIC_CULTURE_MOD',							'YieldTypeToGrant',		'YIELD_CULTURE'),
	('CHORAL_MUSIC_CULTURE_MOD',							'YieldTypeToMirror',	'YIELD_FAITH'),
	('CHORAL_MUSIC_FAITH',									'ModifierId',			'CHORAL_MUSIC_FAITH_MOD'),
	('CHORAL_MUSIC_FAITH_MOD',							    'DistrictType',			'DISTRICT_THEATER'),
	('CHORAL_MUSIC_FAITH_MOD',								'YieldTypeToGrant',		'YIELD_FAITH'),
	('CHORAL_MUSIC_FAITH_MOD',								'YieldTypeToMirror',	'YIELD_CULTURE'),
	('RELIGIOUS_COMMUNITY_DISTRICT_HOUSING',				'ModifierId',			'RELIGIOUS_COMMUNITY_DISTRICT_HOUSING_MOD'),
	('RELIGIOUS_COMMUNITY_DISTRICT_HOUSING_MOD',			'Amount',				'2'),
	('RELIGIOUS_COMMUNITY_IMPROVEMENT_HOUSING',				'ModifierId',			'RELIGIOUS_COMMUNITY_IMPROVEMENT_HOUSING_MOD'),
	('RELIGIOUS_COMMUNITY_IMPROVEMENT_HOUSING_MOD',			'Amount',				'1'),
	('WORK_ETHIC_PRODUCTION',								'ModifierId',			'WORK_ETHIC_PRODUCTION_MOD'),
	('WORK_ETHIC_PRODUCTION_MOD',							'YieldType',			'YIELD_PRODUCTION'),
	('WORK_ETHIC_PRODUCTION_MOD',							'Amount',				'1'),	
	('WORK_ETHIC_PRODUCTION_EX',							'ModifierId',			'YIELD_FAITH'),
	('WORK_ETHIC_PRODUCTION_EX_MOD',						'YieldType',			'YIELD_PRODUCTION'),
	('WORK_ETHIC_PRODUCTION_EX_MOD',						'Amount',				'1');


insert or replace INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('RS_ADJACENT_TO_HOLY_SITE', 'REQUIREMENTSET_TEST_ALL'),
('RS_IMPROVED_ADJACENT_TO_HOLY_SITE', 'REQUIREMENTSET_TEST_ALL');

insert or replace INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('RS_ADJACENT_TO_HOLY_SITE', 			'REQ_ADJACENT_TO_HOLY_SITE'),
('RS_IMPROVED_ADJACENT_TO_HOLY_SITE', 	'REQ_ADJACENT_TO_HOLY_SITE'),
('RS_IMPROVED_ADJACENT_TO_HOLY_SITE', 	'REQ_IMPROVED');


insert or replace INTO Requirements (RequirementId, RequirementType) VALUES 
('REQ_ADJACENT_TO_HOLY_SITE', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES'),
('REQ_IMPROVED', 				'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');

insert or replace INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQ_ADJACENT_TO_HOLY_SITE', 'DistrictType', 'DISTRICT_HOLY_SITE'), 
('REQ_ADJACENT_TO_HOLY_SITE', 'MaxRange', '1'), 
('REQ_ADJACENT_TO_HOLY_SITE', 'MinRange', '1');



insert or replace into 	BeliefModifiers	(BeliefType,		ModifierID)
	select 'BELIEF_ZEN_MEDITATION',		'MEDITATION_ADJACENCY_TIER_'||(numbers * 2)
	from counter where numbers >=1 and numbers <= 5;

insert or replace into 	BeliefModifiers	(BeliefType,		ModifierID)
	select 'BELIEF_ZEN_MEDITATION',		'MEDITATION_AMENITY_TIER_'||(numbers * 2)
	from counter where numbers >=1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,	ModifierType,	SubjectRequirementSetId)
	select 'MEDITATION_ADJACENCY_TIER_'||(numbers * 2),		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',		'CITY_FOLLOWS_RELIGION_REQUIREMENTS'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,	ModifierType,	SubjectRequirementSetId)
	select 'MEDITATION_AMENITY_TIER_'||(numbers * 2),		'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',		'CITY_FOLLOWS_RELIGION_REQUIREMENTS'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,	ModifierType,	SubjectRequirementSetId)
	select 'MEDITATION_ADJACENCY_TIER_'||(numbers * 2)||'_MOD',		'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',		NULL
	from counter where numbers >=1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,	ModifierType,	SubjectRequirementSetId)
	select 'MEDITATION_AMENITY_TIER_'||(numbers * 2)||'_MOD',		'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY',		'RS_HOLY_SITE_APPEAL_'||(numbers * 2)
	from counter where numbers >=1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'MEDITATION_ADJACENCY_TIER_'||(numbers * 2),	'ModifierId',	'MEDITATION_ADJACENCY_TIER_'||(numbers * 2)||'_MOD'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'MEDITATION_AMENITY_TIER_'||(numbers * 2),	'ModifierId',	'MEDITATION_AMENITY_TIER_'||(numbers * 2)||'_MOD'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'MEDITATION_ADJACENCY_TIER_'||(numbers * 2)||'_MOD',	'DistrictType',	'DISTRICT_HOLY_SITE'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'MEDITATION_ADJACENCY_TIER_'||(numbers * 2)||'_MOD',	'RequiredAppeal',	numbers * 2
	from counter where numbers >=1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'MEDITATION_ADJACENCY_TIER_'||(numbers * 2)||'_MOD',	'YieldChange',	1
	from counter where numbers >=1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'MEDITATION_ADJACENCY_TIER_'||(numbers * 2)||'_MOD',	'YieldType',	'YIELD_FAITH'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,	Name,	Value)
	select 'MEDITATION_AMENITY_TIER_'||(numbers * 2)||'_MOD',	'Amount',	1
	from counter where numbers >=1 and numbers <= 5;


insert or replace into RequirementSets(RequirementSetId,	RequirementSetType)
	select	'RS_HOLY_SITE_APPEAL_'||(numbers * 2),		'REQUIREMENTSET_TEST_ALL'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)  
	select 'RS_HOLY_SITE_APPEAL_'||(numbers * 2),		'REQUIRES_DISTRICT_IS_HOLY_SITE'
	from counter where numbers >=1 and numbers <= 5;

insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)  
	select 'RS_HOLY_SITE_APPEAL_'||(numbers * 2),		'REQ_PLOT_APPEAL_'||(numbers * 2)
	from counter where numbers >=1 and numbers <= 5;
