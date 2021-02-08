// Datasource-level failures

class NetworkException implements Exception {
  final String message;

  const NetworkException([this.message]);

  @override
  String toString() => 'Network Exception: ${message ?? 'Error unknown'}';
}

class CacheException implements Exception {
  final String message;

  const CacheException([this.message]);

  @override
  String toString() => 'Cache Exception: ${message ?? 'Error unknown'}';
}
