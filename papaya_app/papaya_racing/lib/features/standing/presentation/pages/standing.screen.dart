import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papaya_racing/features/standing/presentation/cubit/standings_cubit.dart';
import 'package:papaya_racing/features/standing/presentation/cubit/standings_state.dart';
import 'package:papaya_racing/features/standing/presentation/widgets/season_resume_card.widget.dart';
import 'package:papaya_racing/features/standing/presentation/widgets/standing_details.card.dart';
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
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ).copyWith(top: 16),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: F1TeamColors.mclaren.primary.withOpacity(0.5),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final halfWidth = (constraints.maxWidth / 2) - 4;
                    return Stack(
                      children: [
                        AnimatedAlign(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          alignment: state.selectedTab == StandingTab.drivers
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            width: halfWidth,
                            height: 36,
                            decoration: BoxDecoration(
                              color: F1SemanticColors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: _TabButton(
                                icon: Icons.person,
                                label: 'PILOTES',
                                isSelected:
                                    state.selectedTab == StandingTab.drivers,
                                onTap: () {
                                  context.read<StandingsCubit>().selectTab(
                                    StandingTab.drivers,
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: _TabButton(
                                icon: Icons.emoji_events,
                                label: 'CONSTRUCTEURS',
                                isSelected:
                                    state.selectedTab ==
                                    StandingTab.constructors,
                                onTap: () {
                                  context.read<StandingsCubit>().selectTab(
                                    StandingTab.constructors,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              Container(
                color: F1SemanticColors.grey100,
                padding: const EdgeInsets.all(16),
                child: state.selectedTab == StandingTab.drivers
                    ? _buildDriversResumeCard(state)
                    : _buildConstructorsResumeCard(state),
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await context.read<StandingsCubit>().loadStandings(2025);
                  },
                  child: state.selectedTab == StandingTab.drivers
                      ? _DriversTab(state: state)
                      : _ConstructorsTab(state: state),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDriversResumeCard(StandingsLoaded state) {
    final pointsGap = state.driverStandings.length >= 2
        ? state.driverStandings[0].points - state.driverStandings[1].points
        : 0;

    return SeasonResumeCard.forDrivers(
      season: state.season,
      round: state.round,
      leader:
          '${state.driverStandings.first.driver.givenName} ${state.driverStandings.first.driver.familyName}',
      pointsGap: pointsGap,
      leaderPoints: state.driverStandings.first.points,
      totalDrivers: state.driverStandings.length,
    );
  }

  Widget _buildConstructorsResumeCard(StandingsLoaded state) {
    final pointsGap = state.constructorStandings.length >= 2
        ? state.constructorStandings[0].points -
              state.constructorStandings[1].points
        : 0;

    return SeasonResumeCard.forConstructors(
      season: state.season,
      round: state.round,
      leader: state.constructorStandings.first.constructor.name,
      leaderPoints: state.constructorStandings.first.points,
      pointsGap: pointsGap,
      totalConstructors: state.constructorStandings.length,
    );
  }
}

class _TabButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: 36,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            Icon(icon, color: isSelected ? Colors.orange : Colors.white),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DriversTab extends StatelessWidget {
  final StandingsLoaded state;

  const _DriversTab({required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.driverStandings.length,
      itemBuilder: (context, index) {
        final standing = state.driverStandings[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: StandingListTile.forDriver(
            driverName: standing.driver.familyName,
            teamName: standing.constructors.first.name,
            country: _getCountryName(standing.driver.nationality),
            standingRanking: standing.position,
            colorAccent: _getTeamColor(
              standing.constructors.first.constructorId,
            ),
            points: standing.points,
            racesWon: standing.wins,
          ),
        );
      },
    );
  }

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
      default:
        return F1TeamColors.haas;
    }
  }

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
      case 'french':
        return 'France';
      case 'german':
        return 'Allemagne';
      case 'italian':
        return 'Italie';
      case 'brazilian':
        return 'Brésil';
      default:
        return nationality;
    }
  }
}

class _ConstructorsTab extends StatelessWidget {
  final StandingsLoaded state;

  const _ConstructorsTab({required this.state});

  @override
  Widget build(BuildContext context) {
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
        case 'french':
          return 'France';
        case 'german':
          return 'Allemagne';
        case 'italian':
          return 'Italie';
        case 'brazilian':
          return 'Brésil';
        default:
          return nationality;
      }
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.constructorStandings.length,
      itemBuilder: (context, index) {
        final standing = state.constructorStandings[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: StandingListTile.forConstructor(
            standingRanking: standing.position,
            teamName: standing.constructor.name,
            country: _getCountryName(standing.constructor.nationality),
            points: standing.points,
            racesWon: standing.wins,
            colorAccent: _getTeamColor(standing.constructor.constructorId),
          ),
        );
      },
    );
  }

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
      default:
        return F1TeamColors.haas;
    }
  }
}
