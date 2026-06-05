<p align="center">
  <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/text_comparison_score_codespark/master/assets/banner.png" alt="Banner"/>
</p>

# text_comparison_score_codespark

Calculate string similarity, text comparison scores, match percentages, fuzzy matching results, and string distance metrics using Levenshtein Distance, Jaro-Winkler, and other text comparison algorithms in Dart and Flutter.

<p align="center">
  Built by <a href="https://ksaikiran.dev">Katayath Sai Kiran</a> · <a href="https://github.com/Katayath-Sai-Kiran">@Katayath-Sai-Kiran</a>
</p>

<p align="center">
  <a href="https://pub.dev/packages/text_comparison_score_codespark">
    <img src="https://img.shields.io/pub/v/text_comparison_score_codespark?label=pub.dev&labelColor=333940&logo=dart" alt="pub.dev version"/>
  </a>
  <a href="https://pub.dev/packages/text_comparison_score_codespark/score">
    <img src="https://img.shields.io/pub/points/text_comparison_score_codespark?label=pub%20points&labelColor=333940" alt="pub points"/>
  </a>
  <a href="https://pub.dev/packages/text_comparison_score_codespark">
    <img src="https://img.shields.io/pub/likes/text_comparison_score_codespark?label=likes&labelColor=333940" alt="pub likes"/>
  </a>
  <a href="https://github.com/Katayath-Sai-Kiran/text_comparison_score_codespark/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg?labelColor=333940" alt="MIT License"/>
  </a>
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/platform-flutter-02569B?logo=flutter&labelColor=333940" alt="Platform: Flutter"/>
  </a>
  <img src="https://img.shields.io/badge/category-String%20Similarity-6A0DAD?labelColor=333940" alt="String Similarity"/>
</p>

## Screenshots

<p align="center">
  <table>
    <tr>
      <td align="center">
        <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/text_comparison_score_codespark/master/assets/screenshot_1.png" width="260" alt="Demo — score overview"/>
        <br/><sub><b>Score overview</b></sub>
      </td>
      <td align="center">
        <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/text_comparison_score_codespark/master/assets/screenshot_2.png" width="260" alt="Demo — algorithm comparison"/>
        <br/><sub><b>Algorithm comparison</b></sub>
      </td>
      <td align="center">
        <img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/text_comparison_score_codespark/master/assets/screenshot_3.png" width="260" alt="Demo — edge cases"/>
        <br/><sub><b>Edge cases</b></sub>
      </td>
    </tr>
  </table>
</p>


## Features

- **Levenshtein Distance**: Calculates the minimum number of single-character edits (insertions, deletions, or substitutions) required to change one string into the other.
- **Jaro-Winkler Distance**: Measures the similarity between two strings, taking into account the number of matching characters and transpositions, with a boost for common prefixes.
- **Match Percentage**: Returns the match percentage between two strings, indicating how similar they are.
- **Case Sensitivity Option**: Allows optional case sensitivity in string comparisons.
- **Multiple Algorithms**: Choose between different algorithms, such as Levenshtein and Jaro-Winkler, for your comparison needs.

## Use Cases

- String similarity detection
- Text similarity analysis
- Fuzzy string matching
- Fuzzy search
- String comparison
- Text comparison
- Match percentage calculation
- Confidence score generation
- Typo detection
- Search suggestions
- Duplicate record matching
- Name matching
- Data validation

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

## Maintainer

Developed with 💙 by [Katayath Sai Kiran](https://github.com/Katayath-Sai-Kiran)
Feel free to contribute or suggest improvements!





