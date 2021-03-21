import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:either_option/either_option.dart';

import '../../common/errors/failures.dart';

class ConnectionChecker {
  ConnectionChecker() : _connectivity = Connectivity();

  final Connectivity _connectivity;

  Future<bool> get isConnected => _connectivity.checkConnection();

  /// [executeJob] if device is connected to .
  /// Otherwise, return a [ConnectionFailure] for [Left] [Failure].
  ///
  /// (this method is mostly for repository use)
  Future<Either<Failure, R>> handleNetworkJob<R>(
    Future<Either<Failure, R>> Function() executeJob,
  ) async {
    if (await isConnected) {
      return executeJob();
    } else {
      const failure = Failure.connection(
          'No internet access.\nPlease connect to a reliable Wi-Fi network.');
      return Left(failure);
    }
  }
}
