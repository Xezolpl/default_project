import 'package:default_project/infrastructure/dependency_injection/di.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic exception;
  final String methodName;

  Failure(this.exception, this.methodName) {
    logger.e('Caught in $methodName. Error: ${exception?.toString()}');
  }

  @override
  List<Object> get props => [exception, methodName];
}

///ApiFailure represents error caused by API (endpoints). Those failures are
///mainly server based and they are not ours fault.
class ApiFailure extends Failure {
  final dynamic exception;
  final String methodName;

  ApiFailure(this.exception, this.methodName) : super(exception, methodName);
}

///ConnectionFailure represents error caused by unsuccessful attemtions
///to connect to the internet.
class ConnectionFailure extends Failure {
  final dynamic exception;
  final String methodName;

  ConnectionFailure(this.exception, this.methodName)
      : super(exception, methodName);
}

///HiveFailure represents error caused by Hive database. The Hive box might been
///empty or didn't exist. There might been problem with migration or database integrity.
class HiveFailure extends Failure {
  final dynamic exception;
  final String methodName;

  HiveFailure(this.exception, this.methodName) : super(exception, methodName);
}

//If we don't know what happened :/
class UndefinedFailure extends Failure {
  final dynamic exception;
  final String methodName;

  UndefinedFailure(this.exception, this.methodName)
      : super(exception, methodName);
}
