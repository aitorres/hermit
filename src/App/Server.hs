module App.Server (
    getHostName,
    getPort,
    getSocket,
) where

import Data.Maybe ()
import Network.Socket

-- | Returns the default hostname for the server
-- TODO: allow for hostname customization?
getHostName :: Maybe String
getHostName = Just "127.0.0.1"


-- | Given an `Int` port, wraps and returns the port as a `Maybe String`
getPort :: Int -> Maybe String
getPort p = Just $ show p


-- | Given an `Int` port, opens up and returns a `Socket` bound to that port
getSocket :: Int -> IO Socket
getSocket p = do
    let hints = defaultHints { addrFlags = [AI_NUMERICHOST, AI_NUMERICSERV], addrSocketType = Stream }
    addrInfo:_ <- getAddrInfo (Just hints) getHostName $ getPort p
    socket (addrFamily addrInfo) (addrSocketType addrInfo) (addrProtocol addrInfo)
