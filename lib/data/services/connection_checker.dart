import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:either_option/either_option.dart';

import '../../common/errors/failures.dart';

class ConnectionChecker {
  ConnectionChecker() : _connectivity = Connectivity();

  final Connectivity _connectivity;

  Future<bool> get isConnected => _connectivity.checkConnection();

  Future<Either<Failure, R>> handleNetworkJob<R>(
    Future<Either<Failure, R>> Function() executeJob,
  ) async {
    if (await isConnected) {
      return executeJob();
    } else {
      const failure = Failure.connection('Please connect to the internet');
      return Left(failure);
    }
  }
}
