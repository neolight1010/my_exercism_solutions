package cars

import "math"

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * (successRate / 100)
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	return int(CalculateWorkingCarsPerHour(productionRate, successRate) / 60)
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
	ten_cars_cost := 95_000
	single_car_cost := 10_000

	ten_car_groups := int(math.Floor(float64(carsCount) / 10.0))
	remaining_single_cars := carsCount - (10 * ten_car_groups)

	return uint(ten_car_groups*ten_cars_cost + remaining_single_cars*(single_car_cost))
}
