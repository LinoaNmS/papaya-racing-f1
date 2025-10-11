import '../../domain/entities/constructor_standing.dart';
import 'constructor.model.dart';

class ConstructorStandingModel extends ConstructorStanding {
  const ConstructorStandingModel({
    required super.position,
    required super.positionText,
    required super.points,
    required super.wins,
    required super.constructor,
  });

  factory ConstructorStandingModel.fromJson(Map<String, dynamic> json) {
    return ConstructorStandingModel(
      position: int.parse(json['position'] as String),
      positionText: json['positionText'] as String,
      points: int.parse(json['points'] as String),
      wins: int.parse(json['wins'] as String),
      constructor: ConstructorModel.fromJson(
        json['Constructor'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position.toString(),
      'positionText': positionText,
      'points': points.toString(),
      'wins': wins.toString(),
      'Constructor': (constructor as ConstructorModel).toJson(),
    };
  }
}
