object SpaceAge {
  val onEarth: Double => Double = ageProportionalToEarthYears(1)
  val onVenus: Double => Double = ageProportionalToEarthYears(0.61519726)
  val onMercury: Double => Double = ageProportionalToEarthYears(0.2408467)
  val onMars: Double => Double = ageProportionalToEarthYears(1.8808158)
  val onJupiter: Double => Double = ageProportionalToEarthYears(11.862615)
  val onSaturn: Double => Double = ageProportionalToEarthYears(29.447498)
  val onUranus: Double => Double = ageProportionalToEarthYears(84.016846)
  val onNeptune: Double => Double = ageProportionalToEarthYears(164.79132)

  private def ageProportionalToEarthYears(earthYears: Double)(age: Double): Double =
    age / secondsInEarthYears(earthYears)

  private def secondsInEarthYears(years: Double): Double = 31557600 * years 
}
