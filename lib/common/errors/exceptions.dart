// + Datasource-level errors

class HttpException implements Exception {
  final String? message;

  const HttpException(this.message);

  @override
  String toString() => 'Http Exception: ${message ?? 'Error unknown'}';
}
