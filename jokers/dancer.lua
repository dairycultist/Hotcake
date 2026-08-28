SMODS.Joker {
    key = "dancer",

    atlas = "jokers",
    pos = { x = 4, y = 0 },

    unlocked = true,
    discovered = true,

    rarity = 1,
    cost = 3,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                5 -- dollars earned per queen
            }
        }
    end,

    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then

            return { dollars = 5 }
        end

        return {}
    end
}