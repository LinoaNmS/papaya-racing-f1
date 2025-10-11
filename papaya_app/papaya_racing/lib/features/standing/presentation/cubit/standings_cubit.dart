import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papaya_racing/features/standing/domain/usecases/get_driver_standings.dart';
import 'package:papaya_racing/features/standing/domain/usecases/get_constructor_standings.dart';
import 'standings_state.dart';

class StandingsCubit extends Cubit<StandingsState> {
  final GetDriverStandings getDriverStandings;
  final GetConstructorStandings getConstructorStandings;

  StandingsCubit({
    required this.getDriverStandings,
    required this.getConstructorStandings,
  }) : super(StandingsLoading());

  Future<void> loadStandings(int season) async {
    final driverResult = await getDriverStandings(
      StandingsParams(season: season),
    );

    final constructorResult = await getConstructorStandings(
      StandingsParams(season: season),
    );

    driverResult.fold(
      (failure) => emit(StandingsError(message: _mapFailureToMessage(failure))),
      (driverStandingsTable) {
        constructorResult.fold(
          (failure) =>
              emit(StandingsError(message: _mapFailureToMessage(failure))),
          (constructorStandingsTable) => emit(
            StandingsLoaded(
              driverStandingsTable: driverStandingsTable,
              constructorStandingsTable: constructorStandingsTable,
              currentSeason: season,
            ),
          ),
        );
      },
    );
  }

  void selectTab(StandingTab tab) {
    final currentState = state;
    if (currentState is StandingsLoaded) {
      emit(currentState.copyWith(selectedTab: tab));
    }
  }

  String _mapFailureToMessage(failure) {
    return 'Erreur lors du chargement des classements';
  }
}
