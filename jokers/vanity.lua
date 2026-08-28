SMODS.Joker {
    key = "vanity",

    atlas = "jokers",
    pos = { x = 2, y = 0 },

    unlocked = true,
    discovered = true,

    rarity = 3,
    cost = 7,

    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                4 -- retriggers
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        
        for _, playing_card in ipairs(G.playing_cards) do

            if playing_card and not playing_card.REMOVED then

                if playing_card:is_face() then
                    SMODS.debuff_card(playing_card, false, "debuff_from_hotcake")
                else
                    SMODS.debuff_card(playing_card, true, "debuff_from_hotcake")
                end

                SMODS.recalc_debuff(playing_card)
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        
        for _, playing_card in ipairs(G.playing_cards) do

            if playing_card and not playing_card.REMOVED then

                SMODS.debuff_card(playing_card, false, "debuff_from_hotcake")
                SMODS.recalc_debuff(playing_card)
            end
        end
    end,

    calculate = function(self, card, context)

        -- recalculate debuffs when cards (playing cards, jokers, technically consumables too but not really necessary) are added/removed
        if context.card_added or context.add_to_deck or context.buying_card or context.remove_playing_cards or context.selling_card or context.cards_destroyed then
            
            for _, playing_card in ipairs(G.playing_cards) do

                if playing_card and not playing_card.REMOVED then

                    if playing_card:is_face() then
                        SMODS.debuff_card(playing_card, false, "debuff_from_hotcake")
                    else
                        SMODS.debuff_card(playing_card, true, "debuff_from_hotcake")
                    end

                    SMODS.recalc_debuff(playing_card)
                end
            end

            return {
                message = "recalculating"
            }
        end

        -- calculating retriggers for a played card
        if context.cardarea == G.play and context.repetition and not context.repetition_only and not context.blueprint and context.other_card:is_face() then
            
            return {
                message = localize("k_again_ex"),
                repetitions = 4,
                card = card
            }
        end

        return {}
    end
}