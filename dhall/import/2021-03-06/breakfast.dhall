let m = (../../include/calorieCounter.dhall).makeMealEntryLog

let b = (../../include/calorieCounter.dhall).makeMealEntryBreak

in  [ b "10:12 am"
    , m "blackberry" 77
    , b ""
    , m "pummelo" 97
    , b "Bowl 1 - 10:24"
    , m "salad_mix" 60
    , m "white_mushroom" 73
    , m "potato_wedge" 26
    , m "cucumber" 46
    , m "celery" 7
    , m "grape_tomatoes" 31
    , m "cooked_broccoli" 53
    , m "white_rice" 13
    , b "10:43 - Bowl 2"
    , m "raw_beet_green" 37
    , m "snap_peas" 90
    , m "mushroom" 125
    , m "avocado" 112
    , m "bell_pepper" 131
    , m "chocolate_coconut_bar" 16
    , b "bowl 3 - 11:06"
    , m "blackberry" 11
    , m "albacore_wild_tuna" 128
    , b "-- cup - 11:17"
    , m "raw_egg" 52
    ]
