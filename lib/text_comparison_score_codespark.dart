/// An enumeration of text comparison algorithms.
enum ComparisonAlgorithm {
  levenshtein,
  jaroWinkler,
}

/// A utility class for comparing two strings and calculating their similarity score.
class TextComparisonScore {
  /// Calculates the Levenshtein distance between two strings [s1] and [s2].
  /// The Levenshtein distance is a measure of the number of single-character edits
  /// (insertions, deletions, or substitutions) required to change one string into the other.
  ///
  /// This method uses dynamic programming to efficiently calculate the distance.
  ///
  /// - [s1]: The first string to compare.
  /// - [s2]: The second string to compare.
  /// - [caseSensitive]: Whether the comparison should be case sensitive.
  ///
  /// Returns an integer representing the Levenshtein distance between the two strings.
  static int _levenshteinDistance(String s1, String s2, bool caseSensitive) {
    if (!caseSensitive) {
      s1 = s1.toLowerCase();
      s2 = s2.toLowerCase();
    }

    int m = s1.length;
    int n = s2.length;
    List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

    for (int i = 0; i <= m; i++) {
      for (int j = 0; j <= n; j++) {
        if (i == 0) {
          dp[i][j] = j; // Deletion cost
        } else if (j == 0) {
          dp[i][j] = i; // Insertion cost
        } else if (s1[i - 1] == s2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1]; // No operation needed
        } else {
          dp[i][j] = 1 + [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]]
              .reduce((a, b) => a < b ? a : b); // Minimum of insert, delete, or replace
        }
      }
    }

    return dp[m][n];
  }

  /// Calculates the Jaro-Winkler distance between two strings [s1] and [s2].
  /// The Jaro-Winkler distance is a measure of similarity between two strings,
  /// taking into account the number of matching characters and transpositions,
  /// with an added boost for common prefixes.
  ///
  /// - [s1]: The first string to compare.
  /// - [s2]: The second string to compare.
  /// - [caseSensitive]: Whether the comparison should be case sensitive.
  ///
  /// Returns a double representing the Jaro-Winkler distance between 0.0 (no match) and 1.0 (exact match).
  static double _jaroWinklerDistance(String s1, String s2, {bool caseSensitive = true}) {
    if (s1.isEmpty || s2.isEmpty) {
      return 0.0; // Return 0 if either string is empty
    }

    if (!caseSensitive) {
      s1 = s1.toLowerCase();
      s2 = s2.toLowerCase();
    }

    int len1 = s1.length;
    int len2 = s2.length;
    int maxDistance = (len1 > len2 ? len1 : len2) ~/ 2 - 1;

    List<bool> s1Matches = List<bool>.filled(len1, false);
    List<bool> s2Matches = List<bool>.filled(len2, false);

    int matches = 0;
    for (int i = 0; i < len1; i++) {
      int start = (i - maxDistance > 0) ? i - maxDistance : 0;
      int end = (i + maxDistance + 1 < len2) ? i + maxDistance + 1 : len2;

      for (int j = start; j < end; j++) {
        if (s2Matches[j] || s1[i] != s2[j]) continue;
        s1Matches[i] = true;
        s2Matches[j] = true;
        matches++;
        break;
      }
    }

    if (matches == 0) return 0.0; // Return 0 if no matches are found

    int transpositions = 0;
    int k = 0;
    for (int i = 0; i < len1; i++) {
      if (!s1Matches[i]) continue;
      while (!s2Matches[k]) {
        k++;
      }
      if (s1[i] != s2[k]) transpositions++;
      k++;
    }
    transpositions ~/= 2;

    double jaroDistance = (matches / len1 +
            matches / len2 +
            (matches - transpositions) / matches) /
        3.0;

    int prefixLength = 0;
    for (int i = 0; i < len1 && i < len2 && s1[i] == s2[i]; i++) {
      prefixLength++;
    }
    prefixLength = prefixLength > 4 ? 4 : prefixLength;

    return jaroDistance + (prefixLength * 0.1 * (1 - jaroDistance));
  }

  /// Calculates the similarity score between two strings [s1] and [s2] based on the specified algorithm.
  ///
  /// The score is calculated using the selected algorithm, and the result is returned as a percentage.
  ///
  /// - [s1]: The first string to compare.
  /// - [s2]: The second string to compare.
  /// - [algorithm]: The comparison algorithm to use. Options include [ComparisonAlgorithm.levenshtein] and [ComparisonAlgorithm.jaroWinkler].
  /// - [caseSensitive]: Whether the comparison should be case sensitive.
  ///
  /// - Returns a double representing the match percentage between 0.0 (no match) and 100.0 (exact match).
  ///
  /// Example usage:
  /// ```dart
  /// double match = TextComparisonScore.calculateScore('kitten', 'sitting', algorithm: ComparisonAlgorithm.levenshtein);
  /// print(match); // Output: 57.14285714285714
  /// ```
  static double calculateScore(String s1, String s2,
      {ComparisonAlgorithm algorithm = ComparisonAlgorithm.levenshtein, bool caseSensitive = true}) {
    if (algorithm == ComparisonAlgorithm.levenshtein) {
      // Calculate Levenshtein distance and return match percentage
      int distance = _levenshteinDistance(s1, s2, caseSensitive);
      int maxLength = s1.length > s2.length ? s1.length : s2.length;
      if (maxLength == 0) return 100.0;
      return ((maxLength - distance) / maxLength) * 100;
    } else if (algorithm == ComparisonAlgorithm.jaroWinkler) {
      // Calculate Jaro-Winkler distance and return match percentage
      return _jaroWinklerDistance(s1, s2, caseSensitive:caseSensitive) * 100;
    } else {
      throw ArgumentError('Unsupported algorithm: $algorithm');
    }
  }
}
