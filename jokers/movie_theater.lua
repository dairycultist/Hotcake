SMODS.Joker {
    key = "movie_theater",

    atlas = "jokers",
    pos = { x = 2, y = 0 },

    unlocked = true,
    discovered = true,

    rarity = 2,
    cost = 4,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    calculate = function(self, card, context)

        if context.setting_blind and G.GAME.blind and (G.GAME.blind.boss or G.GAME.blind.showdown) then

            local joker_to_emplace = Card(
                G.jokers.T.x,
                G.jokers.T.y,
                G.CARD_W,
                G.CARD_H,
                G.P_CARDS.empty,
                G.P_CENTERS[SMODS.pseudorandom_probability(card, "unique_key_for_hotcake", 1, 2, "unique_key_for_hotcake", true) and "j_popcorn" or "j_diet_cola"]
            )

            joker_to_emplace:set_edition("e_negative", true, true)

            G.jokers:emplace(joker_to_emplace)

            return {
                message = localize("k_movie_theater_proc")
            }
        end

        return {}
    end
}