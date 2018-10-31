module MockData where

import Types
import Data.Time.Clock (UTCTime(..), DiffTime, secondsToDiffTime)
import Data.Time.Calendar (Day, fromGregorian)

oClock :: Integer -> Integer -> DiffTime
oClock h m = secondsToDiffTime (60 * 60 * h) + secondsToDiffTime (60 * m)

mockDay :: Day
mockDay = fromGregorian 2018 10 31

mockStart :: UTCTime
mockStart = UTCTime mockDay (oClock 15 0)

mockDuration :: DiffTime
mockDuration = secondsToDiffTime (60 * 30)

mockHosts :: [Host]
mockHosts =
    [ Host { hostId = "first"
           , friendlyName = "friendly"
           }
    , Host { hostId = "second"
           , friendlyName = "also friendly"
           }
    ]

mockAppointments :: [Appointment]
mockAppointments =
    [ Appointment { appointmentHostId = "first"
                  , appointmentStart = mockStart
                  , appointmentDuration = mockDuration
                  }

    , Appointment { appointmentHostId = "second"
                  , appointmentStart = mockStart
                  , appointmentDuration = mockDuration
                  }
    ]

mockBookings :: [Booking]
mockBookings =
    [
      Booking { bookingHostId = "first"
              , bookingStart = mockStart
              , bookingDuration = mockDuration
              }
    , Booking { bookingHostId = "second"
              , bookingStart = mockStart
              , bookingDuration = mockDuration
              }
    ]