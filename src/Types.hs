module Types where
    
import Data.Time.Clock (UTCTime, DiffTime)

data Host = Host
    { hostId :: String
    , friendlyName :: String
    }

data Appointment = Appointment
    { appointmentHostId :: String
    , appointmentStart :: UTCTime
    , appointmentDuration :: DiffTime
    }

data Booking = Booking
    { bookingHostId :: String
    , bookingStart :: UTCTime
    , bookingDuration :: DiffTime
    }