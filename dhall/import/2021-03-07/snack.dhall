let m = (../../include/calorieCounter.dhall).makeMealEntryLog

let b = (../../include/calorieCounter.dhall).makeMealEntryBreak

in  [ b "3:52"
    , m "apple" 15
    , b "4:06"
    , m "blackberry" 48
    , m "apple" 1
    , b "4:09"
    , m "raspberry" 47
    ]
