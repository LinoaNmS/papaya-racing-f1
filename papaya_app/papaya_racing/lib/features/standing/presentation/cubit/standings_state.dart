import 'package:equatable/equatable.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor_standing.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver_standing.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver_standings_table.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor_standings_table.dart';

enum StandingTab { drivers, constructors }

abstract class StandingsState extends Equatable {
  const StandingsState();

  @override
  List<Object?> get props => [];
}

class StandingsLoading extends StandingsState {}

class StandingsLoaded extends StandingsState {
  final DriverStandingsTable driverStandingsTable;
  final ConstructorStandingsTable constructorStandingsTable;
  final int currentSeason;
  final StandingTab selectedTab;

  const StandingsLoaded({
    required this.driverStandingsTable,
    required this.constructorStandingsTable,
    required this.currentSeason,
    this.selectedTab = StandingTab.drivers,
  });

  List<DriverStanding> get driverStandings => driverStandingsTable.standings;
  List<ConstructorStanding> get constructorStandings =>
      constructorStandingsTable.standings;
  String get season => driverStandingsTable.season;
  String get round => driverStandingsTable.round;
  int get pointsGap => driverStandings.first.points - driverStandings[1].points;

  StandingsLoaded copyWith({StandingTab? selectedTab}) {
    return StandingsLoaded(
      driverStandingsTable: driverStandingsTable,
      constructorStandingsTable: constructorStandingsTable,
      currentSeason: currentSeason,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [
    driverStandingsTable,
    constructorStandingsTable,
    currentSeason,
    selectedTab,
  ];
}

class StandingsError extends StandingsState {
  final String message;

  const StandingsError({required this.message});

  @override
  List<Object?> get props => [message];
}
