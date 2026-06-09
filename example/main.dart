import 'package:flutter/material.dart';
import 'package:text_comparison_score_codespark/text_comparison_score_codespark.dart';

void main() {
  runApp(const TextComparisonDemoApp());
}

// ─────────────────────────────────────────────────────────────────────────────
// Hardcoded showcase examples used throughout the demo UI.
// ─────────────────────────────────────────────────────────────────────────────
class _Example {
  final String label;
  final String description;
  final String s1;
  final String s2;
  final ComparisonAlgorithm algorithm;
  final bool caseSensitive;

  const _Example({
    required this.label,
    required this.description,
    required this.s1,
    required this.s2,
    this.algorithm = ComparisonAlgorithm.levenshtein,
    this.caseSensitive = true,
  });

  double get score => TextComparisonScore.calculateScore(
        s1,
        s2,
        algorithm: algorithm,
        caseSensitive: caseSensitive,
      );
}

const List<_Example> _examples = [
  _Example(
    label: 'Similar words',
    description: 'Levenshtein distance between "kitten" and "sitting".\n'
        'Three single-character edits separate them.',
    s1: 'kitten',
    s2: 'sitting',
    algorithm: ComparisonAlgorithm.levenshtein,
  ),
  _Example(
    label: 'Identical strings',
    description: 'Comparing "flutter" with itself always yields 100 %,\n'
        'regardless of the chosen algorithm.',
    s1: 'flutter',
    s2: 'flutter',
    algorithm: ComparisonAlgorithm.levenshtein,
  ),
  _Example(
    label: 'Completely different',
    description: '"apple" vs "orange" share no common characters in the\n'
        'Levenshtein sense, resulting in a 0 % match.',
    s1: 'apple',
    s2: 'orange',
    algorithm: ComparisonAlgorithm.levenshtein,
  ),
  _Example(
    label: 'Case-insensitive match',
    description: '"Hello" vs "hello" with caseSensitive: false.\n'
        'Case is normalised before comparison, giving 100 %.',
    s1: 'Hello',
    s2: 'hello',
    algorithm: ComparisonAlgorithm.levenshtein,
    caseSensitive: false,
  ),
  _Example(
    label: 'Case-sensitive mismatch',
    description: 'Same pair with caseSensitive: true (default).\n'
        '"H" ≠ "h", so the score drops below 100 %.',
    s1: 'Hello',
    s2: 'hello',
    algorithm: ComparisonAlgorithm.levenshtein,
    caseSensitive: true,
  ),
  _Example(
    label: 'Jaro-Winkler — similar words',
    description: 'Jaro-Winkler rewards shared prefixes, so "kitten" vs\n'
        '"sitting" scores higher than with Levenshtein.',
    s1: 'kitten',
    s2: 'sitting',
    algorithm: ComparisonAlgorithm.jaroWinkler,
  ),
  _Example(
    label: 'Jaro-Winkler — near match',
    description: '"flutter" vs "flatter": one character differs in the\n'
        'middle; Jaro-Winkler reflects the strong prefix match.',
    s1: 'flutter',
    s2: 'flatter',
    algorithm: ComparisonAlgorithm.jaroWinkler,
  ),
  _Example(
    label: 'One empty string',
    description: 'When one input is empty the match is 0 % because every\n'
        'character must be inserted or deleted.',
    s1: 'kitten',
    s2: '',
    algorithm: ComparisonAlgorithm.levenshtein,
  ),
  _Example(
    label: 'DL — transposition typo',
    description: '"teh" vs "the" is a single adjacent transposition.\n'
        'Damerau-Levenshtein counts it as 1 edit (66.67 %),\n'
        'while standard Levenshtein counts 2 edits (33.33 %).',
    s1: 'teh',
    s2: 'the',
    algorithm: ComparisonAlgorithm.damerauLevenshtein,
  ),
  _Example(
    label: 'DL — adjacent swap',
    description: '"ab" vs "ba": a pure swap of two adjacent characters.\n'
        'Damerau-Levenshtein scores this at 50 % (1 edit out of 2).',
    s1: 'ab',
    s2: 'ba',
    algorithm: ComparisonAlgorithm.damerauLevenshtein,
  ),
  _Example(
    label: 'DL — real-world typo',
    description: '"recieve" is a common misspelling of "receive".\n'
        'Damerau-Levenshtein correctly identifies the ie↔ei swap\n'
        'as a single transposition.',
    s1: 'recieve',
    s2: 'receive',
    algorithm: ComparisonAlgorithm.damerauLevenshtein,
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Root app widget
// ─────────────────────────────────────────────────────────────────────────────
class TextComparisonDemoApp extends StatelessWidget {
  const TextComparisonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextComparisonScore Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF0057D9),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const _DemoHomePage(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Main demo page
// ─────────────────────────────────────────────────────────────────────────────
class _DemoHomePage extends StatelessWidget {
  const _DemoHomePage();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      body: CustomScrollView(
        slivers: [
          // ── App bar ────────────────────────────────────────────────────────
          SliverAppBar.large(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            title: const Text(
              'TextComparisonScore',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Text(
                  'Levenshtein · Damerau-Levenshtein · Jaro-Winkler',
                  style: TextStyle(
                    color: colorScheme.onPrimary.withValues(alpha: 0.85),
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),

          // ── Quick-stats strip ───────────────────────────────────────────────
          const SliverToBoxAdapter(
            child: _StatsStrip(examples: _examples),
          ),

          // ── Section header ──────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'Comparison examples',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),

          // ── Example cards ───────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            sliver: SliverList.separated(
              itemCount: _examples.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) => _ExampleCard(example: _examples[i]),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Horizontal quick-stats strip at the top
// ─────────────────────────────────────────────────────────────────────────────
class _StatsStrip extends StatelessWidget {
  final List<_Example> examples;
  const _StatsStrip({required this.examples});

  @override
  Widget build(BuildContext context) {
    final avg =
        examples.map((e) => e.score).reduce((a, b) => a + b) / examples.length;
    final perfect = examples.where((e) => e.score == 100).length;
    final zero = examples.where((e) => e.score == 0).length;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Stat(label: 'Examples', value: '${examples.length}'),
          _StatDivider(),
          _Stat(label: 'Avg score', value: '${avg.toStringAsFixed(1)}%'),
          _StatDivider(),
          _Stat(label: '100 % matches', value: '$perfect'),
          _StatDivider(),
          _Stat(label: '0 % matches', value: '$zero'),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: cs.onPrimaryContainer)),
        const SizedBox(height: 2),
        Text(label,
            style: TextStyle(
                fontSize: 11,
                color: cs.onPrimaryContainer.withValues(alpha: 0.7))),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 1,
        height: 36,
        color: Theme.of(context)
            .colorScheme
            .onPrimaryContainer
            .withValues(alpha: 0.2),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual example card
// ─────────────────────────────────────────────────────────────────────────────
class _ExampleCard extends StatelessWidget {
  final _Example example;
  const _ExampleCard({required this.example});

  // Colour the score bar based on similarity level.
  Color _barColor(double score, ColorScheme cs) {
    if (score >= 80) return Colors.green.shade600;
    if (score >= 50) return Colors.orange.shade600;
    return Colors.red.shade500;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final score = example.score;
    final barColor = _barColor(score, cs);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.outlineVariant),
      ),
      color: cs.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Card header: label + algorithm badge ──────────────────────
            Row(
              children: [
                Expanded(
                  child: Text(
                    example.label,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                _AlgorithmBadge(algorithm: example.algorithm),
              ],
            ),

            const SizedBox(height: 10),

            // ── String pair display ───────────────────────────────────────
            _StringPairRow(s1: example.s1, s2: example.s2),

            const SizedBox(height: 12),

            // ── Score percentage + coloured bar ───────────────────────────
            Row(
              children: [
                Text(
                  '${score.toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: barColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: score / 100,
                      minHeight: 10,
                      backgroundColor: cs.surfaceContainerHigh,
                      valueColor: AlwaysStoppedAnimation<Color>(barColor),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // ── Description ───────────────────────────────────────────────
            Text(
              example.description,
              style: TextStyle(fontSize: 12.5, color: cs.onSurfaceVariant),
            ),

            // ── Case sensitivity tag ──────────────────────────────────────
            if (!example.caseSensitive) ...[
              const SizedBox(height: 8),
              _Tag(label: 'case-insensitive', color: cs.tertiaryContainer),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shows the two strings side-by-side with an arrow between them.
// ─────────────────────────────────────────────────────────────────────────────
class _StringPairRow extends StatelessWidget {
  final String s1;
  final String s2;
  const _StringPairRow({required this.s1, required this.s2});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final pill = BoxDecoration(
      color: cs.secondaryContainer,
      borderRadius: BorderRadius.circular(8),
    );
    final style = TextStyle(
      fontFamily: 'monospace',
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: cs.onSecondaryContainer,
    );

    Widget pillWidget(String text) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: pill,
          child: Text(
            text.isEmpty ? '(empty)' : '"$text"',
            style: style.copyWith(
              fontStyle: text.isEmpty ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        );

    return Row(
      children: [
        pillWidget(s1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.compare_arrows_rounded,
              size: 20, color: cs.onSurfaceVariant),
        ),
        pillWidget(s2),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Small algorithm label badge.
// ─────────────────────────────────────────────────────────────────────────────
class _AlgorithmBadge extends StatelessWidget {
  final ComparisonAlgorithm algorithm;
  const _AlgorithmBadge({required this.algorithm});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final (label, bgColor, fgColor) = switch (algorithm) {
      ComparisonAlgorithm.jaroWinkler => (
          'Jaro-Winkler',
          cs.tertiaryContainer,
          cs.onTertiaryContainer,
        ),
      ComparisonAlgorithm.damerauLevenshtein => (
          'Damerau-Levenshtein',
          cs.secondaryContainer,
          cs.onSecondaryContainer,
        ),
      ComparisonAlgorithm.levenshtein => (
          'Levenshtein',
          cs.primaryContainer,
          cs.onPrimaryContainer,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: fgColor,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Generic small label tag.
// ─────────────────────────────────────────────────────────────────────────────
class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}
