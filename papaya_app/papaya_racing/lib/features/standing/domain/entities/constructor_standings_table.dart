import 'package:equatable/equatable.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor_standing.dart';

class ConstructorStandingsTable extends Equatable {
  final String season;
  final String round;
  final List<ConstructorStanding> standings;

  const ConstructorStandingsTable({
    required this.season,
    required this.round,
    required this.standings,
  });

  @override
  List<Object?> get props => [season, round, standings];
}
