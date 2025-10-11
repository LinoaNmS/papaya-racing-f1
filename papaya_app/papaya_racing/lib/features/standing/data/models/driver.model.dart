import 'package:papaya_racing/features/standing/domain/entities/driver.dart';

class DriverModel extends Driver {
  const DriverModel({
    required super.driverId,
    required super.permanentNumber,
    required super.code,
    required super.url,
    required super.givenName,
    required super.familyName,
    required super.dateOfBirth,
    required super.nationality,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      driverId: json['driverId'] as String,
      permanentNumber: json['permanentNumber'] as String? ?? '',
      code: json['code'] as String? ?? '',
      url: json['url'] as String,
      givenName: json['givenName'] as String,
      familyName: json['familyName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      nationality: json['nationality'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'permanentNumber': permanentNumber,
      'code': code,
      'url': url,
      'givenName': givenName,
      'familyName': familyName,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
    };
  }
}
