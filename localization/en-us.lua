return {
    descriptions = {
        Joker = {
            j_hotcake_bandit = {
                name = "Bandit",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "At the end of round, if you",
                    "have more than {C:money}$#2#{}, this card",
                    "is destroyed, sets money to {C:money}$0{}"
                }
            },
            j_hotcake_movie_theater = {
                name = "Movie Theater",
                text = {
                    "When {C:attention}Boss Blind{} is selected,",
                    "create a {C:negative}Negative{} {C:attention}Popcorn{} or {C:attention}Diet Cola{}"
                }
            },
            j_hotcake_neanderthal = {
                name = "Neanderthal",
                text = {
                    "Played hands that contain a {C:attention}Flush{}",
                    "and a scoring {C:attention}Spade{} level up",
                    "{C:attention}Flush{} by {C:attention}1{}"
                }
            },
            j_hotcake_vanity = {
                name = "Vanity",
                text = {
                    "Retrigger {C:attention}face{} cards {C:attention}#1#{} additional",
                    "times, {C:attention}number{} cards and {C:attention}Aces{} are",
                    "debuffed",
                    "{C:inactive}(Interactions with Pareidolia are bugged right now){}"
                }
            }
        }
    },
    misc = {
        dictionary = {
            k_bandit_proc = "Swindled!",
            k_movie_theater_proc = "Action!"
        }
    }
}