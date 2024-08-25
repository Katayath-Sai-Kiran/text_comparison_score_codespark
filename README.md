

<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/text_comparison_score_codespark/master/assets/banner.png" alt="Banner"/>

# text_comparison_score_codespark

A simple yet powerful Dart package that allows you to compare two strings and determine the match percentage between them using multiple algorithms, including the Levenshtein distance and Jaro-Winkler distance.

## Features

- **Levenshtein Distance**: Calculates the minimum number of single-character edits (insertions, deletions, or substitutions) required to change one string into the other.
- **Jaro-Winkler Distance**: Measures the similarity between two strings, taking into account the number of matching characters and transpositions, with a boost for common prefixes.
- **Match Percentage**: Returns the match percentage between two strings, indicating how similar they are.
- **Case Sensitivity Option**: Allows optional case sensitivity in string comparisons.
- **Multiple Algorithms**: Choose between different algorithms, such as Levenshtein and Jaro-Winkler, for your comparison needs.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  text_comparison_score_codespark: ^0.0.5
```

Then run:

```bash
flutter pub get
```

## Usage

Here's how to use the `TextComparisonScore` class to calculate the match percentage between two strings using different algorithms:

```dart
import 'package:text_comparison_score_codespark/text_comparison_score_codespark.dart';

void main() {
  // Example 1: Simple Levenshtein comparison
  String string1 = "kitten";
  String string2 = "sitting";

  double matchPercent = TextComparisonScore.calculateScore(string1, string2, algorithm: ComparisonAlgorithm.levenshtein);
  print("Levenshtein Match Percentage between '$string1' and '$string2': $matchPercent%");

  // Example 2: Jaro-Winkler comparison
  double jaroMatchPercent = TextComparisonScore.calculateScore(string1, string2, algorithm: ComparisonAlgorithm.jaroWinkler);
  print("Jaro-Winkler Match Percentage between '$string1' and '$string2': $jaroMatchPercent%");

  // Example 3: Identical strings
  String identical1 = "flutter";
  String identical2 = "flutter";

  double identicalMatchPercent = TextComparisonScore.calculateScore(identical1, identical2);
  print("Match Percentage between identical strings '$identical1' and '$identical2': $identicalMatchPercent%");

  // Example 4: Case insensitive comparison
  String caseSensitive1 = "Hello";
  String caseSensitive2 = "hello";

  double caseSensitiveMatchPercent = TextComparisonScore.calculateScore(caseSensitive1, caseSensitive2, caseSensitive: false);
  print("Match Percentage between '$caseSensitive1' and '$caseSensitive2' (case insensitive): $caseSensitiveMatchPercent%");
}
```

### Example Output

```
- **Levenshtein Match Percentage between** `'kitten'` **and** `'sitting'`: `57.14285714285714%`
- **Jaro-Winkler Match Percentage between** `'kitten'` **and** `'sitting'`: `74.74%`
- **Match Percentage between identical strings** `'flutter'` **and** `'flutter'`: `100.0%`
- **Match Percentage between** `'Hello'` **and** `'hello'` **(case insensitive)**: `100.0%`
```

## Future Updates

In future versions, this package will include:

1. **Cosine Similarity**: Measures the cosine of the angle between two vectors, which can be used for similarity between text strings.
2. **Soundex**: A phonetic algorithm for indexing names by sound, as pronounced in English.
3. **Damerau-Levenshtein Distance**: Extends Levenshtein distance by considering transpositions of two adjacent characters as a single edit.
4. **Hamming Distance**: Measures the number of differing bits between two binary strings.
5. **Normalized Distance Measures**: Provides normalized versions of distance metrics to return values between 0 and 1.
6. **String Tokenization & N-grams**: Support for splitting strings into tokens and analyzing n-grams.
7. **Customizable Weighting**: Allows users to assign custom weights to different types of edits.
8. **Multi-Language Support**: Ensures that algorithms work with various character sets and languages.
9. **Threshold-based Matching**: Returns whether the match percentage is above a user-defined threshold.
10. **Performance Optimization for Large Texts**: Implements efficient data structures and parallel processing to handle large texts.
11. **Batch Comparison**: Allows users to compare a single string against a batch of other strings, returning the most similar ones.
12. **Detailed Comparison Report**: Provides a detailed report with multiple similarity metrics between two strings.
13. **API for Custom Comparison Functions**: Enables users to define and plug in their custom comparison functions.

## License

This project is licensed under the MIT License.
```



