import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstract interface for checking network connectivity
abstract class ConnectivityChecker {
  /// Returns true if the device has an active network connection
  Future<bool> isConnected();

  /// Stream of connectivity changes
  Stream<bool> get onConnectivityChanged;
}

/// Implementation using connectivity_plus package
class ConnectivityCheckerImpl implements ConnectivityChecker {
  final Connectivity _connectivity;

  ConnectivityCheckerImpl({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity();

  @override
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return _isConnected(result);
  }

  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map(_isConnected);
  }

  bool _isConnected(dynamic result) {
    // Handle both List and single result for compatibility
    if (result is List<ConnectivityResult>) {
      return result.isNotEmpty &&
          !result.every((r) => r == ConnectivityResult.none);
    }
    return result != ConnectivityResult.none;
  }
}
