let FoodLog = ./FoodLog.dhall

let MealEntry =
    -- Break is a text divider usually for a list of food logs
    -- Log is an individual food log
      < Break : Text | Log : FoodLog >

in  MealEntry
