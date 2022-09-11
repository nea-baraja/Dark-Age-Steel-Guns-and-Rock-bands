insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_LAND_COMBAT' from Units where FormationClass = 'FORMATION_CLASS_LAND_COMBAT';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_LAND_UNITS' from Units where Domain = 'DOMAIN_LAND';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_NAVAL' from Units where FormationClass = 'FORMATION_CLASS_NAVAL';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_AIR' from Units where FormationClass = 'FORMATION_CLASS_AIR';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_MILITARY' from Units where FormationClass != 'FORMATION_CLASS_CIVILIAN' AND FormationClass != 'FORMATION_CLASS_SUPPORT';

insert or replace into Tags
	(Tag,									Vocabulary)
values
	('CLASS_MILITARY_ENGINEER',				'ABILITY_CLASS'),
	('CLASS_MILITARY',						'ABILITY_CLASS'),
	('CLASS_LAND_UNITS',					'ABILITY_CLASS'),
	('CLASS_AIR',							'ABILITY_CLASS'),
	('CLASS_NAVAL',							'ABILITY_CLASS'),
	('CLASS_LAND_COMBAT',					'ABILITY_CLASS');

insert or replace into TypeTags
	(Type,									Tag)
values
	('UNIT_MILITARY_ENGINEER', 'CLASS_MILITARY_ENGINEER');

insert or replace into Types
	(Type,														Kind)
values
	('ABILITY_COOPERATIVE_FLANKING',					'KIND_ABILITY'),
	('ABILITY_COOPERATIVE_SUPPORT',						'KIND_ABILITY');


insert or replace into TypeTags
	(Type,																Tag)
values
	('ABILITY_COOPERATIVE_FLANKING',					'CLASS_LAND_COMBAT'),
	('ABILITY_COOPERATIVE_SUPPORT',						'CLASS_LAND_COMBAT');

insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) values
	('ABILITY_COOPERATIVE_FLANKING',
    'LOC_ABILITY_COOPERATIVE_FLANKING_NAME',
    'LOC_ABILITY_COOPERATIVE_FLANKING_DESCRIPTION',
    1),
    ('ABILITY_COOPERATIVE_SUPPORT',
    'LOC_ABILITY_COOPERATIVE_SUPPORT_NAME',
    'LOC_ABILITY_COOPERATIVE_SUPPORT_DESCRIPTION',
    1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId							)
values
	('ABILITY_COOPERATIVE_FLANKING',						'COOPERATIVE_FLANKING_MODIFIER'		),
	('ABILITY_COOPERATIVE_SUPPORT',							'COOPERATIVE_SUPPORT_MODIFIER'		);

insert or replace into Modifiers(ModifierId, 				ModifierType) values
	('COOPERATIVE_FLANKING_MODIFIER',				'MODIFIER_PLAYER_UNIT_ADJUST_FLANKING_BONUS_MODIFIER'),
	('COOPERATIVE_SUPPORT_MODIFIER',				'MODIFIER_PLAYER_UNIT_ADJUST_SUPPORT_BONUS_MODIFIER');


insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
values
	('COOPERATIVE_FLANKING_MODIFIER',						'Percent',				50),
	('COOPERATIVE_SUPPORT_MODIFIER',						'Percent',				50);