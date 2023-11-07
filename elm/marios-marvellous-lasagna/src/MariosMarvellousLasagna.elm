module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers currentMinutesInOven =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes layers_ =
            layers_ * 2
    in
    expectedMinutesInOven + preparationTimeInMinutes layers - currentMinutesInOven
