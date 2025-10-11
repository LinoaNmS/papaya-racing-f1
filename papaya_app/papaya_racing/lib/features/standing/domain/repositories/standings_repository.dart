import 'package:dartz/dartz.dart';
import 'package:papaya_racing/core/errors/failures.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor_standings_table.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver_standings_table.dart';

abstract class StandingsRepository {
  /// Récupère le classement des pilotes pour une saison donnée
  Future<Either<Failure, DriverStandingsTable>> getDriverStandings({
    required int season, // ⬅️ IMPORTANT : paramètre nommé avec "required"
  });

  /// Récupère le classement des constructeurs pour une saison donnée
  Future<Either<Failure, ConstructorStandingsTable>> getConstructorStandings({
    required int season, // ⬅️ IMPORTANT : paramètre nommé avec "required"
  });
}
