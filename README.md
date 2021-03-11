# calorie-counter

Example of using Dhall with a simple command line interface for counting calories.


## Usage

`$ stack build`

```
$ stack exec -- calorie-counter-exe --help
hello - a test for optparse-applicative

Usage: calorie-counter-exe FILE [-d|--debug] [-l|--lifeograph]
  Print a greeting for TARGET

Available options:
  FILE                     Meal log file
  -d,--debug               Print debug output
  -l,--lifeograph          Print in lifeograph log format
  -h,--help                Show this help text
```

```
$ stack exec -- calorie-counter-exe -l ./dhall/import/meal1.dhall
Lifeograph journal output:

Meal 1
:mushroom:=10
:brussels_sprout:=20
:green_onion:=1
:celery:=1
:mushroom:=40

:meal_total_gram:=72
:meal_total_calorie:=23
```
