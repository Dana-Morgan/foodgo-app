import 'package:foodgo/repositories/product_repository.dart';
import 'package:foodgo/models/product.dart';

class CategoryRepository {
  final ProductRepository productRepository;

  CategoryRepository(this.productRepository);

  Future<Set<String>> getCategories() async {
    final List<Product> products = await productRepository.getProducts();

    final Set<String> categorySet = {};

    for (var product in products) {
      if (product.category.isNotEmpty) {
        categorySet.add(product.category);
      }
    }

    return categorySet;
  }
}
