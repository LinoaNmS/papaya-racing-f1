import 'package:papaya_racing/features/standing/data/models/constructor.model.dart';
import 'package:papaya_racing/features/standing/data/models/driver.model.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver_standing.dart';

class DriverStandingModel extends DriverStanding {
  const DriverStandingModel({
    required super.position,
    required super.positionText,
    required super.points,
    required super.wins,
    required super.driver,
    required super.constructors,
  });

  factory DriverStandingModel.fromJson(Map<String, dynamic> json) {
    return DriverStandingModel(
      position: int.parse(json['position'] as String),
      positionText: json['positionText'] as String,
      points: int.parse(json['points'] as String),
      wins: int.parse(json['wins'] as String),
      driver: DriverModel.fromJson(json['Driver'] as Map<String, dynamic>),
      constructors: (json['Constructors'] as List)
          .map((e) => ConstructorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position.toString(),
      'positionText': positionText,
      'points': points.toString(),
      'wins': wins.toString(),
      'Driver': (driver as DriverModel).toJson(),
      'Constructors': constructors
          .map((e) => (e as ConstructorModel).toJson())
          .toList(),
    };
  }
}
