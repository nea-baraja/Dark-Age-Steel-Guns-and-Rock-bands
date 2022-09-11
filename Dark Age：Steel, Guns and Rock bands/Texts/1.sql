    ('POLICY_COASTAL_SURVEY',           'LOC_POLICY_COASTAL_SURVEY_NAME',           'LOC_POLICY_COASTAL_SURVEY_DESCRIPTION',            'CIVIC_MILITARY_TRADITION',                 null,                       'SLOT_MILITARY'),
insert or replace into DistrictModifiers(DistrictType,  ModifierId) select
    'DISTRICT_CITY_CENTER',     'HAPPINESS_'||(numbers * 2)||'_SCIENCE'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,    ModifierType,       SubjectRequirementSetId) select
    'HAPPINESS_'||(numbers * 2)||'_SCIENCE',    'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',  'RS_AT_LEAST_'||(numbers * 2)||'_AMENITIES'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_SCIENCE',    'YieldType',    'YIELD_SCIENCE'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_SCIENCE',    'Amount',   6
    from counter where numbers >= 1 and numbers <= 5;


insert or replace into DistrictModifiers(DistrictType,  ModifierId) select
    'DISTRICT_CITY_CENTER',     'HAPPINESS_'||(numbers * 2)||'_CULTURE'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,    ModifierType,       SubjectRequirementSetId) select
    'HAPPINESS_'||(numbers * 2)||'_CULTURE',    'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',  'RS_AT_LEAST_'||(numbers * 2)||'_AMENITIES'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_CULTURE',    'YieldType',    'YIELD_CULTURE'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_CULTURE',    'Amount',   6
    from counter where numbers >= 1 and numbers <= 5;


insert or replace into DistrictModifiers(DistrictType,  ModifierId) select
    'DISTRICT_CITY_CENTER',     'HAPPINESS_'||(numbers * 2)||'_GOLD'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,    ModifierType,       SubjectRequirementSetId) select
    'HAPPINESS_'||(numbers * 2)||'_GOLD',    'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',  'RS_AT_LEAST_'||(numbers * 2)||'_AMENITIES'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_GOLD',    'YieldType',    'YIELD_GOLD'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_GOLD',    'Amount',   -6
    from counter where numbers >= 1 and numbers <= 5;


insert or replace into DistrictModifiers(DistrictType,  ModifierId) select
    'DISTRICT_CITY_CENTER',     'HAPPINESS_'||(numbers * 2)||'_PRODUCTION'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into Modifiers(ModifierId,    ModifierType,       SubjectRequirementSetId) select
    'HAPPINESS_'||(numbers * 2)||'_PRODUCTION',    'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',  'RS_AT_LEAST_'||(numbers * 2)||'_AMENITIES'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_PRODUCTION',    'YieldType',    'YIELD_PRODUCTION'
    from counter where numbers >= 1 and numbers <= 5;

insert or replace into ModifierArguments(ModifierId,    Name,       Value) select
    'HAPPINESS_'||(numbers * 2)||'_PRODUCTION',    'Amount',   -6
    from counter where numbers >= 1 and numbers <= 5;
