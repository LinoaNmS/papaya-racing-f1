import 'package:equatable/equatable.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor.dart';

class ConstructorStanding extends Equatable {
  final int position;
  final String positionText;
  final int points;
  final int wins;
  final Constructor constructor;

  const ConstructorStanding({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.constructor,
  });

  @override
  List<Object?> get props => [
    position,
    positionText,
    points,
    wins,
    constructor,
  ];
}
