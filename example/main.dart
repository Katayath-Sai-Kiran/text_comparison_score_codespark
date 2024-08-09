import 'package:text_comparison_score_codespark/text_comparison_score_codespark.dart';

void main() {
  // Example 1: Simple comparison
  String string1 = "kitten";
  String string2 = "sitting";

  double matchPercent = TextComparisonScore.matchPercentage(string1, string2);
  print("Match Percentage between '$string1' and '$string2': $matchPercent%");

  // Example 2: Identical strings
  String identical1 = "flutter";
  String identical2 = "flutter";

  double identicalMatchPercent =
      TextComparisonScore.matchPercentage(identical1, identical2);
  print(
      "Match Percentage between identical strings '$identical1' and '$identical2': $identicalMatchPercent%");

  // Example 3: Completely different strings
  String different1 = "apple";
  String different2 = "orange";

  double differentMatchPercent =
      TextComparisonScore.matchPercentage(different1, different2);
  print(
      "Match Percentage between completely different strings '$different1' and '$different2': $differentMatchPercent%");

  // Example 4: One string is empty
  String emptyString = "";

  double emptyMatchPercent =
      TextComparisonScore.matchPercentage(string1, emptyString);
  print(
      "Match Percentage between '$string1' and an empty string: $emptyMatchPercent%");

  // Example 5: Both strings are empty
  double bothEmptyMatchPercent =
      TextComparisonScore.matchPercentage(emptyString, emptyString);
  print("Match Percentage between two empty strings: $bothEmptyMatchPercent%");
}
