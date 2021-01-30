import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

class NetworkInfo {
  final DataConnectionChecker _dataConnectionChecker;

  NetworkInfo({
    @required DataConnectionChecker dcc,
  }) : _dataConnectionChecker = dcc;

  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}
