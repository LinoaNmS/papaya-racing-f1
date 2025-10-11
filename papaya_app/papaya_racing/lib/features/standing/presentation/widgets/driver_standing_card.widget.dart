import 'package:country_flags/country_flags.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:papaya_racing/features/standing/presentation/widgets/ranking_standing_badge.widget.dart';

class DriverStandingCard extends StatelessWidget {
  final String driverName;
  final String teamName;
  final String driverCountry;
  final int standingRanking;
  final F1TeamColors colorAccent;
  final int points;
  final int racesWon;

  const DriverStandingCard({
    super.key,
    required this.driverName,
    required this.teamName,
    required this.driverCountry,
    required this.standingRanking,
    required this.colorAccent,
    required this.points,
    required this.racesWon,
  });

  @override
  Widget build(BuildContext context) {
    return PRCard.withAccent(
      accentColor: colorAccent,
      body: [
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                RankingStandingBadge(
                  ranking: standingRanking,
                  backgroundColor: colorAccent.secondary,
                  textColor: colorAccent.onPrimary,
                ),
                _DriverDetail(
                  driverName: driverName,
                  teamName: teamName,
                  driverCountry: driverCountry,
                ),
              ],
            ),
            _DriverResults(points: points, racesWon: racesWon),
          ],
        ),
      ],
    );
  }
}

class _DriverDetail extends StatelessWidget {
  final String driverName;
  final String teamName;
  final String driverCountry;
  const _DriverDetail({
    required this.driverName,
    required this.teamName,
    required this.driverCountry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(driverName, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(
          teamName,
          style: TextStyle(fontSize: 12, color: F1SemanticColors.grey600),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            _getFlagEmoji(driverCountry),
            Text(
              driverCountry,
              style: TextStyle(fontSize: 12, color: F1SemanticColors.grey400),
            ),
          ],
        ),
      ],
    );
  }

  _getFlagEmoji(String country) {
    switch (country.toLowerCase()) {
      case "australie":
        return CountryFlag.fromCountryCode(
          "AU",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "pays-bas":
        return CountryFlag.fromCountryCode(
          "NL",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "monaco":
        return CountryFlag.fromCountryCode(
          "MC",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "espagne":
        return CountryFlag.fromCountryCode(
          "ES",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "canada":
        return CountryFlag.fromCountryCode(
          "CA",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case 'allemagne':
        return CountryFlag.fromCountryCode(
          "DE",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case 'brésil':
        return CountryFlag.fromCountryCode(
          "BR",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "italie":
        return CountryFlag.fromCountryCode(
          "IT",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );

      case "france":
        return CountryFlag.fromCountryCode(
          "FR",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "japon":
        return CountryFlag.fromCountryCode(
          "JP",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "thaïlande":
        return CountryFlag.fromCountryCode(
          "TH",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "argentine":
        return CountryFlag.fromCountryCode(
          "AR",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case 'nouvelle-zélande':
        return CountryFlag.fromCountryCode(
          "NZ",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
      case "royaume-uni":
      default:
        return CountryFlag.fromCountryCode(
          "GB",
          theme: const ImageTheme(
            shape: RoundedRectangle(4),
            width: 18,
            height: 14,
          ),
        );
    }
  }
}

class _DriverResults extends StatelessWidget {
  final int points;
  final int racesWon;
  const _DriverResults({required this.points, required this.racesWon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(points.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
        if (racesWon > 0) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                racesWon.toString(),
                style: TextStyle(fontSize: 12, color: F1SemanticColors.grey400),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
