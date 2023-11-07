module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)


expectedMinutesInOven : Int
expectedMinutesInOven =
    40


preparationTimeInMinutes : Int -> Int
preparationTimeInMinutes layers =
    let
        minutesPerLayer =
            2
    in
    layers * minutesPerLayer


elapsedTimeInMinutes : Int -> Int -> Int
elapsedTimeInMinutes layers currentMinutes =
    preparationTimeInMinutes layers + currentMinutes
