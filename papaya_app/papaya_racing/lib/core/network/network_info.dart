import 'package:connectivity_plus/connectivity_plus.dart';

/// Interface abstraite pour vérifier la connexion réseau
/// Cette abstraction permet de :
/// - Mocker facilement dans les tests
/// - Changer d'implémentation sans impact sur le code
abstract class NetworkInfo {
  /// Retourne true si l'appareil est connecté à Internet
  Future<bool> get isConnected;
}

/// Implémentation concrète qui utilise connectivity_plus
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();

    // Vérifie si connecté à WiFi, Mobile, ou Ethernet
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }
}
