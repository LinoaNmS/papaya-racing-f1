import '../../domain/entities/constructor.dart';

class ConstructorModel extends Constructor {
  const ConstructorModel({
    required super.constructorId,
    required super.url,
    required super.name,
    required super.nationality,
  });

  factory ConstructorModel.fromJson(Map<String, dynamic> json) {
    return ConstructorModel(
      constructorId: json['constructorId'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      nationality: json['nationality'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'constructorId': constructorId,
      'url': url,
      'name': name,
      'nationality': nationality,
    };
  }
}
