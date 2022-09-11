UPDATE Resources SET SeaFrequency = SeaFrequency + 3 WHERE SeaFrequency <> 0 AND ResourceClassType = 'RESOURCECLASS_BONUS';
UPDATE Resources SET Frequency = Frequency + 3 WHERE Frequency <> 0 AND ResourceClassType = 'RESOURCECLASS_BONUS';
-- UPDATE Resources SET SeaFrequency = SeaFrequency + 1 WHERE SeaFrequency <> 0 AND ResourceClassType = 'RESOURCECLASS_LUXURY';--bug
UPDATE Resources SET Frequency = Frequency + 1 WHERE Frequency <> 0 AND ResourceClassType = 'RESOURCECLASS_LUXURY';
-- UPDATE Resources SET SeaFrequency = SeaFrequency + 2 WHERE SeaFrequency <> 0 AND ResourceClassType = 'RESOURCECLASS_STRATEGIC';
UPDATE Resources SET Frequency = Frequency + 6 WHERE Frequency <> 0 AND ResourceClassType = 'RESOURCECLASS_STRATEGIC';

DELETE FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' or ResourceClassType = 'RESOURCECLASS_BONUS');
INSERT OR REPLACE INTO Resource_YieldChanges
(ResourceType,				YieldType,					YieldChange)	VALUES
('RESOURCE_BANANAS',		'YIELD_FOOD',				1),
('RESOURCE_CATTLE',			'YIELD_FOOD',				1),
('RESOURCE_COPPER',			'YIELD_GOLD',				3),
('RESOURCE_CRABS',			'YIELD_GOLD',				3),
('RESOURCE_DEER',			'YIELD_PRODUCTION',			1),
('RESOURCE_FISH',			'YIELD_FOOD',				1),
('RESOURCE_RICE',			'YIELD_FOOD',				1),
('RESOURCE_SHEEP',			'YIELD_FOOD',				1),
('RESOURCE_STONE',			'YIELD_PRODUCTION',			1),
('RESOURCE_WHEAT',			'YIELD_FOOD',				1),
('RESOURCE_MAIZE',			'YIELD_GOLD',				3),

('RESOURCE_TEA',			'YIELD_SCIENCE',			1),
('RESOURCE_TURTLES',		'YIELD_SCIENCE',			1),
('RESOURCE_MERCURY',		'YIELD_SCIENCE',			1),

('RESOURCE_MARBLE',			'YIELD_CULTURE',			1),
('RESOURCE_COFFEE',			'YIELD_CULTURE',			1),
('RESOURCE_SILK',			'YIELD_CULTURE',			1),
('RESOURCE_JADE',			'YIELD_CULTURE',			1),
('RESOURCE_AMBER',			'YIELD_CULTURE',			1),

('RESOURCE_HONEY',			'YIELD_FOOD',				1),
('RESOURCE_CITRUS',			'YIELD_FOOD',				1),
('RESOURCE_WINE',			'YIELD_FOOD',				1),
('RESOURCE_SUGAR',			'YIELD_FOOD',				1),
('RESOURCE_SPICES',			'YIELD_FOOD',				1),
('RESOURCE_SALT',			'YIELD_FOOD',				1),

('RESOURCE_GYPSUM',			'YIELD_PRODUCTION',			1),
('RESOURCE_IVORY',			'YIELD_PRODUCTION',			1),
('RESOURCE_OLIVES',			'YIELD_PRODUCTION',			1),

('RESOURCE_WHALES',			'YIELD_GOLD',				3),
('RESOURCE_COCOA',			'YIELD_GOLD',				3),
('RESOURCE_COTTON',			'YIELD_GOLD',				3),
('RESOURCE_FURS',			'YIELD_GOLD',				3),
('RESOURCE_TRUFFLES',		'YIELD_GOLD',				3),
('RESOURCE_SILVER',			'YIELD_GOLD',				3),
('RESOURCE_DIAMONDS',		'YIELD_GOLD',				3),

('RESOURCE_DYES',			'YIELD_FAITH',				2),
('RESOURCE_INCENSE',		'YIELD_FAITH',				2),
('RESOURCE_TOBACCO',		'YIELD_FAITH',				2),
('RESOURCE_PEARLS',			'YIELD_FAITH',				2);

update Resource_Harvests set Amount = 40 where YieldType = 'YIELD_FOOD';
update Resource_Harvests set Amount = 40 where YieldType = 'YIELD_PRODUCTION';
update Resource_Harvests set Amount = 80 where YieldType = 'YIELD_GOLD';
