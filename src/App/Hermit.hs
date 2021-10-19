module App.Hermit (
  hermit,
  getOptionsParser,
  Options(..),
) where

import Options.Applicative


-- | Record that stores all the options required by Hermit's CLI
data Options = Options
  { optPort :: Int -- ^ Port to use when running the server
  , optQuiet :: Bool -- ^ Whether or not to be verbose on output display
  } deriving (Eq, Show)


-- | Returns an `Option` `Parser` that wraps Hermit's `Options` record
getOptionsBaseParser :: Parser Options
getOptionsBaseParser = Options
  <$> option auto
      ( long "port"
      <> short 'p'
      <> metavar "PORT"
      <> showDefault
      <> value 8000
      <> help "Port to use for the HTTP server" )
  <*> switch
      ( long "quiet"
      <> short 'q'
      <> help "Whether to be quiet" )


-- | Returns an `Options` `ParserInfo` extending from `getOptionsBaseParser` with Hermit's info
getOptionsParser :: ParserInfo Options
getOptionsParser = info (getOptionsBaseParser <**> helper)
  ( fullDesc
  <> progDesc "Serve files through HTTP using Hermit"
  <> header "hermit - an HTTP server written in Haskell" )


-- | Parses input arguments and sends them to `runHermit`
runCli :: IO ()
runCli = runHermit =<< execParser getOptionsParser


-- | Given a set of valid CLI arguments, starts Hermit
runHermit :: Options -> IO ()
runHermit opts = do
  let port = optPort opts
  -- TODO: actually do something with the options
  print port


-- | Alias for `runCli`, Hermit's default action
hermit :: IO ()
hermit = runCli
