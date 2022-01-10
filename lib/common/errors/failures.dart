import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

// + Repository-level errors containing a [message]

@freezed
class Failure with _$Failure {
  const factory Failure([
    @Default('Unexpected Error') String message,
  ]) = _Failure;

  const factory Failure.network([
    @Default('Network Error') String message,
  ]) = NetworkFailure;

  const factory Failure.http([
    @Default('Http Error') String message,
  ]) = HttpFailure;
}
