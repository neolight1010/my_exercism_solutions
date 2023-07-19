#include <math.h>
#include <stdlib.h>

// daily_rate calculates the daily rate given an hourly rate
double daily_rate(double hourly_rate) {
  int hours_per_day = 8;
  return hourly_rate * hours_per_day;
}

// apply_discount calculates the price after a discount
double apply_discount(double before_discount, double discount) {
  return before_discount * (100 - discount) / 100;
}

// monthly_rate calculates the monthly rate, given an hourly rate and a discount
// The returned monthly rate is rounded up to the nearest integer.
int monthly_rate(double hourly_rate, double discount) {
  int days_per_month = 22;

  double monthly_rate_without_discount =
      daily_rate(hourly_rate) * days_per_month;
  double monthly_rate_with_discount =
      apply_discount(monthly_rate_without_discount, discount);

  return std::ceil(monthly_rate_with_discount);
}

// days_in_budget calculates the number of workdays given a budget, hourly rate,
// and discount The returned number of days is rounded down (take the floor) to
// the next integer.
int days_in_budget(int budget, double hourly_rate, double discount) {
  int daily_rate_with_discount =
      apply_discount(daily_rate(hourly_rate), discount);

  return std::floor(budget / daily_rate_with_discount);
}
