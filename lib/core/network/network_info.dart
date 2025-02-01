// lib/core/network/network_info.dart
import 'package:connectivity_plus/connectivity_plus.dart';

import '../error/exceptions.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    try {
      final result = await connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      throw const CacheException("Network status check failed");
    }
  }
}