// + Datasource-level errors

class NetworkException implements Exception {
  final String? message;

  const NetworkException(this.message);

  @override
  String toString() => 'Network Exception: ${message ?? 'Error unknown'}';
}
