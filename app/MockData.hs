module MockData where

import Types
import Data.Time.Clock (UTCTime(..), DiffTime, secondsToDiffTime)
import Data.Time.Calendar (Day, fromGregorian)

fromMidnight :: Integer -> Integer -> DiffTime
fromMidnight h m = secondsToDiffTime (60 * 60 * h) + secondsToDiffTime (60 * m)

mockDay :: Day
mockDay = fromGregorian 2018 10 31

mockStart :: Integer -> UTCTime
mockStart offs = UTCTime mockDay (fromMidnight offs 0)

mockDuration :: Int
mockDuration = 30

mockBookings :: [Booking]
mockBookings =
    [
      Booking { bookingHostId = "first"
              , bookingStart = mockStart 8
              , bookingDurationMinutes = mockDuration
              }
    , Booking { bookingHostId = "second"
              , bookingStart = mockStart 9
              , bookingDurationMinutes = mockDuration
              }
    ]

mockAppts :: [Appointment] 
mockAppts =
    [ Appointment "HostId1" (mockStart 8) mockDuration 
    , Appointment "HostId1" (mockStart 9) mockDuration
    , Appointment "HostId1" (mockStart 10) mockDuration
    , Appointment "HostId1" (mockStart 11) mockDuration
    , Appointment "HostId1" (mockStart 13) mockDuration
    , Appointment "HostId1" (mockStart 14) mockDuration
    , Appointment "HostId1" (mockStart 15) mockDuration
    ]

mockHosts :: [Host]
mockHosts = 
    [ Host "HostId1" "Adam"
    , Host "HostId2" "Bertil"
    , Host "HostId3" "Calle"
    ]