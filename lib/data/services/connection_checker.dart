import 'package:dartz/dartz.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import '../../common/errors/failures.dart';

class ConnectionChecker {
  ConnectionChecker() : _dataConnectionChecker = DataConnectionChecker();

  final DataConnectionChecker _dataConnectionChecker;

  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;

  Future<Either<Failure, R>> handleNetworkJob<R>(
    Future<Either<Failure, R>> Function() executeJob,
  ) async {
    if (await isConnected) {
      return executeJob();
    } else {
      return const Left(ConnectionFailure('Please connect to the internet'));
    }
  }
}
