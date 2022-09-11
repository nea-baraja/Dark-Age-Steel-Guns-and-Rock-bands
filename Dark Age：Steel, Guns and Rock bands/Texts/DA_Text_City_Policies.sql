-- 
create table 'CityPolicyTexts'(
    'CityPolicy' TEXT NOT NULL,
    'Name' TEXT,
    'EffectText' TEXT,
    'BuildingText' TEXT,
    'EnableProjectText' TEXT,
    'DisableProjectText' TEXT,
    PRIMARY KEY('CityPolicy')
);

insert or replace into CityPolicyTexts
    (CityPolicy)
values
  --城市
    ('EMPTY_TAX'),
    ('MINE_TAX'),
    ('LABOR_TAX'),
    ('LUXURY_TAX'),
    ('FOOD_TAX'),

--沿岸海事
    ('EMPTY_COASTAL_MARITIME'),
    ('COASTAL_FISHING'),
    ('SEA_SALT'),

--粮仓
    ('EMPTY_GRAIN_USE'),
    ('MAKE_WINE'),
    ('WATER_TRANSPORT'),

--石匠坊
    ('EMPTY_MASONRY'),
    ('MARBLE_CITY'),
    ('BRICK_CITY'),

--图书馆
    ('EMPTY_LIBRARY'),
    ('REVISION_CALENDAR'),
    ('COLLECT_SCRIPTURES'),
    ('HISTORY_BOOKS'),
    
--古罗马剧场
    ('EMPTY_PLAYS'),
    ('HEROIC_LEGEND'),
    ('MYTHS_LEGENDS'),

--神社
    ('EMPTY_SACRIFICE'),
    ('PRAY_FOR_RAIN'),
    ('DIVINE'),
    ('SEA_SACRIFICE'),
    
--竞技场
    ('EMPTY_ARENA'),
    ('OLYMPIC'),
    ('SLAVE_GLADIATUS'),
    ('CHIVALRY'),
    
--兵营
    ('EMPTY_BARRACK'),
    ('IRON_SMELTING'),
    
--马厩
    ('EMPTY_STABLED'),
    ('WAR_HORSE');

update CityPolicyTexts set
    Name                    = 'LOC_CITY_POLICY_' || CityPolicy,
    EffectText              = 'LOC_CITY_POLICY_' || CityPolicy || '_EFFECT',
    BuildingText            = 'LOC_BUILDING_CITY_POLICY_' || CityPolicy,
    EnableProjectText       = 'LOC_PROJECT_CITY_POLICY_ENABLE_' || CityPolicy,
    DisableProjectText      = 'LOC_PROJECT_CITY_POLICY_DISABLE_' || CityPolicy;

insert or replace into EnglishText (Tag, Text) select
    BuildingText || '_NAME',            '{'||Name||'}{LOC_DA_SPACE}{LOC_POLICY_NAME}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into EnglishText (Tag, Text) select
    BuildingText || '_DESCRIPTION',     '{'||Name||'}{LOC_DA_SPACE}{LOC_CITY_POLICY_NAME}{LOC_DA_SPACE}{LOC_UNDERGOING_TEXT}[NEWLINE]{'||EffectText||'} {LOC_DISABLE_BY_PROJECT}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';

insert or replace into EnglishText (Tag, Text) select
    EnableProjectText || '_NAME',       '{LOC_MODS_ENABLE}{LOC_DA_SPACE}{'||BuildingText||'_NAME}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into EnglishText (Tag, Text) select
    EnableProjectText || '_SHORT_NAME', '{LOC_MODS_ENABLE}{LOC_DA_SPACE}{'||Name||'}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into EnglishText (Tag, Text) select
    EnableProjectText || '_DESCRIPTION', '{LOC_MODS_ENABLE} {'||BuildingText||'_NAME}[NEWLINE]{'||EffectText||'} {LOC_DISABLE_BY_PROJECT}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';

