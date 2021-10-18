module HermitSpec where

import           Options.Applicative
import           Test.Hspec
import qualified App.Hermit as H


spec :: Spec
spec = describe "`App.Hermit`" $ do
    it "should generate a default `Options` record" $ do
        execParser H.getOptionsParser >>= shouldBe (H.Options {H.optPort = 8000, H.optQuiet = False})
