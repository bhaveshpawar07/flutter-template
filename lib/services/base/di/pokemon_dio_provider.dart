import 'package:dio/dio.dart';
import 'package:flutter_template/flavors/flavor_config.dart';

Dio providePokemonDio({List<Interceptor> interceptors = const []}) {
  final baseOption =
      // BaseOptions(baseUrl: FlavorConfig.instance.values.apiBaseUrl);
      BaseOptions(baseUrl: "https://pokeapi.co/");
  final dio = Dio(baseOption);
  final logInterceptor = LogInterceptor(requestBody: true, responseBody: true);
  if (FlavorConfig.instance.values.showLogs) {
    dio.interceptors.add(logInterceptor);
  }
  dio.interceptors.addAll(interceptors);
  return dio;
}
