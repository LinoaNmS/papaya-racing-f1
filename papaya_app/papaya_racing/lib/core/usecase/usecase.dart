import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Classe de base pour tous les use cases
///
/// [Type] = Le type de retour en cas de succès
/// [Params] = Le type des paramètres d'entrée
///
/// Exemple :
/// - UseCase<List<Driver>, NoParams>
/// - UseCase<DriverStandingsTable, StandingsParams>
abstract class UseCase<Type, Params> {
  /// Méthode à implémenter dans chaque use case
  /// Retourne Either<Failure, Type>
  /// - Left(Failure) en cas d'erreur
  /// - Right(Type) en cas de succès
  Future<Either<Failure, Type>> call(Params params);
}

/// Classe utilisée quand un use case n'a pas besoin de paramètres
class NoParams {
  const NoParams();
}
