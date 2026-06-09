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

  group('DamerauLevenshtein Tests', () {
    test('Transposition "teh" vs "the" scores higher than Levenshtein', () {
      double dl = TextComparisonScore.calculateScore('teh', 'the',
          algorithm: ComparisonAlgorithm.damerauLevenshtein);
      double lev = TextComparisonScore.calculateScore('teh', 'the',
          algorithm: ComparisonAlgorithm.levenshtein);
      // DL treats the swap as 1 edit (66.7%), Levenshtein counts 2 edits (33.3%)
      expect(dl, closeTo(66.67, 0.01));
      expect(dl, greaterThan(lev));
    });

    test('Adjacent transposition "ab" vs "ba" — distance 1', () {
      double result = TextComparisonScore.calculateScore('ab', 'ba',
          algorithm: ComparisonAlgorithm.damerauLevenshtein);
      expect(result, 50.0); // (2-1)/2 * 100
    });

    test('Identical strings return 100.0', () {
      double result = TextComparisonScore.calculateScore('flutter', 'flutter',
          algorithm: ComparisonAlgorithm.damerauLevenshtein);
      expect(result, 100.0);
    });

    test('Empty strings return 100.0', () {
      double result = TextComparisonScore.calculateScore('', '',
          algorithm: ComparisonAlgorithm.damerauLevenshtein);
      expect(result, 100.0);
    });

    test('One empty string returns 0.0', () {
      double result = TextComparisonScore.calculateScore('hello', '',
          algorithm: ComparisonAlgorithm.damerauLevenshtein);
      expect(result, 0.0);
    });

    test('Case insensitive transposition', () {
      double result = TextComparisonScore.calculateScore('TEH', 'the',
          algorithm: ComparisonAlgorithm.damerauLevenshtein,
          caseSensitive: false);
      expect(result, closeTo(66.67, 0.01));
    });
  });
}
