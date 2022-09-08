module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock
  { clockHour :: Int,
    clockMinute :: Int
  }
  deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute =
  Clock
    { clockHour = dayHour,
      clockMinute = dayMinute
    }
  where
    (extraHoursInMinutes, dayMinute) = divMod minute 60
    dayHour = (hour + extraHoursInMinutes) `mod` 24

toString :: Clock -> String
toString clock = hourStr ++ ":" ++ minuteStr
  where
    hourStr = showIntWithLeadingZero (clockHour clock)
    minuteStr = showIntWithLeadingZero (clockMinute clock)

    showIntWithLeadingZero :: Int -> String
    showIntWithLeadingZero n =
      if n < 10
        then "0" ++ show n
        else show n

addDelta :: Int -> Int -> Clock -> Clock
addDelta hours minutes clock = fromHourMin totalHours totalMinutes
  where
    totalHours = clockHour clock + hours
    totalMinutes = clockMinute clock + minutes
