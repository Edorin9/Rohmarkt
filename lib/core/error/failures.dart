import 'failure.dart';

class ServerFailure extends Failure {
  static const defaultMessage = 'Server Failure';
  const ServerFailure([String message = defaultMessage]) : super(message);
}

class ConnectionFailure extends Failure {
  static const defaultMessage = 'Connection Failure';
  const ConnectionFailure([String message = defaultMessage]) : super(message);
}

class CacheFailure extends Failure {
  static const defaultMessage = 'Cache Failure';
  const CacheFailure([String message = defaultMessage]) : super(message);
}
