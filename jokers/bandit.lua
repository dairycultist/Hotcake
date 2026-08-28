SMODS.Joker {
    key = "bandit",

    atlas = "jokers",
    pos = { x = 3, y = 0 },

    unlocked = true,
    discovered = true,

    rarity = 1,
    cost = 2,

    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                20, -- mult
                8   -- swindling threshold
            }
        }
    end,

    calculate = function(self, card, context)

        if context.end_of_round and not context.repetition and not context.game_over and not context.blueprint and not context.individual and G.GAME.dollars > 8 then

            G.GAME.dollars = 0

            SMODS.destroy_cards(card, { bypass_eternal = true })

            return {
                message = localize("k_bandit_proc")
            }
        end

        if context.joker_main then
            return { mult = 20 }
        end

        return {}
    end
}