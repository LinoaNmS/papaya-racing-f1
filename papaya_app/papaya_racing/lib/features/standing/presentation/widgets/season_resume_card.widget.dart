import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SeasonResumeCard extends StatelessWidget {
  final String season;
  final String round;
  final String leader;
  final int pointsGap;

  const SeasonResumeCard({
    super.key,
    required this.season,
    required this.round,
    required this.leader,
    required this.pointsGap,
  });

  @override
  Widget build(BuildContext context) {
    // Calcul dynamique des statistiques
    final int totalRaces = 24;
    final int currentRound = int.parse(round);
    final int remainingRaces = totalRaces - currentRound;

    final List<Map<String, String>> seasonStatsDetails = [
      {"value": "$currentRound/$totalRaces", "label": "Courses"},
      {"value": pointsGap.toString(), "label": "Écart P1-P2"},
      {"value": remainingRaces.toString(), "label": "Restantes"},
    ];

    return PRCard(
      body: [
        Text(
          "Saison $season".toUpperCase(),
          style: TextStyle(
            color: F1TeamColors.mclaren.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            const Icon(Icons.emoji_events, color: Colors.amber, size: 18),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                'Leader : $leader',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Statistiques
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: seasonStatsDetails
              .map(
                (stat) => _SeasonStatsDetails(
                  value: stat["value"]!,
                  label: stat["label"]!,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _SeasonStatsDetails extends StatelessWidget {
  final String value;
  final String label;

  const _SeasonStatsDetails({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(color: F1SemanticColors.grey500, fontSize: 12),
        ),
      ],
    );
  }
}
