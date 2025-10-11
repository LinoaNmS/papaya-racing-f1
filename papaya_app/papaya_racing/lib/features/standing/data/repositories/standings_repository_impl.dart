import 'package:dartz/dartz.dart';
import 'package:papaya_racing/core/errors/exceptions.dart';
import 'package:papaya_racing/core/errors/failures.dart';
import 'package:papaya_racing/core/network/network_info.dart';
import 'package:papaya_racing/features/standing/data/datasources/standings_local_datasource.dart';
import 'package:papaya_racing/features/standing/data/datasources/standings_remote_datasource.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor_standings_table.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver_standings_table.dart';
import 'package:papaya_racing/features/standing/domain/repositories/standings_repository.dart';

class StandingsRepositoryImpl implements StandingsRepository {
  final StandingsRemoteDataSource remoteDataSource;
  final StandingsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  StandingsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DriverStandingsTable>> getDriverStandings({
    required int season,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final standingsTable = await remoteDataSource.getDriverStandings(
          season,
        );
        await localDataSource.cacheDriverStandingsTable(standingsTable);
        return Right(standingsTable);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final standingsTable = await localDataSource
            .getCachedDriverStandingsTable();
        return Right(standingsTable);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, ConstructorStandingsTable>> getConstructorStandings({
    required int season,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final standingsTable = await remoteDataSource.getConstructorStandings(
          season,
        );
        await localDataSource.cacheConstructorStandingsTable(standingsTable);
        return Right(standingsTable);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final standingsTable = await localDataSource
            .getCachedConstructorStandingsTable();
        return Right(standingsTable);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
