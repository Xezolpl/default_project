import 'package:default_project/infrastructure/http/http_client.dart';
import 'package:default_project/presentation/bloc/app_cubit/app_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt getIt = GetIt.instance;

Logger get logger => getIt<Logger>();

abstract class DI {
  static void initializeDependencies() {
    getIt.registerSingleton<Logger>(Logger());

    // HTTP client
    getIt.registerSingleton<List<Interceptor>>([
      HttpClient.getDioLogger(),
    ]);
    getIt.registerSingleton<HttpClient>(HttpClient());

    // BLoCs
    getIt.registerLazySingleton<AppCubit>(() => AppCubit());
  }
}
