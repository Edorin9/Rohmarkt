// + Datasource-level errors

class HttpException implements Exception {
  final int? code;
  final String? message;

  const HttpException(this.code, this.message);

  @override
  String toString() =>
      'Http Exception: $code - ${message ?? 'Error unknown'}';
}
