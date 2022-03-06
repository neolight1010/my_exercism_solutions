module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

secondsInYearOn :: Planet -> Float
secondsInYearOn planet = case planet of
  Mercury -> 0.2408467  * secondsInYearOnEarth
  Venus   -> 0.61519726 * secondsInYearOnEarth
  Earth   -> 31557600
  Mars    -> 1.8808158 * secondsInYearOnEarth
  Jupiter -> 11.862615 * secondsInYearOnEarth
  Saturn  -> 29.447498 * secondsInYearOnEarth
  Uranus  -> 84.016846 * secondsInYearOnEarth
  Neptune -> 164.79132 * secondsInYearOnEarth
  where
    secondsInYearOnEarth = secondsInYearOn Earth

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / secondsInYearOn planet
