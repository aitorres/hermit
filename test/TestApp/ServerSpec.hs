module ServerSpec where

import Data.Maybe ()
import           Test.Hspec
import qualified App.Server as S


spec :: Spec
spec = describe "`App.Server`" $ do
    it "should wrap an `Int` port in `Maybe` monad" $ do
        S.getPort 80 `shouldBe` Just "80"
        S.getPort 8080 `shouldBe` Just "8080"

    it "should return a local hostname" $ do
        S.getHostName `shouldBe` Just "127.0.0.1"
