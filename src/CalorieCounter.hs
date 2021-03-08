module CalorieCounter
    ( countCalories
    ) where

import Dhall
import qualified Data.Text.IO as T
import qualified Data.Text as T

-- CLI parser
import StdInParser (StdInput (..), parseStdInput)

data FoodLog = FoodLog { foodLog :: Text, grams :: Natural, foodLogCalories :: Double }
    deriving (Generic, Show)
instance FromDhall FoodLog

data MealEntry = Log FoodLog | Break Text
    deriving (Generic, Show)
instance FromDhall MealEntry

newtype Meal = Meal [MealEntry]
    deriving (Generic, Show)
instance FromDhall Meal

unMeal :: Meal -> [MealEntry]
unMeal (Meal m) = m

--unLog :: MealEntry -> Maybe FoodLog
--unLog (Log fl) = Just fl
--unLog _ = Nothing

--isMealEntryLog :: MealEntry -> Bool
--isMealEntryLog (Log _) = True
--isMealEntryLog _ = False

data FoodInfo = FoodInfo { foodInfo :: Text, calories :: Double }
    deriving (Generic, Show)
instance FromDhall FoodInfo

newtype FoodIndex = FoodIndex [FoodInfo]
    deriving (Generic, Show)
instance FromDhall FoodIndex

-- Helper functions for adding up cash

--greet :: StdInput -> IO ()
--greet (StdInput f False) = putStrLn $ "Hello, " ++ f
--greet _ = return ()


countCalories :: IO ()
countCalories = do
  cliOpts <- parseStdInput

  let mealFile = logFile cliOpts
      dio = debugIO (debug cliOpts)

  meal <- input Dhall.auto $ T.pack mealFile
  foodIndex <- input Dhall.auto "./dhall/import/foodIndex.dhall"

  -- Calculate calories
  let calorieMeal = setCalories' foodIndex <$> unMeal meal

  -- Warn if any food has 0 calories and not 0 grams
  warnZeroCalories calorieMeal; putStrLn ""

  -- Calculate totals and print lifeograph output
  let (grams', calories') = mealTotals $ toFoodLog $ Meal calorieMeal

  if lifeograph cliOpts
    then do putStrLn "Lifeograph journal output:\n"
            mapM_ lifeographPrintLn calorieMeal; putStrLn ""
            putStrLn $ ":meal_total_gram:=" <> show grams'
            putStrLn $ ":meal_total_calorie:=" <> show (round calories' :: Integer)
    else do putStrLn $ "Totals for " <> mealFile <> " :"
            putStrLn $ "  " <> show grams' <> " grams"
            putStrLn $ "  " <> show calories' <> " calories"

  dio $ do print (meal :: Meal)

           putStrLn ""
           putStrLn "foodIndex"
           print (foodIndex :: FoodIndex)

           putStrLn ""
           putStrLn "Test calculating the calories for 20 grams of mushrooms"
           print $ setCalories foodIndex (FoodLog "mushroom" 20 3 )

           putStrLn "\nCalculate the calories for all the foods in the meal"
           print calorieMeal

           putStrLn "\nTry to sum mushrooms"
           print  $  sumFoodLogList (toFoodLog (Meal calorieMeal)) "mushroom"


  where
    debugIO :: Bool -> IO () -> IO ()
    debugIO True f = f
    debugIO False _ = return ()
    warnZeroCalories :: [MealEntry] -> IO ()
    warnZeroCalories ms =
      let zeroCalorieEntries = filter isZeroCalories ms
      in if null zeroCalorieEntries
         then return ()
         else do putStrLn "WARNING: Some foods had zero calories."
                 putStrLn "Probably a missing food in index or mis-spelled word."
                 mapM_ (\z -> do putStr "  "
                                 ppMealEntry z) zeroCalorieEntries

-- Set calorie information to FoodLog
setCalories :: FoodIndex -> FoodLog -> FoodLog
setCalories (FoodIndex i) (FoodLog n g _) = FoodLog n g $
  foldr (\(FoodInfo n' c') a -> (if n' == n then c'*(fromRational . toRational) g else a)) 0 i

mealTotals :: [FoodLog] -> (Natural, Double)
mealTotals = foldr (\(FoodLog _ g c) (g',c') -> (g+g', c+c')) (0,0.0)

-- Set calorie for MealEntry
setCalories' :: FoodIndex -> MealEntry -> MealEntry
setCalories' fi (Log l) = Log $ setCalories fi l
setCalories' _ b@(Break _) = b

-- Combine all entries of a named FoodLog
sumFoodLogList :: [FoodLog] -> Text -> Maybe FoodLog
sumFoodLogList [] _ = Nothing
sumFoodLogList fl t = foldr (\(FoodLog n g c) a@(Just (FoodLog n' g' c')) ->
                                  if n == n'
                                  then Just (FoodLog n (g + g') (c + c'))
                                  else a) (Just (FoodLog t 0 0)) fl

toFoodLog :: Meal -> [FoodLog]
toFoodLog (Meal []) = []
toFoodLog (Meal ((Log l):xs)) = l:toFoodLog  (Meal xs)
toFoodLog (Meal ((Break _):xs)) = toFoodLog $ Meal xs

--combineDuplicates :: [FoodLog] -> [FoodLog]
--combineDuplicates = foldr


lifeographPrintLn :: MealEntry -> IO ()
lifeographPrintLn (Log (FoodLog f g _)) = T.putStrLn $ ":" <> f <> ":=" <> (T.pack .show) g
lifeographPrintLn (Break b) = T.putStrLn b

ppMealEntry :: MealEntry -> IO ()
ppMealEntry (Log (FoodLog f g c)) = T.putStrLn $ f <> ": g=" <> (T.pack .show) g <> " cal=" <> (T.pack . show) c
ppMealEntry (Break b) = T.putStrLn b


isZeroCalories :: MealEntry -> Bool
--isZeroCalories _ = True
isZeroCalories (Log (FoodLog _ g c))
  | g > 0 && c == 0 = True
  | otherwise = False
isZeroCalories _ = False
