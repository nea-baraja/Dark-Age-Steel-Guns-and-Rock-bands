create table 'CityPolicies'(
    'CityPolicy' TEXT NOT NULL,
    'PolicyClass' TEXT NOT NULL,
    'BuildingType' TEXT,
    'EnableICON_PROJECTType' TEXT,
    'DisableICON_PROJECTType' TEXT,
    'EnableCivicType' TEXT,
    'EnableTechType' TEXT,
    'EnableCost' INT NOT NULL,
    'DisableCost' INT NOT NULL,
    'PreDistrict' TEXT,
    'PreBuilding' TEXT,
    PRIMARY KEY('CityPolicy')
);

insert or replace into CityPolicies
(CityPolicy,                PolicyClass,      EnableCivicType,                   EnableTechType,            EnableCost, DisableCost,    PreDistrict,        PreBuilding) values
--城市
('FOOD_TAX',                'TAX',            'CIVIC_EARLY_EMPIRE',              NULL,                      10,         10,             NULL,               NULL),
('LABOR_TAX',               'TAX',            'CIVIC_STATE_WORKFORCE',           NULL,                      10,         10,             NULL,               NULL),
('MINE_TAX',                'TAX',            'CIVIC_EARLY_EMPIRE',              NULL,                      10,         10,             NULL,               NULL),
('LUXURY_TAX',              'TAX',            'CIVIC_EARLY_EMPIRE',              NULL,                      10,         10,             NULL,               NULL),
('EMPTY_TAX',               'TAX',            'CIVIC_EARLY_EMPIRE',              NULL,                      10,         10,             NULL,               NULL),

--沿岸海事
('COASTAL_FISHING',         'COASTAL_MARITIME', NULL,                            'TECH_SAILING',            30,         10,             NULL,               NULL),
('SEA_SALT',                'COASTAL_MARITIME', NULL,                            'TECH_SAILING',            30,         10,             NULL,               NULL),
('EMPTY_COASTAL_MARITIME',  'COASTAL_MARITIME', NULL,                            NULL,                      10,         10,             NULL,               NULL),


--粮仓
('MAKE_WINE',               'GRAIN_USE',      NULL,                              'TECH_POTTERY',            20,         10,             NULL,               'BUILDING_GRANARY'),
('WATER_TRANSPORT',         'GRAIN_USE',      NULL,                              'TECH_ENGINEERING',        20,         10,             NULL,               'BUILDING_GRANARY'),
('EMPTY_GRAIN_USE',         'GRAIN_USE',      NULL,                              'TECH_POTTERY',            10,         10,             NULL,               'BUILDING_GRANARY'),

--石工坊
('MARBLE_CITY',             'MASONRY',        NULL,                              'TECH_MASONRY',            20,         10,             NULL,               'BUILDING_MASON'),
('BRICK_CITY',              'MASONRY',        NULL,                              'TECH_MASONRY',            20,         10,             NULL,               'BUILDING_MASON'),
('EMPTY_MASONRY',           'MASONRY',        NULL,                              NULL,                      10,         10,             NULL,               'BUILDING_MASON'),

--图书馆
('REVISION_CALENDAR',       'LIBRARY',        NULL,                              'TECH_ASTROLOGY',          10,         10,             'DISTRICT_CAMPUS',  'BUILDING_LIBRARY'),
('HISTORY_BOOKS',           'LIBRARY',        'CIVIC_RECORDED_HISTORY',          NULL,                      10,         10,             'DISTRICT_CAMPUS',  'BUILDING_LIBRARY'),
('COLLECT_SCRIPTURES',      'LIBRARY',        'CIVIC_THEOLOGY',                  NULL,                      10,         10,             'DISTRICT_CAMPUS',  'BUILDING_LIBRARY'),
('EMPTY_LIBRARY',           'LIBRARY',        NULL,                              'TECH_ASTROLOGY',          10,         10,             'DISTRICT_CAMPUS',  'BUILDING_LIBRARY'),

--古罗马剧场
('HEROIC_LEGEND',           'PLAYS',          'CIVIC_RECORDED_HISTORY',          NULL,                      10,         10,             'DISTRICT_THEATER', 'BUILDING_AMPHITHEATER'),
('MYTHS_LEGENDS',           'PLAYS',          'CIVIC_MYSTICISM',                 NULL,                      10,         10,             'DISTRICT_THEATER', 'BUILDING_AMPHITHEATER'),
('EMPTY_PLAYS',             'PLAYS',          'CIVIC_MYSTICISM',                 NULL,                      10,         10,             'DISTRICT_THEATER', 'BUILDING_AMPHITHEATER'),

--神社
('PRAY_FOR_RAIN',           'SACRIFICE',        NULL,                            'TECH_IRRIGATION',         20,         10,             'DISTRICT_HOLY_SITE',   'BUILDING_SHRINE'),
('DIVINE',                  'SACRIFICE',        NULL,                            'TECH_ARCHERY',            20,         10,             'DISTRICT_HOLY_SITE',   'BUILDING_SHRINE'),
('SEA_SACRIFICE',           'SACRIFICE',        NULL,                            'TECH_SAILING',            20,         10,             'DISTRICT_HOLY_SITE',   'BUILDING_SHRINE'),
('EMPTY_SACRIFICE',         'SACRIFICE',        NULL,                            NULL,                      10,         10,             'DISTRICT_HOLY_SITE',   'BUILDING_SHRINE'),

