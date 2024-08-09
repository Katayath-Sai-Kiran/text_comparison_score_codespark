# text_comparison_score_codespark

A simple yet powerful Dart package that allows you to compare two strings and determine the match percentage between them using the Levenshtein distance algorithm.

## Features

- **Levenshtein Distance**: Calculates the minimum number of single-character edits (insertions, deletions, or substitutions) required to change one string into the other.
- **Match Percentage**: Returns the match percentage between two strings, indicating how similar they are.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  text_comparison_score_codespark: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

Here's how to use the `TextComparisonScore` class to calculate the match percentage between two strings:

```dart
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

  double identicalMatchPercent = TextComparisonScore.matchPercentage(identical1, identical2);
  print("Match Percentage between identical strings '$identical1' and '$identical2': $identicalMatchPercent%");

  // Example 3: Completely different strings
  String different1 = "apple";
  String different2 = "orange";

  double differentMatchPercent = TextComparisonScore.matchPercentage(different1, different2);
  print("Match Percentage between completely different strings '$different1' and '$different2': $differentMatchPercent%");

  // Example 4: One string is empty
  String emptyString = "";

  double emptyMatchPercent = TextComparisonScore.matchPercentage(string1, emptyString);
  print("Match Percentage between '$string1' and an empty string: $emptyMatchPercent%");

  // Example 5: Both strings are empty
  double bothEmptyMatchPercent = TextComparisonScore.matchPercentage(emptyString, emptyString);
  print("Match Percentage between two empty strings: $bothEmptyMatchPercent%");
}

```

### Example Output

```
- **Match Percentage between** `'kitten'` **and** `'sitting'`: `57.14285714285714%`
- **Match Percentage between identical strings** `'flutter'` **and** `'flutter'`: `100.0%`
- **Match Percentage between completely different strings** `'apple'` **and** `'orange'`: `0.0%`
- **Match Percentage between** `'kitten'` **and an empty string**: `0.0%`
- **Match Percentage between two empty strings**: `100.0%`
```

## Future Updates

In future versions, this package will include:

1. **Jaro-Winkler Distance**: A string metric for measuring the edit distance between two sequences, giving more favorable ratings to strings that match from the beginning for a set prefix length.

2. **Cosine Similarity**: Measures the cosine of the angle between two vectors, which can be used for similarity between text strings.

3. **Soundex**: A phonetic algorithm for indexing names by sound, as pronounced in English.

4. **Damerau-Levenshtein Distance**: Extends Levenshtein distance by considering transpositions of two adjacent characters as a single edit.

5. **Hamming Distance**: Measures the number of differing bits between two binary strings.

6. **Normalized Distance Measures**: Provides normalized versions of distance metrics to return values between 0 and 1.

7. **String Tokenization & N-grams**: Support for splitting strings into tokens and analyzing n-grams.

8. **Customizable Weighting**: Allows users to assign custom weights to different types of edits.

9. **Multi-Language Support**: Ensures that algorithms work with various character sets and languages.

10. **Threshold-based Matching**: Returns whether the match percentage is above a user-defined threshold.

11. **Performance Optimization for Large Texts**: Implements efficient data structures and parallel processing to handle large texts.

12. **Batch Comparison**: Allows users to compare a single string against a batch of other strings, returning the most similar ones.

13. **Detailed Comparison Report**: Provides a detailed report with multiple similarity metrics between two strings.

14. **API for Custom Comparison Functions**: Enables users to define and plug in their custom comparison functions.

## License

This project is licensed under the MIT License.