insert or replace into EnglishText (Tag, Text) select
    DisableProjectText || '_NAME',       '{LOC_MODS_DISABLE}{LOC_DA_SPACE}{'||BuildingText||'_NAME}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into EnglishText (Tag, Text) select
    DisableProjectText || '_SHORT_NAME', '{LOC_MODS_DISABLE}{LOC_DA_SPACE}{'||Name||'}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';
insert or replace into EnglishText (Tag, Text) select
    DisableProjectText || '_DESCRIPTION', '{LOC_MODS_DISABLE} {'||BuildingText||'_NAME}[NEWLINE]{LOC_CITYPOLICY_BACK_TO_NORMAL}'
from CityPolicyTexts where CityPolicy NOT LIKE 'EMPTY%';



insert or replace into EnglishText (Tag, Text) select
    BuildingText || '_NAME',            '{LOC_EMPTY_POLICY_NAME}{'||Name||'}'
from CityPolicyTexts where CityPolicy LIKE 'EMPTY%';
insert or replace into EnglishText (Tag, Text) select
    BuildingText || '_DESCRIPTION',     '{LOC_EMPTY_POLICY_DESCRIPTION}{'||Name||'}{LOC_DA_SPACE}[NEWLINE]{'||Name||'}{'||EffectText||'} {LOC_ENABLE_BY_PROJECT}'
from CityPolicyTexts where CityPolicy LIKE 'EMPTY%';



