#include <string>

namespace log_line {
std::string message(std::string line) {
  int colon_index = line.find(":");
  int message_index = colon_index + 2;

  return line.substr(message_index);
}

std::string log_level(std::string line) {
  int opening_bracket_i = line.find("[");
  int closing_bracket_i = line.find("]");

  int level_start_i = opening_bracket_i + 1;
  int level_length = closing_bracket_i - level_start_i;

  return line.substr(level_start_i, level_length);
}

std::string reformat(std::string line) {
  return message(line) + " (" + log_level(line) + ")";
}
} // namespace log_line
