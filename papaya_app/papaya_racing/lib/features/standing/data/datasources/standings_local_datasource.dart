import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/constructor_standings_table.model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/driver_standings_table.model.dart';

abstract class StandingsLocalDataSource {
  /// Cache la table complète des standings pilotes
  Future<void> cacheDriverStandingsTable(DriverStandingsTableModel table);

  /// Récupère la table des standings pilotes depuis le cache
  Future<DriverStandingsTableModel> getCachedDriverStandingsTable();

  /// Cache la table complète des standings constructeurs
  Future<void> cacheConstructorStandingsTable(
    ConstructorStandingsTableModel table,
  );

  /// Récupère la table des standings constructeurs depuis le cache
  Future<ConstructorStandingsTableModel> getCachedConstructorStandingsTable();
}

const String CACHED_DRIVER_STANDINGS_TABLE = 'CACHED_DRIVER_STANDINGS_TABLE';
const String CACHED_CONSTRUCTOR_STANDINGS_TABLE =
    'CACHED_CONSTRUCTOR_STANDINGS_TABLE';

class StandingsLocalDataSourceImpl implements StandingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  StandingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheDriverStandingsTable(
    DriverStandingsTableModel table,
  ) async {
    final jsonString = json.encode(table.toJson());
    await sharedPreferences.setString(
      CACHED_DRIVER_STANDINGS_TABLE,
      jsonString,
    );
  }

  @override
  Future<DriverStandingsTableModel> getCachedDriverStandingsTable() {
    final jsonString = sharedPreferences.getString(
      CACHED_DRIVER_STANDINGS_TABLE,
    );

    if (jsonString != null) {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return Future.value(DriverStandingsTableModel.fromJson(jsonMap));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheConstructorStandingsTable(
    ConstructorStandingsTableModel table,
  ) async {
    final jsonString = json.encode(table.toJson());
    await sharedPreferences.setString(
      CACHED_CONSTRUCTOR_STANDINGS_TABLE,
      jsonString,
    );
  }

  @override
  Future<ConstructorStandingsTableModel> getCachedConstructorStandingsTable() {
    final jsonString = sharedPreferences.getString(
      CACHED_CONSTRUCTOR_STANDINGS_TABLE,
    );

    if (jsonString != null) {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return Future.value(ConstructorStandingsTableModel.fromJson(jsonMap));
    } else {
      throw CacheException();
    }
  }
}