--竞技场
('OLYMPIC',                 'ARENA',          'CIVIC_MYSTICISM',                 NULL,                      10,         10,             'DISTRICT_ENTERTAINMENT_COMPLEX',   'BUILDING_ARENA'),
('SLAVE_GLADIATUS',         'ARENA',          'CIVIC_GAMES_RECREATION',          NULL,                      10,         10,             'DISTRICT_ENTERTAINMENT_COMPLEX',   'BUILDING_ARENA'),
('CHIVALRY',                'ARENA',          'CIVIC_MERCENARIES',               NULL,                      10,         10,             'DISTRICT_ENTERTAINMENT_COMPLEX',   'BUILDING_ARENA'),
('EMPTY_ARENA',             'ARENA',          'CIVIC_MYSTICISM',                 NULL,                      10,         10,             'DISTRICT_ENTERTAINMENT_COMPLEX',   'BUILDING_ARENA'),

--兵营
('IRON_SMELTING',           'BARRACK',        NULL,                              'TECH_IRON_WORKING',       10,         10,             'DISTRICT_ENCAMPMENT',  'BUILDING_BARRACKS'),
('EMPTY_BARRACK',           'BARRACK',        NULL,                              'TECH_IRON_WORKING',       10,         10,             'DISTRICT_ENCAMPMENT',  'BUILDING_BARRACKS'),

--马厩
('WAR_HORSE',               'STABLED',        NULL,                              'TECH_HORSEBACK_RIDING',   10,         10,             'DISTRICT_ENCAMPMENT',  'BUILDING_STABLE'),
('EMPTY_STABLED',           'STABLED',        NULL,                              'TECH_HORSEBACK_RIDING',   10,         10,             'DISTRICT_ENCAMPMENT',  'BUILDING_STABLE');


insert into IconTextureAtlases
    (Name,                                              IconSize,   IconsPerRow,    IconsPerColumn,     Filename)
values
    ('ICON_ATLAS_BUILDING_MASON',                       256,        1,              1,                  'mason_256.dds'),
    ('ICON_ATLAS_BUILDING_MASON',                       128,        1,              1,                  'mason_128.dds'),
    ('ICON_ATLAS_BUILDING_MASON',                       80,         1,              1,                  'mason_80.dds'),
    ('ICON_ATLAS_BUILDING_MASON',                       50,         1,              1,                  'mason_50.dds'),
    ('ICON_ATLAS_BUILDING_MASON',                       38,         1,              1,                  'mason_38.dds'),
    ('ICON_ATLAS_BUILDING_MASON',                       32,         1,              1,                  'mason_32.dds');

insert or replace into IconDefinitions
    (Name,                                              Atlas,                                              'Index')
values
    ('ICON_BUILDING_MASON',                             'ICON_ATLAS_BUILDING_MASON',                         0);


insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_BUILDING_CITY_POLICY_'||CityPolicy,                     'ICON_ATLAS_DISTRICTS',         0
from CityPolicies;



insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         1
from CityPolicies where PolicyClass = 'TAX' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        1
from CityPolicies where PolicyClass = 'TAX' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_TECH',         3
from CityPolicies where PolicyClass = 'COASTAL_MARITIME' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_TECH',        3
from CityPolicies where PolicyClass = 'COASTAL_MARITIME' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         3
from CityPolicies where PreBuilding = 'BUILDING_GRANARY' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        3
from CityPolicies where PreBuilding = 'BUILDING_GRANARY' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDING_MASON',         0
from CityPolicies where PreBuilding = 'BUILDING_MASON' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDING_MASON',        0
from CityPolicies where PreBuilding = 'BUILDING_MASON' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         4
from CityPolicies where PreBuilding = 'BUILDING_LIBRARY' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        4
from CityPolicies where PreBuilding = 'BUILDING_LIBRARY' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         16
from CityPolicies where PreBuilding = 'BUILDING_AMPHITHEATER' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        16
from CityPolicies where PreBuilding = 'BUILDING_AMPHITHEATER' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         5
from CityPolicies where PreBuilding = 'BUILDING_SHRINE' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        5
from CityPolicies where PreBuilding = 'BUILDING_SHRINE' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         8
from CityPolicies where PreBuilding = 'BUILDING_ARENA' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        8
from CityPolicies where PreBuilding = 'BUILDING_ARENA' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         2
from CityPolicies where PreBuilding = 'BUILDING_BARRACKS' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        2
from CityPolicies where PreBuilding = 'BUILDING_BARRACKS' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_ENABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',         13
from CityPolicies where PreBuilding = 'BUILDING_STABLE' and CityPolicy NOT LIKE 'EMPTY%';

insert or replace into IconDefinitions
    (Name,                                                          Atlas,                          'Index')
select
    'ICON_PROJECT_CITY_POLICY_DISABLE_'||CityPolicy,                     'ICON_ATLAS_BUILDINGS',        13
from CityPolicies where PreBuilding = 'BUILDING_STABLE' and CityPolicy NOT LIKE 'EMPTY%';