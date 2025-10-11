import 'package:dio/dio.dart';
import 'package:papaya_racing/core/errors/exceptions.dart';
import 'package:papaya_racing/features/standing/data/models/constructor_standings_table.model.dart';
import 'package:papaya_racing/features/standing/data/models/driver_standings_table.model.dart';

abstract class StandingsRemoteDataSource {
  Future<DriverStandingsTableModel> getDriverStandings(int season);
  Future<ConstructorStandingsTableModel> getConstructorStandings(int season);
}

class StandingsRemoteDataSourceImpl implements StandingsRemoteDataSource {
  final Dio dio;

  StandingsRemoteDataSourceImpl({required this.dio});

  @override
  Future<ConstructorStandingsTableModel> getConstructorStandings(
    int season,
  ) async {
    try {
      final response = await dio.get(
        'https://api.jolpi.ca/ergast/f1/$season/constructorStandings.json',
      );

      if (response.statusCode == 200) {
        final standingsTable = response.data['MRData']['StandingsTable'];
        final standingsLists = standingsTable['StandingsLists'] as List;

        if (standingsLists.isEmpty) {
          throw ServerException();
        }

        return ConstructorStandingsTableModel.fromJson(standingsLists[0]);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<DriverStandingsTableModel> getDriverStandings(int season) async {
    try {
      final response = await dio.get(
        'https://api.jolpi.ca/ergast/f1/$season/driverStandings.json',
      );

      if (response.statusCode == 200) {
        final standingsTable = response.data['MRData']['StandingsTable'];
        final standingsLists = standingsTable['StandingsLists'] as List;

        if (standingsLists.isEmpty) {
          throw ServerException();
        }

        // On parse directement la table complète
        return DriverStandingsTableModel.fromJson(standingsLists[0]);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}
