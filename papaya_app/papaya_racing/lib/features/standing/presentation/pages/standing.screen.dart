import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papaya_racing/features/standing/presentation/cubit/standings_cubit.dart';
import 'package:papaya_racing/features/standing/presentation/cubit/standings_state.dart';
import 'package:papaya_racing/features/standing/presentation/widgets/driver_standing_card.widget.dart';
import 'package:papaya_racing/features/standing/presentation/widgets/season_resume_card.widget.dart';
import 'package:papaya_racing/injection_container.dart' as di;

class StandingScreen extends StatelessWidget {
  const StandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<StandingsCubit>()..loadStandings(2025),
      child: const StandingScreenContent(),
    );
  }
}

class StandingScreenContent extends StatelessWidget {
  const StandingScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingsCubit, StandingsState>(
      builder: (context, state) {
        if (state is StandingsLoading) {
          // État de chargement
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Chargement des classements...'),
              ],
            ),
          );
        } else if (state is StandingsError) {
          // État d'erreur
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<StandingsCubit>().loadStandings(2025);
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Réessayer'),
                  ),
                ],
              ),
            ),
          );
        } else if (state is StandingsLoaded) {
          // État chargé avec données
          return RefreshIndicator(
            onRefresh: () async {
              // Pull to refresh
              await context.read<StandingsCubit>().loadStandings(2025);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SeasonResumeCard(
                    season: state.season,
                    round: state.round,
                    leader:
                        '${state.driverStandings.first.driver.givenName} ${state.driverStandings.first.driver.familyName}',
                    pointsGap: state.pointsGap,
                  ),
                  _DriversList(state: state),
                ],
              ),
            ),
          );
        }
        return const Center(child: Text('Bienvenue ! 🏎️'));
      },
    );
  }
}

class _DriversList extends StatelessWidget {
  final StandingsLoaded state;

  const _DriversList({required this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ...state.driverStandings.map((standing) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: DriverStandingCard(
                  driverName: standing.driver.familyName,
                  teamName: standing.constructors.first.name,
                  driverCountry: _getCountryName(standing.driver.nationality),
                  standingRanking: standing.position,
                  colorAccent: _getTeamColor(
                    standing.constructors.first.constructorId,
                  ),
                  points: standing.points,
                  racesWon: standing.wins,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Mapper les constructorId vers les couleurs F1
  F1TeamColors _getTeamColor(String constructorId) {
    switch (constructorId.toLowerCase()) {
      case 'mclaren':
        return F1TeamColors.mclaren;
      case 'red_bull':
        return F1TeamColors.redBull;
      case 'ferrari':
        return F1TeamColors.ferrari;
      case 'mercedes':
        return F1TeamColors.mercedes;
      case 'aston_martin':
        return F1TeamColors.astonMartin;
      case 'alpine':
        return F1TeamColors.alpine;
      case 'williams':
        return F1TeamColors.williams;
      case 'rb':
        return F1TeamColors.rb;
      case 'sauber':
        return F1TeamColors.sauber;
      case 'haas':
      default:
        return F1TeamColors.haas;
    }
  }

  /// Mapper les nationalités vers les noms de pays en français
  String _getCountryName(String nationality) {
    switch (nationality.toLowerCase()) {
      case 'australian':
        return 'Australie';
      case 'british':
        return 'Royaume-Uni';
      case 'dutch':
        return 'Pays-Bas';
      case 'monegasque':
        return 'Monaco';
      case 'spanish':
        return 'Espagne';
      case 'mexican':
        return 'Mexique';
      case 'thai':
        return 'Thaïlande';
      case 'french':
        return 'France';
      case 'german':
        return 'Allemagne';
      case 'finnish':
        return 'Finlande';
      case 'danish':
        return 'Danemark';
      case 'canadian':
        return 'Canada';
      case 'japanese':
        return 'Japon';
      case 'chinese':
        return 'Chine';
      case 'new zealander':
        return 'Nouvelle-Zélande';
      case 'italian':
        return 'Italie';
      case 'brazilian':
        return 'Brésil';
      case 'argentine':
        return 'Argentine';
      default:
        return nationality; // Fallback
    }
  }
}
