import 'package:equatable/equatable.dart';

/// + Repository-level failure containing [message]

abstract class Failure extends Equatable {
  final String message;

  const Failure([this.message = "Unexpected Error"]);

  @override
  List<Object> get props => [message];
}

// + Repository-level failures

class NetworkFailure extends Failure {
  static const defaultMessage = 'Network Failure';
  const NetworkFailure([String message = defaultMessage]) : super(message);
}

class ConnectionFailure extends Failure {
  static const defaultMessage = 'Connection Failure';
  const ConnectionFailure([String message = defaultMessage]) : super(message);
}

class CacheFailure extends Failure {
  static const defaultMessage = 'Cache Failure';
  const CacheFailure([String message = defaultMessage]) : super(message);
}
