let m = (../../include/calorieCounter.dhall).makeMealEntryLog

let b = (../../include/calorieCounter.dhall).makeMealEntryBreak

in  [ b "1:20 pm"
    , m "plantain" 270
    , m "bell_pepper" 117
    , m "walnut" 33
    , m "brussels_sprout" 223
    , m "cucumber" 67
    , m "snap_peas" 57
    , b "rough total 762"
    ]
