import 'package:equatable/equatable.dart';

class Constructor extends Equatable {
  final String constructorId;
  final String name;
  final String nationality;
  final String url;

  const Constructor({
    required this.constructorId,
    required this.name,
    required this.nationality,
    required this.url,
  });

  @override
  List<Object?> get props => [constructorId, name, nationality, url];
}
