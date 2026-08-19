-- Knox Wildlife: Bobcat -- registration.
--
-- The whole spawning side of this mod. There is no generator here and no map
-- analysis: Bobcat_RouteData.lua is baked offline by the base mod's
-- tools/gen_routes.py from habitats.json, and hands its pool over with
-- registerRoutePool. All that is left is to say what this animal is and how
-- common it was.
--
-- ITS OWN GROUND. An addon species that declares no habitat inherits whichever
-- base pool its bucket falls back to, which is fine for something shaped like a
-- raccoon and wrong for this. Declaring `habitat` against a pool of our own
-- means it inherits nothing: its own terrain, its own geometry, no sharing.

if not KnoxWildlife or (KnoxWildlife.API_VERSION or 0) < 1 then
    print("[KnoxWildlifeBobcat] Knox Wildlife not found (or too old); "
        .. "this addon needs API_VERSION 1. Not loading.")
    return
end

local KW = KnoxWildlife
local ID = "kwc_bobcat"

-- Density is the only number that decides how common this animal is. The base
-- mod turns it into routes with
--
--     routes = density * habitat area / mean group size * realism fraction
--
-- so nothing here competes with any other species or mod. Change it and only
-- this animal moves.
--
-- The rarest animal in the game, and genuinely so. It runs on the minimum-routes floor rather than its true density.
local DENSITY = 0.35

-- The animal definitions come from tools/write_definitions.py. If one failed to
-- load, registering anyway would put a group in the spawn pool whose animal does
-- not exist, so check the FEMALE first: ID is the migration GROUP and was never
-- an animal id.
if AnimalDefinitions and AnimalDefinitions.animals
    and AnimalDefinitions.animals["kwc_bobcatfemale"] == nil then
    print("[KnoxWildlifeBobcat] no animal definition for kwc_bobcatfemale; not registering. "
        .. "Its Definitions/animal file did not load.")
    return
end

if KW.registerSpecies(ID, {
    female = "kwc_bobcatfemale", male = "kwc_bobcatmale", baby = "kwc_bobcatkitten",
    possibleBreed = "default",
    minAnimal = 1, maxAnimal = 2, maxMale = 1,
    babyChance = 35,
    trackSize = "medium", speed = 0.07,
    density = DENSITY,
    habitat = ID,
    enabledOption = "KnoxWildlifeBobcat.Enabled",
    routeOption  = "KnoxWildlifeBobcat.Routes",
    groupOption  = "KnoxWildlifeBobcat.GroupSize",
}) then
    -- The bucket decides only the FALLBACK pool, and this declares its own
    -- habitat, so the weight is vestigial. Passed because addToBucket is public
    -- API from version 1 and an addon written then supplies one.
    KW.addToBucket("small", ID, 50)
    print("[KnoxWildlifeBobcat] registered on its own habitat (API v" .. KW.API_VERSION .. ")")
end
