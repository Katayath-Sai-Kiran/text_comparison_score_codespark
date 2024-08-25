# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.5] - 2024-08-25

### Added
- Added the `Jaro-Winkler Distance` algorithm to the `TextComparisonScore` class.
  - This algorithm provides a string similarity score with more favorable ratings for strings that share a common prefix.
  - Added support for comparing strings using Jaro-Winkler Distance and calculating match percentage.
- Updated `README.md` with usage examples and details on when to use the Jaro-Winkler algorithm.

## [0.0.4] - 2024-08-13

### Added
- Added `caseSensitive` parameter to `matchPercentage` method for optional case sensitivity in string comparison.
- Updated `_levenshteinDistance` method to handle case sensitivity based on the `caseSensitive` parameter.

## [0.0.3] - 2024-08-13

### Added
- Fixed Dart Formatter Issues
- Fixed Homepage Issue

## [0.0.2] - 2024-08-13

### Added
- Added screenshots showcasing example code and output to the documentation for better understanding.
- Improved documentation with additional examples and explanations for various use cases of the `TextComparisonScore` class.
- Updated `README.md` with a more detailed usage guide and visual aids.
- Enhanced package performance and code quality with minor optimizations.

## [0.0.1] - 2024-08-09

### Added
- Initial release of the `text_comparison_score_codespark` package.
- Implemented the `TextComparisonScore` class with the following features:
  - `matchPercentage(String s1, String s2)`: Returns the match percentage between two strings based on the Levenshtein distance algorithm.
- Provided comprehensive unit tests for various cases including identical strings, completely different strings, and comparisons involving empty strings.
- Detailed documentation and usage examples in the `README.md`.
- License: MIT.
