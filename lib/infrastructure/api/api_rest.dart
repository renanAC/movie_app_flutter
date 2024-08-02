abstract class ApiRest {
  Future<Map<String, dynamic>> post(String endpoint, {Object? data});
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, dynamic>? queryParameters});
  Future<Map<String, dynamic>> put(String endpoint, {Object? data});
  Future<Map<String, dynamic>> delete(String endpoint, {Object? data});
}
