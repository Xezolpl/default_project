import 'package:default_project/infrastructure/dependency_injection/di.dart';

class CacheException implements Exception {
  final String methodName;

  CacheException(this.methodName) {
    logger.e("CacheException thrown in $methodName");
  }
}

class ApiException implements Exception {
  final String methodName;

  ApiException(this.methodName) {
    logger.e("ApiException thrown in $methodName");
  }
}
