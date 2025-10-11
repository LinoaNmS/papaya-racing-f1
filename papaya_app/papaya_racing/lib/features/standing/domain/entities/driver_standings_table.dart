import 'package:equatable/equatable.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver_standing.dart';

class DriverStandingsTable extends Equatable {
  final String season;
  final String round;
  final List<DriverStanding> standings;

  const DriverStandingsTable({
    required this.season,
    required this.round,
    required this.standings,
  });

  @override
  List<Object?> get props => [season, round, standings];
}
