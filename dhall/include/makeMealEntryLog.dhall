let MealEntry = ./types/MealEntry.dhall

let m = ../include/makeFoodLog.dhall

let makeMealEntryLog
    : Text -> Natural -> MealEntry
    = \(f : Text) ->
      \(g : Natural) ->
        let mealEntry
            : MealEntry
            = MealEntry.Log (m f g)

        in  mealEntry

in  makeMealEntryLog
