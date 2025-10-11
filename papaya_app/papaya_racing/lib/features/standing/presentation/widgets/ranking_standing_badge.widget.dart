import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RankingStandingBadge extends StatelessWidget {
  final int ranking;
  final Color backgroundColor;
  final Color textColor;

  const RankingStandingBadge({
    super.key,
    required this.ranking,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return PRBadge(
      body: Text(
        ranking.toString(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
