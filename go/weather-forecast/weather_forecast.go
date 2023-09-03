// Package weather provides tools to forecast the weather.
package weather

// CurrentCondition of the weather.
var CurrentCondition string
// CurrentLocation used for the forecast.
var CurrentLocation string

// Forecast returns a weather forecast for the given city and condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
