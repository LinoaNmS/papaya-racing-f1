import 'package:papaya_racing/features/standing/data/models/driver_standing.model.dart';

import '../../domain/entities/driver_standings_table.dart';

class DriverStandingsTableModel extends DriverStandingsTable {
  const DriverStandingsTableModel({
    required super.season,
    required super.round,
    required super.standings,
  });

  factory DriverStandingsTableModel.fromJson(Map<String, dynamic> json) {
    return DriverStandingsTableModel(
      season: json['season'] as String,
      round: json['round'] as String,
      standings: (json['DriverStandings'] as List)
          .map((e) => DriverStandingModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'season': season,
      'round': round,
      'DriverStandings': standings
          .map((e) => (e as DriverStandingModel).toJson())
          .toList(),
    };
  }
}
