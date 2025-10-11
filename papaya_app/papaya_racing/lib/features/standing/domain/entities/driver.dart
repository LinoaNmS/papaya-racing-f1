import 'package:equatable/equatable.dart';

class Driver extends Equatable {
  final String driverId;
  final String permanentNumber;
  final String code;
  final String givenName;
  final String familyName;
  final String dateOfBirth;
  final String url;
  final String nationality;

  const Driver({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.url,
    required this.nationality,
  });

  @override
  List<Object?> get props => [
    driverId,
    permanentNumber,
    code,
    givenName,
    familyName,
    dateOfBirth,
    url,
    nationality,
  ];
}
