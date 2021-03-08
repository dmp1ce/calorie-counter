let m = (../include/calorieCounter.dhall).makeMealEntryLog

let t = (../include/calorieCounter.dhall).makeMealEntryBreak

in  [ t "Meal 1"
    , m "mushroom" 10
    , m "brussels_sprout" 20
    , m "green_onion" 1
    , m "celery" 1
    , m "mushroom" 40
    ]
