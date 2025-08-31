import 'package:flutter/material.dart';
import 'package:foodgo/repositories/category_repository.dart';
import 'package:foodgo/repositories/product_repository.dart';
import 'package:foodgo/view_model/products_view_model.dart';
import 'di.dart';
import 'package:provider/provider.dart';
import 'package:foodgo/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(
    ChangeNotifierProvider(
      create: (_) =>
          ProductsViewModel(
              categoryRepository: locator<CategoryRepository>(),
              productRepository: locator<ProductRepository>(),
            )
            ..fetchCategories()
            ..fetchProducts("All"),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FoodGo App',
      routerConfig: appRouter,
    );
  }
}
