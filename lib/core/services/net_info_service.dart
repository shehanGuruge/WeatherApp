import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetInfoManager {
  Future<bool> get isConnected;
}

class NetInfoManagerImpl implements NetInfoManager {
  final InternetConnectionChecker _internetConnectionChecker;

  NetInfoManagerImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