--------------------------------------------------------------------------------
-- Language: en_US
/*
insert or replace into EnglishText
    (Tag,                                                             Text)
values
    ("LOC_CITY_POLICY_NAME",                                          "City Policy"),
    ("LOC_HUD_CITY_CITY_POLICIES",                                    "City Policies"),
    ("LOC_HUD_CITY_NO_CITY_POLICIES",                                 "No City Policies exist."),
    ("LOC_BUILDING_CITY_POLICY_EMPTY_NAME",                           "No City Policy"),
    ("LOC_BUILDING_CITY_POLICY_EMPTY_DESCRIPTION",                    "No City Policy."),

    ("LOC_DA_SPACE",                                                  " "),
    ("LOC_UNDERGOING_TEXT",                                           "undergoing"),
    ("LOC_DISABLE_BY_PROJECT",                                        "This policy can be disabled by a project."),
    ("LOC_CITYPOLICY_BACK_TO_NORMAL",                                 "Restore the original yields."),

    ("LOC_CITY_POLICY_FOOD_TAX",                                         "Conscripting Labor"),
    ("LOC_CITY_POLICY_FOOD_TAX_EFFECT",                                  "Each [ICON_Citizen] Citizen provides 1.5 extra [ICON_Production] Production, but consume extra 1 [ICON_Food] Food. The city growth rate decreased by 75% and suffer -1 [ICON_Amenities] Amenity."),
    ("LOC_CITY_POLICY_MINE_TAX",                              "Cash Crops"),
    ("LOC_CITY_POLICY_MINE_TAX_EFFECT",                       "Each Farm provides extra 2 [ICON_GOLD] Gold, but -1 [ICON_Food] Food."),
    ("LOC_CITY_POLICY_LABOR_TAX",                                "Daily Goods"),
    ("LOC_CITY_POLICY_LABOR_TAX_EFFECT",                         "Each Mine or Quarry provides extra 2 [ICON_GOLD] Gold, but -1 [ICON_PRODUCTION] Production."),
    ("LOC_CITY_POLICY_LUXURY_TAX",                              "Almanac Revision"),
    ("LOC_CITY_POLICY_LUXURY_TAX_EFFECT",                       "Aqueduct Project. Need maintenance cost of 6 [ICON_GOLD] Gold.  In this City: the improvement yields of Plantations and Farms over resource are replaced with +1 [ICON_Production] Production and +1 [ICON_SCIENCE] Science. After Calendar is researched, provides +2 [ICON_Production] Production."),
    ("LOC_CITY_POLICY_DIPLOMATIC_MEETING",                            "Diplomatic Meeting"),
    ("LOC_CITY_POLICY_DIPLOMATIC_MEETING_EFFECT",                     "Diplomatic Quarter Project. Each turn, Diplomatic Quarter and each of its building consumes 2 [ICON_Favor] Favor, and provides 5 influence points."),
    ("LOC_CITY_POLICY_JIMI",                                          "JIMI"),
    ("LOC_CITY_POLICY_JIMI_EFFECT",                                   "Encampment Project. Consumes 1 [ICON_RESOURCE_HORSES] Horses and 1 [ICON_RESOURCE_IRON] Iron per turn, and provides 2 influence points."),
    ("LOC_CITY_POLICY_FREIGHT",                                       "Freight"),
    ("LOC_CITY_POLICY_FREIGHT_EFFECT",                                "Commercial Hub Project. Each turn, consumes 3 [ICON_RESOURCE_HORSES] Horses, provides 2 [ICON_FOOD] Food and 3 [ICON_PRODUCTION] Production."),
    ("LOC_CITY_POLICY_THEOLOGICAL_SEMINAR",                           "Theological Seminar"),
    ("LOC_CITY_POLICY_THEOLOGICAL_SEMINAR_EFFECT",                    "Holy Site Project. Consumes 3 [ICON_FAITH] Faith per turn, provides 1 [ICON_CULTURE] Culture and 1 [ICON_SCIENCE] Science. Religious spread from adjacent city pressure is 50% weaker."),
    ("LOC_CITY_POLICY_FORGING_IRON",                                  "Forging Iron"), -- Tool Production
    ("LOC_CITY_POLICY_FORGING_IRON_EFFECT",                           "Industrial Zone Project. Each turn, consumes 3 [ICON_RESOURCE_IRON] Iron, provides 5 [ICON_PRODUCTION] Production.");

    -- ("LOC_CITY_POLICY_DACAOGU",                                       "Pillage Preparing"),
    -- ("LOC_CITY_POLICY_DACAOGU_EFFECT",                                "Each trained light cavalry unit of Mediveal or eralier era in this city gains the ability that can pillage tiles using only 1 [ICON_Movement] Movement. Each [ICON_Citizen] Citizen consumes extra 1 [ICON_FOOD] Food. -100% Growth Rate and -1 [ICON_Amenities] Amenity to this city. If the city has at least 3 [ICON_Citizen] Citizens, receives another unit of the same kind when a light cavalry unit of Mediveal or eralier era being trained in this city, at the cost of one [ICON_Citizen] Citizen. This policy can be disabled by a project.");
*/
--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                             Text)
values
    ("zh_Hans_CN",  "LOC_CITY_POLICY_NAME",                                          "城市政策"),
    ("zh_Hans_CN",  "LOC_EMPTY_POLICY_NAME",                                         "无"),
    ("zh_Hans_CN",  "LOC_EMPTY_POLICY_DESCRIPTION",                                  "无"),
    ("zh_Hans_CN",  "LOC_HUD_CITY_CITY_POLICIES",                                    "城市政策"),
    ("zh_Hans_CN",  "LOC_HUD_CITY_NO_CITY_POLICIES",                                 "尚未开启城市政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_EMPTY_NAME",                           "无城市政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_EMPTY_DESCRIPTION",                    "无城市政策。"),

    ("zh_Hans_CN",  "LOC_DA_SPACE",                                                  ""),
    ("zh_Hans_CN",  "LOC_UNDERGOING_TEXT",                                           "已启用"),
    ("zh_Hans_CN",  "LOC_DISABLE_BY_PROJECT",                                        "该政策可通过项目关闭。"),
    ("zh_Hans_CN",  "LOC_ENABLE_BY_PROJECT",                                         "通过完成对应科技或市政，解锁相应城市政策。"),
    ("zh_Hans_CN",  "LOC_CITYPOLICY_BACK_TO_NORMAL",                                 "产出恢复正常。"),
    
