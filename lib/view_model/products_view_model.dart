import 'package:flutter/cupertino.dart';
import 'package:foodgo/models/product.dart';

import '../repositories/category_repository.dart';
import '../repositories/product_repository.dart';

class ProductsViewModel extends ChangeNotifier {
  final CategoryRepository categoryRepository;
  final ProductRepository productRepository;

  ProductsViewModel({
    required this.categoryRepository,
    required this.productRepository,
  });

  List<Product> _products = [];
  List<String> _categories = [];
  bool _isLoading = false;
  String? _error;
  String _selectedCategory = "All";

  List<Product> get products => _products;
  List<String> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedCategory => _selectedCategory;

  List<Product> _allProducts = [];

  Future<void> fetchProducts(String category) async {
    try {
      _isLoading = true;
      notifyListeners();

      if (_allProducts.isEmpty) {
        _allProducts = await productRepository.getProducts();
      }

      if (category == "All") {
        _products = _allProducts;
      } else {
        _products = _allProducts
            .where((product) => product.category == category)
            .toList();
      }
    } catch (e) {
      _error = "failed to fetch products";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCategories() async {
    try {
      _isLoading = true;
      notifyListeners();
      _categories = await categoryRepository.getCategories();
      _categories.insert(0, "All");
    } catch (e) {
      _error = "failed to fetch categories";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void changeSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
