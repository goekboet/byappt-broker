{-# LANGUAGE DeriveGeneric #-}

module Types where

import           Data.Time.Clock                ( UTCTime
                                                )
import           GHC.Generics
import           Data.Aeson                     ( ToJSON
                                                , toJSON
                                                , toEncoding
                                                , genericToEncoding
                                                , defaultOptions
                                                )

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
    } deriving (Generic, Show)

instance ToJSON Appointment where
    toEncoding = genericToEncoding defaultOptions

data Booking = Booking
    { bookingHostId :: String
    , bookingStart :: UTCTime
    , bookingDurationMinutes :: Int
    } deriving (Generic, Show)

instance ToJSON Booking where
    toEncoding = genericToEncoding defaultOptions