import 'dart:developer';

import 'package:text_comparison_score_codespark/text_comparison_score_codespark.dart';

void main() {
  // Example 1: Simple comparison
  String string1 = "kitten";
  String string2 = "sitting";

  double matchPercent = TextComparisonScore.calculateScore(string1, string2);
  log("Match Percentage between '$string1' and '$string2': $matchPercent%");

  // Example 2: Identical strings
  String identical1 = "flutter";
  String identical2 = "flutter";

  double identicalMatchPercent =
      TextComparisonScore.calculateScore(identical1, identical2);
  log("Match Percentage between identical strings '$identical1' and '$identical2': $identicalMatchPercent%");

  // Example 3: Completely different strings
  String different1 = "apple";
  String different2 = "orange";

  double differentMatchPercent =
      TextComparisonScore.calculateScore(different1, different2);
  log("Match Percentage between completely different strings '$different1' and '$different2': $differentMatchPercent%");

  // Example 4: One string is empty
  String emptyString = "";

  double emptyMatchPercent =
      TextComparisonScore.calculateScore(string1, emptyString);
  log("Match Percentage between '$string1' and an empty string: $emptyMatchPercent%");

  // Example 5: Both strings are empty
  double bothEmptyMatchPercent =
      TextComparisonScore.calculateScore(emptyString, emptyString);
  log("Match Percentage between two empty strings: $bothEmptyMatchPercent%");

  // Example 6: Case insensitive comparison
  String caseSensitive1 = "Hello";
  String caseSensitive2 = "hello";

  double caseSensitiveMatchPercent = TextComparisonScore.calculateScore(
      caseSensitive1, caseSensitive2,
      caseSensitive: false);
  log("Match Percentage between '$caseSensitive1' and '$caseSensitive2' (case insensitive): $caseSensitiveMatchPercent%");

  // Example 7: Case sensitive comparison
  String caseSensitive3 = "Hello";
  String caseSensitive4 = "hello";

  double caseSensitiveMatchPercent2 = TextComparisonScore.calculateScore(
      caseSensitive1, caseSensitive2,
      caseSensitive: true);
  log("Match Percentage between '$caseSensitive3' and '$caseSensitive4' (case sensitive): $caseSensitiveMatchPercent2%");
}
