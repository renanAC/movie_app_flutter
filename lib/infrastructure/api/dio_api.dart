import 'package:dio/dio.dart';
import 'package:my_flutter_app/infrastructure/api/api_rest.dart';
import 'package:my_flutter_app/infrastructure/services/secrets/secrets.dart';
import 'package:my_flutter_app/infrastructure/services/secrets/secrets_enum.dart';

class DioApi implements ApiRest {
  DioApi({required this.secrets, required this.dio}) {
    initDio();
  }

  final Dio dio;
  final Secrets secrets;

  void initDio() {
    final String apiUrl = secrets.getKey(keyIdentifier: SecretsKey.apiUrl);
    final String apiToken = secrets.getKey(keyIdentifier: SecretsKey.apiToken);

    dio.options.baseUrl = apiUrl;
    dio.options.headers['Authorization'] = 'Bearer $apiToken';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  @override
  Future<Map<String, dynamic>> delete(String endpoint, {Object? data}) async {
    final Response response = await dio.delete(endpoint, data: data);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    final Response response =
        await dio.get(endpoint, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint, {Object? data}) async {
    final Response response = await dio.get(endpoint);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put(String endpoint, {Object? data}) async {
    final Response response = await dio.get(endpoint);
    return response.data;
  }
}
