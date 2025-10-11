// ==========================================
// lib/injection_container.dart
// ==========================================
// Configuration de l'injection de dépendances avec GetIt

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Core
import 'core/network/network_info.dart';

// Features - Standings
import 'features/standing/data/datasources/standings_local_datasource.dart';
import 'features/standing/data/datasources/standings_remote_datasource.dart';
import 'features/standing/data/repositories/standings_repository_impl.dart';
import 'features/standing/domain/repositories/standings_repository.dart';
import 'features/standing/domain/usecases/get_constructor_standings.dart';
import 'features/standing/domain/usecases/get_driver_standings.dart';
import 'features/standing/presentation/cubit/standings_cubit.dart';

/// Instance globale de GetIt
/// sl = Service Locator
final sl = GetIt.instance;

/// Initialise toutes les dépendances de l'application
/// IMPORTANT : Cette fonction est asynchrone à cause de SharedPreferences
Future<void> init() async {
  //! ========================================
  //! Features - Standings
  //! ========================================

  // Cubit (Factory = nouvelle instance à chaque fois)
  sl.registerFactory(
    () =>
        StandingsCubit(getDriverStandings: sl(), getConstructorStandings: sl()),
  );

  // Use cases (LazySingleton = créé une seule fois à la première utilisation)
  sl.registerLazySingleton(() => GetDriverStandings(sl()));
  sl.registerLazySingleton(() => GetConstructorStandings(sl()));

  // Repository (LazySingleton)
  sl.registerLazySingleton<StandingsRepository>(
    () => StandingsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources (LazySingleton)
  sl.registerLazySingleton<StandingsRemoteDataSource>(
    () => StandingsRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<StandingsLocalDataSource>(
    () => StandingsLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! ========================================
  //! Core
  //! ========================================

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! ========================================
  //! External (Packages tiers)
  //! ========================================

  // SharedPreferences - ASYNC OBLIGATOIRE !
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Dio (HTTP client)
  sl.registerLazySingleton(() => Dio());

  // Connectivity (vérification réseau)
  sl.registerLazySingleton(() => Connectivity());
}

//! ========================================
//! NOTES IMPORTANTES
//! ========================================

/*
 * DIFFÉRENCE ENTRE LES TYPES D'ENREGISTREMENT :
 *
 * 1. registerFactory() :
 *    - Crée une NOUVELLE instance à chaque appel
 *    - Utilisé pour : Cubits, Blocs
 *    - Exemple : Chaque page a son propre Cubit
 *
 * 2. registerLazySingleton() :
 *    - Crée UNE SEULE instance (la première fois)
 *    - Réutilise toujours la même instance
 *    - Utilisé pour : Repositories, UseCases, DataSources
 *    - Exemple : Un seul StandingsRepository pour toute l'app
 *
 * 3. registerSingleton() :
 *    - Crée l'instance IMMÉDIATEMENT (pas lazy)
 *    - Utilisé rarement (préférer LazySingleton)
 */

/*
 * ORDRE D'ENREGISTREMENT :
 *
 * 1. Features (du haut vers le bas) :
 *    - Cubit (dépend de UseCases)
 *    - UseCases (dépendent de Repository)
 *    - Repository (dépend de DataSources et NetworkInfo)
 *    - DataSources (dépendent de packages externes)
 *
 * 2. Core :
 *    - NetworkInfo, etc.
 *
 * 3. External :
 *    - SharedPreferences, Dio, Connectivity
 */

/*
 * UTILISATION DANS LE CODE :
 *
 * // Obtenir une instance
 * final cubit = sl<StandingsCubit>();
 *
 * // Dans BlocProvider
 * BlocProvider(
 *   create: (_) => sl<StandingsCubit>()..loadStandings(2025),
 *   child: ...
 * )
 */
