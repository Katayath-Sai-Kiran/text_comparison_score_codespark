/// A utility class for comparing two strings and calculating their similarity score.
class TextComparisonScore {
  /// Calculates the Levenshtein distance between two strings [s1] and [s2].
  /// The Levenshtein distance is a measure of the number of single-character edits
  /// (insertions, deletions, or substitutions) required to change one string into the other.
  ///
  /// This method uses dynamic programming to efficiently calculate the distance.
  ///
  /// Returns an integer representing the Levenshtein distance between the two strings.
  static int _levenshteinDistance(String s1, String s2) {
    // Lengths of the two strings
    int m = s1.length;
    int n = s2.length;

    // Create a 2D list to store distances between substrings
    List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

    // Fill the dp array with the base cases
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

    // Return the Levenshtein distance between the full strings
    return dp[m][n];
  }

  /// Calculates the match percentage between two strings [s1] and [s2] based on the Levenshtein distance.
  ///
  /// The match percentage is calculated as the complement of the Levenshtein distance,
  /// relative to the length of the longer string.
  ///
  /// - Returns a double representing the match percentage between 0.0 (no match) and 100.0 (exact match).
  ///
  /// Example usage:
  /// ```dart
  /// double match = TextComparisonScore.matchPercentage('kitten', 'sitting');
  /// print(match); // Output: 57.14285714285714
  /// ```
  static double matchPercentage(String s1, String s2) {
    // Determine the length of the longer string
    int maxLength = s1.length > s2.length ? s1.length : s2.length;

    // If both strings are empty, return 100% match
    if (maxLength == 0) return 100.0;

    // Calculate the Levenshtein distance between the strings
    int distance = _levenshteinDistance(s1, s2);

    // Calculate and return the match percentage
    double matchPercent = ((maxLength - distance) / maxLength) * 100;
    return matchPercent;
  }
}
