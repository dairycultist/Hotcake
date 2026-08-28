SMODS.Joker {
    key = "testjoker",
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "jokers",
    pos = { x = 3, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                10
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.game_over and not context.blueprint and not context.individual then

            return {
                message = localize("k_test_message"),
                dollars = 10
            }
        end
    end
}