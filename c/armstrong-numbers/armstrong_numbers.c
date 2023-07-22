#include "armstrong_numbers.h"
#include <math.h>
#include <stdio.h>

bool is_armstrong_number(int candidate) {
  int armstrong_sum = calculate_armstrong_sum(candidate);

  return candidate == armstrong_sum;
}

int calculate_armstrong_sum(int n) {
  int num_digits = calculate_num_digits(n);

  int current_n = n;
  int armstrong_sum = 0;

  while (current_n >= 1) {
    int digit = current_n % 10;
    armstrong_sum += pow(digit, num_digits);
    current_n /= 10;
  }

  return armstrong_sum;
}

int calculate_num_digits(int n) { return log10(n) + 1; }
