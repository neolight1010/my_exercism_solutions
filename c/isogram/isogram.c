#include "isogram.h"
#include <stddef.h>
#include <string.h>

bool is_isogram(const char *phrase) {
  if (phrase == NULL) {
    return false;
  }

  char *found_letters = "";

  for (int i = 0; i < (int)strlen(phrase); i++) {
    char c = phrase[i];

    bool is_duplicate_letter = false;
    for (int j = 0; j < (int)strlen(found_letters); j++) {
      if (found_letters[j] == c) {
        is_duplicate_letter = true;
        break;
      }
    }

    if (is_duplicate_letter) {
      return false;
    }

    found_letters = strncat(found_letters, &c, 1);
  }

  return true;
}
