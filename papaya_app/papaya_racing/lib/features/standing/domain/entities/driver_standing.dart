import 'package:equatable/equatable.dart';
import 'package:papaya_racing/features/standing/domain/entities/constructor.dart';
import 'package:papaya_racing/features/standing/domain/entities/driver.dart';

class DriverStanding extends Equatable {
  final int position;
  final String positionText;
  final int points;
  final int wins;
  final Driver driver;
  final List<Constructor> constructors;

  const DriverStanding({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.driver,
    required this.constructors,
  });

  bool isOnPodium() => position <= 3;

  @override
  List<Object?> get props => [
    position,
    positionText,
    points,
    wins,
    driver,
    constructors,
  ];
}
