import 'package:flutter_test/flutter_test.dart';
import 'package:text_comparison_score_codespark/text_comparison_score_codespark.dart';

void main() {
  group('TextComparisonScore Tests', () {
    test('Match percentage between "kitten" and "sitting"', () {
      String string1 = "kitten";
      String string2 = "sitting";

      double result = TextComparisonScore.calculateScore(string1, string2,
          algorithm: ComparisonAlgorithm.jaroWinkler);

      expect(result, 57.14285714285714);
    });

    test('Match percentage between identical strings "flutter" and "flutter"',
        () {
      String string1 = "flutter";
      String string2 = "flutter";

      double result = TextComparisonScore.calculateScore(string1, string2);

      expect(result, 100.0);
    });

    test(
        'Match percentage between completely different strings "apple" and "orange"',
        () {
      String string1 = "apple";
      String string2 = "orange";

      double result = TextComparisonScore.calculateScore(string1, string2);

      expect(result, 0.0);
    });

    test('Match percentage between "kitten" and an empty string', () {
      String string1 = "kitten";
      String string2 = "";

      double result = TextComparisonScore.calculateScore(string1, string2);

      expect(result, 0.0);
    });

    test('Match percentage between two empty strings', () {
      String string1 = "";
      String string2 = "";

      double result = TextComparisonScore.calculateScore(string1, string2);

      expect(result, 100.0);
    });

    test('Match percentage between "dart" and "start"', () {
      String string1 = "dart";
      String string2 = "start";

      double result = TextComparisonScore.calculateScore(string1, string2);

      expect(result, 75.0);
    });

    test('Match percentage between "flame" and "frame"', () {
      String string1 = "flame";
      String string2 = "frame";

      double result = TextComparisonScore.calculateScore(string1, string2);

      expect(result, 80.0);
    });
  });
}
