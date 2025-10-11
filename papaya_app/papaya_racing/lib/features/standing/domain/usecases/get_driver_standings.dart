import 'package:dartz/dartz.dart';
import 'package:papaya_racing/core/errors/failures.dart';
import 'package:papaya_racing/core/usecase/usecase.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver_standings_table.dart';
import 'package:papaya_racing/features/standing/domain/repositories/standings_repository.dart';

class GetDriverStandings
    implements UseCase<DriverStandingsTable, StandingsParams> {
  final StandingsRepository repository;

  GetDriverStandings(this.repository);

  @override
  Future<Either<Failure, DriverStandingsTable>> call(StandingsParams params) {
    return repository.getDriverStandings(season: params.season);
  }
}

class StandingsParams {
  final int season;

  const StandingsParams({required this.season});
}
