// Datasource-level failures

class ServerException implements Exception {
  final String message;

  const ServerException([this.message]);

  @override
  String toString() => 'Server Exception: ${message ?? 'Error unknown'}';
}

class CacheException implements Exception {
  final String message;

  const CacheException([this.message]);

  @override
  String toString() => 'Cache Exception: ${message ?? 'Error unknown'}';
}
