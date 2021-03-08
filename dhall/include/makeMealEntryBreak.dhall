let MealEntry = ./types/MealEntry.dhall

let makeMealEntryBreak
    : Text -> MealEntry
    = \(t : Text) ->
        let mealEntry
            : MealEntry
            = MealEntry.Break t

        in  mealEntry

in  makeMealEntryBreak
