import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

/// + Repository-level errors containing a [message]

@freezed
class Failure with _$Failure {
  const factory Failure([
    @Default('Unexpected Error') String message,
  ]) = _Failure;

  const factory Failure.network([
    @Default('Network Error') String message,
  ]) = NetworkFailure;

  const factory Failure.connection([
    @Default('Connection Error') String message,
  ]) = ConnectionFailure;
}
