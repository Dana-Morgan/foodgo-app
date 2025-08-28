import '../api/dio.dart';

class ProductRepository {
  final DioApi dioApi;

  ProductRepository(this.dioApi);

  Future<List<dynamic>> getProducts() async {
    final response = await dioApi.get(endPoint: '/api/products');

    return response;
  }
}
