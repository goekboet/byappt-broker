{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Types where

import           Data.Time.Clock                ( UTCTime
                                                )
import           Data.Time.Clock.POSIX          ( utcTimeToPOSIXSeconds )
import           GHC.Generics
import           Data.Aeson                     ( ToJSON
                                                , toJSON
                                                , toEncoding
                                                , genericToEncoding
                                                , defaultOptions
                                                , object
                                                , (.=))

data Host = Host
    { hostId :: String
    , friendlyName :: String
    } deriving (Generic, Show)

instance ToJSON Host where
    toEncoding = genericToEncoding defaultOptions

data Appointment = Appointment
    { appointmentHostId :: String
    , appointmentStart :: UTCTime
    , appointmentDurationMinutes :: Int
    } deriving (Show)

instance ToJSON Appointment where
    toJSON (Appointment id start dur) =
        object 
            [ "hostId" .= id
            , "start" .= (utcTimeToPOSIXSeconds start)
            , "duration" .= dur
            ]

data Booking = Booking
    { bookingHostId :: String
    , bookingStart :: UTCTime
    , bookingDurationMinutes :: Int
    } deriving (Generic, Show)

instance ToJSON Booking where
    toEncoding = genericToEncoding defaultOptions