--税收
    ("zh_Hans_CN",  "LOC_CITY_POLICY_FOOD_TAX",                                      "粮税"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_FOOD_TAX_EFFECT",                               "每个农场、牧场、营地、种植园和渔船+3 [ICON_GOLD] 金币，但额外减少1 [ICON_Food] 食物。完成市政“封建主义”后额外+2 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MINE_TAX",                                      "矿税"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MINE_TAX_EFFECT",                               "每个矿山、采石场、伐木场+3 [ICON_GOLD] 金币，但额外减少1 [ICON_PRODUCTION] 生产力。完成科技“学徒”后额外+2 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_LABOR_TAX",                                     "劳役税"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_LABOR_TAX_EFFECT",                              "生产建造者时+20% [ICON_PRODUCTION] 生产力。城市-1 [ICON_Amenities] 宜居度。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_LUXURY_TAX",                                    "资源税"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_LUXURY_TAX_EFFECT",                             "每个改良的奢侈品额外为城市提供1 [ICON_Amenities] 宜居度，但城市-50% [ICON_GOLD] 金币产出（城市建有商业中心时改为-10%）"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_TAX",                                     "税务政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_TAX_EFFECT",                              "包括粮税、矿税、劳役税、奢侈税。"),
 
--沿岸海事
    ("zh_Hans_CN",  "LOC_CITY_POLICY_COASTAL_FISHING",                              "沿岸捕捞"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_COASTAL_FISHING_EFFECT",                       "市中心每相邻一个海岸单元格就+1 [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_SEA_SALT",                                     "晒盐"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_SEA_SALT_EFFECT",                              "市中心每相邻一个海岸单元格就+3 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_COASTAL_MARITIME",                       "沿岸海事政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_COASTAL_MARITIME_EFFECT",                "包括沿岸捕捞和晒盐。"),
    ("zh_Hans_CN",  "LOC_COASTAL_FISHING_FOOD",                                     "+{1_num} [ICON_Food] 食物来自相邻海岸单元格。"),
    ("zh_Hans_CN",  "LOC_SEA_SALT_GOLD",                                            "+{1_num} [ICON_GOLD] 金币来自相邻海岸单元格。"),

   

--粮仓    
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MAKE_WINE",                                     "酿酒"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MAKE_WINE_EFFECT",                              "城市-4 [ICON_Food] 食物，+2[ICON_Amenities] 宜居度。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_WATER_TRANSPORT",                               "漕运"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_WATER_TRANSPORT_EFFECT",                        "城市-4 [ICON_Food] 食物，为5个单元格内少于7人口的其他城市+4 [ICON_Food] 食物"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_GRAIN_USE",                               "余粮政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_GRAIN_USE_EFFECT",                        "包括酿酒和漕运。"),

--石匠坊
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MARBLE_CITY",                                   "大理石城市"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MARBLE_CITY_EFFECT",                            "城市-4 [ICON_PRODUCTION] 生产力，+2[ICON_Amenities] 宜居度。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_BRICK_CITY",                                    "泥砖城市"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_BRICK_CITY_EFFECT",                             "城市-2 [ICON_PRODUCTION] 生产力，+2 [ICON_Housing]。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_MASONRY",                                 "石工政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_MASONRY_EFFECT",                          "包括大理石城市和泥砖城市。"),


--图书馆
    ("zh_Hans_CN",  "LOC_CITY_POLICY_REVISION_CALENDAR",                             "修订历法"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_REVISION_CALENDAR_EFFECT",                      "+2 [ICON_Science] 科技-8 [ICON_GOLD] 金币，若城市至少有3个山脉单元格则再+2 [ICON_Science] 科技。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_COLLECT_SCRIPTURES",                            "撰写史书"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_COLLECT_SCRIPTURES_EFFECT",                     "+2 [ICON_Culture] 文化-8 [ICON_GOLD] 金币，若城市是首都或有市政广场则再+2 [ICON_Culture] 文化。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_HISTORY_BOOKS",                                 "收藏经文"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_HISTORY_BOOKS_EFFECT",                          "+4 [ICON_Faith] 信仰-8 [ICON_GOLD] 金币，若城市拥有圣地则再+4 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_LIBRARY",                                 "藏书政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_LIBRARY_EFFECT",                          "包括修订历法、撰写史书和收藏经文。"),
        
--古罗马剧场
    ("zh_Hans_CN",  "LOC_CITY_POLICY_HEROIC_LEGEND",                                 "英雄传奇"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_HEROIC_LEGEND_EFFECT",                          "本城剧院的相邻加成+50%，若曾有伟人在本城激活则改为+100%。-4 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MYTHS_LEGENDS",                                 "神话传说"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_MYTHS_LEGENDS_EFFECT",                          "剧院相邻加成也提供 [ICON_Faith] 信仰值，但当本城有主流宗教时不再生效。-4 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_PLAYS",                                   "演出剧目"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_PLAYS_EFFECT",                            "包括英雄传奇和神话传说。"),
    
--神社
    ("zh_Hans_CN",  "LOC_CITY_POLICY_PRAY_FOR_RAIN",                                 "祈雨"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_PRAY_FOR_RAIN_EFFECT",                          "需要2 [ICON_GOLD] 金币的维护费。城市的无水单元格+1 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_DIVINE",                                        "占卜"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_DIVINE_EFFECT",                                 "需要2 [ICON_GOLD] 金币的维护费。城市的区域+1 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_SEA_SACRIFICE",                                 "海祭"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_SEA_SACRIFICE_EFFECT",                          "需要2 [ICON_GOLD] 金币的维护费。城市的沿岸陆地和海岸+1 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_SACRIFICE",                               "祭祀政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_SACRIFICE_EFFECT",                        "包括祈雨，占卜和海祭。"),
   

--竞技场
    ("zh_Hans_CN",  "LOC_CITY_POLICY_OLYMPIC",                                       "奥林匹克"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_OLYMPIC_EFFECT",                                "每点 [ICON_Amenities] 宜居度均提供2 [ICON_Faith] 信仰值"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_SLAVE_GLADIATUS",                               "奴隶角斗"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_SLAVE_GLADIATUS_EFFECT",                        "每点 [ICON_Amenities] 宜居度均提供3 [ICON_GOLD] 金币"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_CHIVALRY",                                      "骑士竞技"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_CHIVALRY_EFFECT",                               "每点 [ICON_Amenities] 宜居度为建造单位+2 [ICON_PRODUCTION] 生产力，若有军营则再+1 [ICON_PRODUCTION] 生产力"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_ARENA",                                   "竞技场演出项目"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_ARENA_EFFECT",                            "包括奥林匹克、奴隶角斗和骑士竞技。"),
    
--兵营
    ("zh_Hans_CN",  "LOC_CITY_POLICY_IRON_SMELTING",                                 "锻铁"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_IRON_SMELTING_EFFECT",                          "每回合+3 [ICON_RESOURCE_IRON] 铁，城市-6 [ICON_PRODUCTION] 生产力（城市中有工业区或改良的 [ICON_RESOURCE_IRON] 铁资源则改为-2 [ICON_PRODUCTION] 生产力）"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_BARRACK",                                 "军营政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_BARRACK_EFFECT",                          "包括锻铁。"),
     
--马厩
    ("zh_Hans_CN",  "LOC_CITY_POLICY_WAR_HORSE",                                     "饲养战马"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_WAR_HORSE_EFFECT",                              "每回合+3 [ICON_RESOURCE_HORSES] 马，城市-6 [ICON_Food] 食物（城市中有娱乐区或改良的 [ICON_RESOURCE_HORSES] 马资源则改为-2 [ICON_Food] 食物）"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_STABLED",                                 "马厩政策"),
    ("zh_Hans_CN",  "LOC_CITY_POLICY_EMPTY_STABLED_EFFECT",                          "包括饲养战马。");