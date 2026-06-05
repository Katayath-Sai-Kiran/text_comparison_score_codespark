# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.8] - 2026-06-05

### Documentation
- Rewrote `description` in `pubspec.yaml` to a keyword-rich, SEO-optimised sentence covering
  fuzzy matching, string similarity, match percentages, Levenshtein, and Jaro-Winkler.
- Added `topics` to `pubspec.yaml` (`string-similarity`, `fuzzy-matching`, `string-comparison`,
  `text-similarity`, `levenshtein-distance`) for improved pub.dev search ranking.
- Replaced the one-line README description with a full SEO-focused sentence targeting common
  search terms (similarity score, fuzzy matching, string distance, Dart, Flutter).
- Moved author / maintainer credit to directly under the package title in `README.md`.
- Added **Use Cases** section to `README.md` listing real-world scenarios: fuzzy search,
  typo detection, duplicate matching, name matching, data validation, and more.


## [0.0.7] - 2026-06-03

### Documentation
- Added pub.dev version, pub points, pub likes, license, platform, and category badges to `README.md`.
- Added screenshots gallery to `README.md` (3 iPhone 15 Plus simulator captures).
- Registered all three demo screenshots in `pubspec.yaml` so pub.dev displays them on the package page.

### Example
- Rewrote `example/main.dart` as a full Flutter UI demo app showcasing all 8 comparison scenarios with score bars, algorithm badges, and explanatory captions.

---

## [0.0.6] - 2024-08-25

### Documentation
- Added maintainer credit to `README.md`.

---

## [0.0.5] - 2024-08-25

### Added
- Added the `Jaro-Winkler Distance` algorithm to the `TextComparisonScore` class.
  - This algorithm provides a string similarity score with more favorable ratings for strings that share a common prefix.
  - Added support for comparing strings using Jaro-Winkler Distance and calculating match percentage.
- Updated `README.md` with usage examples and details on when to use the Jaro-Winkler algorithm.

---

## [0.0.4] - 2024-08-13

### Added
- Added `caseSensitive` parameter to `matchPercentage` method for optional case sensitivity in string comparison.
- Updated `_levenshteinDistance` method to handle case sensitivity based on the `caseSensitive` parameter.

---

## [0.0.3] - 2024-08-13

### Fixed
- Fixed Dart Formatter Issues.
- Fixed Homepage Issue.

---

## [0.0.2] - 2024-08-13

### Added
- Added screenshots showcasing example code and output to the documentation for better understanding.
- Improved documentation with additional examples and explanations for various use cases of the `TextComparisonScore` class.
- Updated `README.md` with a more detailed usage guide and visual aids.
- Enhanced package performance and code quality with minor optimizations.

---

## [0.0.1] - 2024-08-09

### Added
- Initial release of the `text_comparison_score_codespark` package.
- Implemented the `TextComparisonScore` class with the following features:
  - `matchPercentage(String s1, String s2)`: Returns the match percentage between two strings based on the Levenshtein distance algorithm.
- Provided comprehensive unit tests for various cases including identical strings, completely different strings, and comparisons involving empty strings.
- Detailed documentation and usage examples in the `README.md`.
- License: MIT.
