-- What you get for butchering a bobcat.
--
-- Required, not decorative: vanilla's setAnimalBodyData reads this table at
-- ButcheringUtil.lua:18, checks it for nil on line 19, and then indexes it
-- unguarded on line 27. An animal missing from here throws "attempted index:
-- feather of non-table: null" every time one dies, and the corpse silently
-- loses BloodQty, leather, head, skeleton and meatRatio. The long version of
-- this note is in KnoxLifeFoxes/.../KWC_FoxParts.lua.
--
-- Keys are animal type concatenated with breed name, exactly as vanilla builds
-- them. No leather, head or skull: we ship no bobcat pelt item, and vanilla
-- treats their absence correctly.

AnimalPartsDefinitions = AnimalPartsDefinitions or {};
AnimalPartsDefinitions.animals = AnimalPartsDefinitions.animals or {};

-- Female, 5 to 10 kg.
local kwc_bobcatfemaledefault = AnimalPartsDefinitions.animals["kwc_bobcatfemaledefault"] or {};
kwc_bobcatfemaledefault.parts = kwc_bobcatfemaledefault.parts or {};
table.insert(kwc_bobcatfemaledefault.parts, {item = "Base.Smallanimalmeat", minNb = 6, maxNb = 9})
kwc_bobcatfemaledefault.bones = kwc_bobcatfemaledefault.bones or {};
table.insert(kwc_bobcatfemaledefault.bones, {item = "Base.SmallAnimalBone", minNb = 4, maxNb = 7})
kwc_bobcatfemaledefault.noSkeleton = true;
kwc_bobcatfemaledefault.xpPerItem = 10;
AnimalPartsDefinitions.animals["kwc_bobcatfemaledefault"] = kwc_bobcatfemaledefault;

-- Male, 8 to 14 kg.
local kwc_bobcatmaledefault = AnimalPartsDefinitions.animals["kwc_bobcatmaledefault"] or {};
kwc_bobcatmaledefault.parts = kwc_bobcatmaledefault.parts or {};
table.insert(kwc_bobcatmaledefault.parts, {item = "Base.Smallanimalmeat", minNb = 7, maxNb = 11})
kwc_bobcatmaledefault.bones = kwc_bobcatmaledefault.bones or {};
table.insert(kwc_bobcatmaledefault.bones, {item = "Base.SmallAnimalBone", minNb = 4, maxNb = 7})
kwc_bobcatmaledefault.noSkeleton = true;
kwc_bobcatmaledefault.xpPerItem = 10;
AnimalPartsDefinitions.animals["kwc_bobcatmaledefault"] = kwc_bobcatmaledefault;

-- Kitten, 0.5 to 3 kg.
local kwc_bobcatkittendefault = AnimalPartsDefinitions.animals["kwc_bobcatkittendefault"] or {};
kwc_bobcatkittendefault.parts = kwc_bobcatkittendefault.parts or {};
table.insert(kwc_bobcatkittendefault.parts, {item = "Base.Smallanimalmeat", minNb = 2, maxNb = 4})
kwc_bobcatkittendefault.bones = kwc_bobcatkittendefault.bones or {};
table.insert(kwc_bobcatkittendefault.bones, {item = "Base.SmallAnimalBone", minNb = 2, maxNb = 4})
kwc_bobcatkittendefault.noSkeleton = true;
kwc_bobcatkittendefault.xpPerItem = 7;
AnimalPartsDefinitions.animals["kwc_bobcatkittendefault"] = kwc_bobcatkittendefault;
