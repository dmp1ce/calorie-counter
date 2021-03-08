module StdInParser where

import Options.Applicative

data StdInput = StdInput
              { logFile :: String
              , debug   :: Bool
              , lifeograph :: Bool
              }

stdInputParser :: Parser StdInput
stdInputParser = StdInput
                <$> argument str
                ( metavar "FILE"
                  <> help "Meal log file"
                )
                <*> switch
                ( long "debug"
                  <> short 'd'
                  <> help "Print debug output"
                )
                <*> switch
                ( long "lifeograph"
                  <> short 'l'
                  <> help "Print in lifeograph log format"
                )

parseStdInput :: IO StdInput
parseStdInput = execParser opts
  where
    opts = info (stdInputParser <**> helper)
      ( fullDesc
     <> progDesc "Print a greeting for TARGET"
     <> header "hello - a test for optparse-applicative" )
