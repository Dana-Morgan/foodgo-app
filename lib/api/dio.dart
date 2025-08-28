import 'package:dio/dio.dart';

class DioApi {
  final Dio _dio;

  DioApi(this._dio);

  Future<dynamic> get({required String endPoint}) async {
    try {
      final Response response = await _dio.get(endPoint);
      return response.data;
    } catch (e) {
      print("GET error: $e");
      return null;
    }
  }

  Future<dynamic> post({required String endPoint, Object? data}) async {
    try {
      final Response response = await _dio.post(endPoint, data: data);
      return response.data;
    } catch (e) {
      print("POST error: $e");
      return null;
    }
  }
}
