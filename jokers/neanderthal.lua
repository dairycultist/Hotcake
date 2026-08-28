SMODS.Joker {
    key = "neanderthal",

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

        if context.joker_main then

            local has_scoring_spade = false

            for _, scoring_card in ipairs(context.scoring_hand) do
                
                if scoring_card:is_suit("Spades", false) then
                    has_scoring_spade = true
                end
            end

            if (has_scoring_spade) and context.poker_hands["Flush"] and next(context.poker_hands["Flush"]) then

                SMODS.upgrade_poker_hands({ hands = "Flush", from = card })
            end
        end

        return {}
    end
}