let FoodInfo = ./types/FoodInfo.dhall

let makeFoodInfo
    : Text -> Double -> FoodInfo
    = \(foodInfo : Text) ->
      \(calories : Double) ->
        let foodInfo
            : FoodInfo
            = { foodInfo, calories }

        in  foodInfo

in  makeFoodInfo
