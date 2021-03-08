let {-
    References:
    https://nutritiondata.self.com/
    https://www.fatsecret.com/calories-nutrition
     -}
    m =
      (../include/calorieCounter.dhall).makeFoodInfo

in  [ m "mushroom" 0.27
    , m "raspberry" 0.52
    , m "brussels_sprout" 0.43
    , m "lettuce" 0.14
    , m "egg_plant" 0.65
    , m "green_onion" 0.32
    , m "celery" 0.14
    , m "blackberry" 0.43
    , m "pummelo" 0.38
    , m "salad_mix" 0.17647058
    , m "pecan" 6.91
    , m "ramen_noodles" 1.37
    , m "cooked_mushroom" 0.48
    , m "white_mushroom" 0.235294118
    , m "fried_potato" 1.72
    , m "asparagus" 0.39
    , m "potato_wedge" 1.49
    , m "cucumber" 0.117647059
    , m "grape_tomatoes" 0.18
    , m "cooked_broccoli" 0.235294118
    , m "cooked_cauliflower" 0.235294118
    , m "white_rice" 1.29
    , m "raw_beet_green" 0.22
    , m "raw_beet" 0.43
    , m "snap_peas" 0.411764706
    , m "avocado" 1.6
    , m "bell_pepper" 0.26
    , m "chocolate_coconut_bar" 4.0
    , m "skipjack_wild_tuna" 1.058823529
    , m "albacore_wild_tuna" 1.176470588
    , m "water" 0.0
    , m "vitamin_d" 0.0
    , m "fried_egg" 2.01
    , m "poached_egg" 1.46
    , m "raw_egg" 1.47
    , m "radish" 0.16
    , m "radish_green" 0.16
    , m "plantain" 1.16
    , m "walnut" 6.54
    , m "apple" 0.52
    ]
