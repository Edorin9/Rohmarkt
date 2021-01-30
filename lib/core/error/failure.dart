import 'package:equatable/equatable.dart';

/// Repository-level error containing [errorMessage]

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure([this.errorMessage = 'Unexpected Error']);

  @override
  List<Object> get props => [errorMessage];
}
