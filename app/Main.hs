{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Network.HTTP.Types.Status
import MockData (mockHosts, mockAppointments, mockBookings)
import Data.Aeson.Text (encodeToLazyText)

main :: IO ()
main = scotty 3010 $ do
    get "/hosts" $ 
        html $ encodeToLazyText mockHosts
    get "/hosts/:hostId/appointments" $
        html $ encodeToLazyText mockAppointments
    post "/bookings/:appointmentId" $
        status status201
    get "/bookings" $
        html $ encodeToLazyText mockBookings

