import 'package:papaya_racing/features/standing/data/models/constructor_standing.model.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor_standings_table.dart';

class ConstructorStandingsTableModel extends ConstructorStandingsTable {
  const ConstructorStandingsTableModel({
    required super.season,
    required super.round,
    required super.standings,
  });

  factory ConstructorStandingsTableModel.fromJson(Map<String, dynamic> json) {
    return ConstructorStandingsTableModel(
      season: json['season'] as String,
      round: json['round'] as String,
      standings: (json['ConstructorStandings'] as List)
          .map((e) => ConstructorStandingModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'season': season,
      'round': round,
      'ConstructorStandings': standings
          .map((e) => (e as ConstructorStandingModel).toJson())
          .toList(),
    };
  }
}
