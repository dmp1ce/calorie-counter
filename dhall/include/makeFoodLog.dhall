let FoodLog = ./types/FoodLog.dhall

let makeFood
    : Text -> Natural -> FoodLog
    = \(foodLog : Text) ->
      \(grams : Natural) ->
        let foodLog
            : FoodLog
            = { foodLog, grams, foodLogCalories = 0.0 }

        in  foodLog

in  makeFood
