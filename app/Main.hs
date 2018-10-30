{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Monoid (mconcat)

main :: IO ()
main = scotty 3010 $ do
    get "/hosts" $ html "<p>GET /hosts </p>"
    get "/hosts/:hostId/appointments" $ do
        hostId <- param "hostId"
        html $ mconcat ["<p>GET /host/", hostId, "/appointments </p>"]
    post "/bookings/:appointmentId" $ do
        apptId <- param "appointmentId"
        html $ mconcat ["<p>POST /bookings/", apptId, "</p>"]
    get "/bookings" $ html "<p>GET /bookings</p>"

