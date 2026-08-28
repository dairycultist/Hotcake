SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
}

SMODS.Atlas {
    key = "jokers",
    path = "jokers.png",
    px = 71, -- tile resolution
    py = 95
}

function neato_get_random(obj, numerator, denominator)
    -- backwards compatible randomness, hopefully (see https://github.com/Steamodded/smods/pull/661)
    if SMODS.get_probability_vars then
        return SMODS.get_probability_vars(obj, numerator, denominator)
    end
    return (G.GAME and G.GAME.probabilities.normal or 1) * numerator, denominator
end

function neato_roll_random(obj, seed, numerator, denominator)
    -- backwards compatible randomness, hopefully (see https://github.com/Steamodded/smods/pull/661)
    if SMODS.pseudorandom_probability then
        return SMODS.pseudorandom_probability(obj, seed, numerator, denominator)
    end
    return pseudorandom(seed) < (G.GAME.probabilities.normal * numerator / denominator)
end

-- load all individual jokers
for _, filename in pairs(NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers")) do
    assert(SMODS.load_file("jokers/" .. filename))()
end
