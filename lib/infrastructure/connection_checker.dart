import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class InternetConnectionChecker {
  static final connectivity = Connectivity();

  static Future<bool> check() async {
    return await DataConnectionChecker().hasConnection;
  }

  static Stream<bool> internetConnectionStream() async* {
    connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async* {
      if (result != ConnectivityResult.none) {
        yield await DataConnectionChecker().hasConnection;
      } else {
        yield false;
      }
    });
  }
}
