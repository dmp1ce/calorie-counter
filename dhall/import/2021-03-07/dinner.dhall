let m = (../../include/calorieCounter.dhall).makeMealEntryLog

let b = (../../include/calorieCounter.dhall).makeMealEntryBreak

in  [ m "salad_mix" 24
    , b "5:10"
    , m "lettuce" 77
    , m "brussels_sprout" 128
    , m "cucumber" 30
    , m "cooked_broccoli" 33
    , m "mushroom" 55
    , m "fried_egg" 32
    , b "5:20"
    , b "bowl 2"
    , m "lettuce" 85
    , m "egg_plant" 202
    , m "mushroom" 53
    , m "radish" 42
    , m "asparagus" 90
    , m "cooked_mushroom" 16
    , b "6:02"
    , b "bowl 3"
    , m "lettuce" 64
    , m "radish" 40
    , m "egg_plant" 196
    , m "mushroom" 65
    , m "pecan" 30
    , m "fried_potato" 27
    , m "asparagus" 40
    , b "6:21"
    , b "bowl 4"
    , m "fried_potato" 33
    , m "asparagus" 40
    , m "cooked_mushroom" 19
    , b "bowl 5"
    , m "ramen_noodles" 65
    , b "6:30"
    , m "poached_egg" 103
    , m "fried_potato" 16
    , b "6:37"
    , b "Bowl 6"
    , m "mushroom" 68
    , m "pecan" 13
    ]
