// Datasource-level errors

import 'exception.dart';

class ServerException extends CustomException {
  ServerException(String cause) : super(cause);
}

class CacheException extends CustomException {
  CacheException(String cause) : super(cause);
}
