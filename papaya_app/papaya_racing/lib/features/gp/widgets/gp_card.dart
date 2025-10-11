import 'package:flutter/material.dart';

class GpCard extends StatelessWidget {
  final String gpName;
  final String country;
  final String circuitName;
  final String date;
  final VoidCallback? onTap;

  const GpCard({
    super.key,
    required this.gpName,
    required this.country,
    required this.circuitName,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gpName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(country),
              ],
            ),
            const SizedBox(height: 4),
            Text(circuitName, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(date),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
