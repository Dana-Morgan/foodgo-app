import 'package:foodgo/repositories/product_repository.dart';

class CategoryRepository {
  final ProductRepository productRepository;
  CategoryRepository(this.productRepository);

  Future<Set<String>> getCategories() async {
    final List<dynamic> products = await productRepository.getProducts();

    final Set<String> categorySet = {};

    for (var product in products) {
      final category = product['category'] as String?;
      if (category != null) {
        categorySet.add(category);
      }
    }

    return categorySet;
  }
}
