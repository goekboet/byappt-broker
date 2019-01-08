{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Network.HTTP.Types.Status
import MockData (mockHosts, mockAppts, mockBookings)
import Types (Host(..))
import Data.Aeson.Text (encodeToLazyText)
import qualified Data.Aeson as Json
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import qualified Data.ByteString.Char8 as C
import qualified Data.ByteString.Lazy as LBS
import qualified Data.List as List
import qualified Data.Map.Strict as M 

toHash :: [Host] -> M.Map String String
toHash = M.fromList . (List.map toKvp)
    where
        toKvp (Host id name) = (id, name) 
        

main :: IO ()
main = scotty 3010 $ do
    middleware logStdoutDev
    get "/hosts" $ 
        json $ toHash mockHosts
    get "/hosts/:hostId/appointments" $
        json $ mockAppts
    post "/hosts/:hostId/appointments" $
        status status201
    get "/bookings" $
        html $ encodeToLazyText mockBookings

