import 'package:dartz/dartz.dart';
import 'package:papaya_racing/core/errors/failures.dart';
import 'package:papaya_racing/core/usecase/usecase.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor_standings_table.dart';
import 'package:papaya_racing/features/standing/domain/repositories/standings_repository.dart';
import 'get_driver_standings.dart';

class GetConstructorStandings
    implements UseCase<ConstructorStandingsTable, StandingsParams> {
  final StandingsRepository repository;

  GetConstructorStandings(this.repository);

  @override
  Future<Either<Failure, ConstructorStandingsTable>> call(
    StandingsParams params,
  ) {
    return repository.getConstructorStandings(season: params.season);
  }
}
