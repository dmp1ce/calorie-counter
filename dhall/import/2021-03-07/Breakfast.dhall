let m = (../../include/calorieCounter.dhall).makeMealEntryLog

let b = (../../include/calorieCounter.dhall).makeMealEntryBreak

in  [ b "10:38"
    , m "blackberry" 149
    , b "Bowl 1"
    , m "salad_mix" 57
    , m "cooked_cauliflower" 116
    , m "cooked_broccoli" 46
    , m "snap_peas" 51
    , m "snap_peas" 32
    , m "mushroom" 81
    , b "Bowl 2"
    , m "salad_mix" 32
    , m "mushroom" 68
    , m "cooked_broccoli" 33
    , m "cooked_cauliflower" 29
    , m "avocado" 39
    , m "grape_tomatoes" 23
    , m "snap_peas" 36
    , b "Bowl 3"
    , m "salad_mix" 33
    , m "snap_peas" 36
    , m "mushroom" 50
    , m "radish_green" 22
    , m "radish" 30
    , m "avocado" 59
    , m "mushroom" 36
    , b "Bowl 3"
    , m "skipjack_wild_tuna" 128
    , b ""
    , m "vitamin_d" 0
    , m "water" 340
    , m "raw_egg" 46
    ]
