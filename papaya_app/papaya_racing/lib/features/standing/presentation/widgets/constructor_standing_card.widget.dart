import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ConstructorStandingCard extends StatelessWidget {
  final int position;
  final String constructorName;
  final String nationality;
  final int points;
  final int wins;
  final F1TeamColors teamColor;
  const ConstructorStandingCard({
    super.key,
    required this.position,
    required this.constructorName,
    required this.nationality,
    required this.points,
    required this.wins,
    required this.teamColor,
  });

  @override
  Widget build(BuildContext context) {
    return PRCard(
      body: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: _getPositionColor(position),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  position.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    constructorName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.flag, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        nationality,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  points.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: teamColor.primary,
                  ),
                ),
                const Text(
                  'points',
                  style: TextStyle(
                    fontSize: 12,
                    color: F1SemanticColors.grey500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Color _getPositionColor(int position) {
    switch (position) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey[600]!;
      case 3:
        return Colors.brown[400]!;
      default:
        return teamColor.primary;
    }
  }
}
