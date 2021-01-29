import 'package:default_project/infrastructure/dependency_injection/di.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpClient {
  Dio client;
  static const CANARY_API_BASE_URL = "https://api.kanarek.app/";
  static const AWS_SERVER_BASE_URL =
      "https://s3.eu-central-1.amazonaws.com/kanarek/";

  HttpClient() {
    client = Dio();
    final interceptors = getIt<List<Interceptor>>();

    client.interceptors.addAll(interceptors);
    client.options.responseType = ResponseType.json;
    client.options.baseUrl = HttpClient.CANARY_API_BASE_URL;
  }

  static Interceptor getDioLogger() {
    return PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
        maxWidth: 90);
  }
}
