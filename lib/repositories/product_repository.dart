import '../api/dio.dart';
import '../models/product.dart';

class ProductRepository {
  final DioApi dioApi;

  ProductRepository(this.dioApi);

  Future<List<Product>> getProducts() async {
    final List<dynamic> response = await dioApi.get(endPoint: '/api/products');

    return response.map((json) => Product.fromJson(json)).toList();
  }


}
