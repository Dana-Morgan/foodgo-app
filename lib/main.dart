import 'package:flutter/material.dart';
import 'api/dio.dart';
import 'dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  getProductById(1);
  confirmOrder();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'FoodGo App');
  }
}

void getProductById(int id) async {
  final dioApi = locator<DioApi>();
  final response = await dioApi.get(endPoint: "/api/products/$id");

  if (response != null) {
    print("$response");
  } else {
    print("failed get product with id $id");
  }
}

void confirmOrder() async {
  final dioApi = locator<DioApi>();
  final response = await dioApi.post(endPoint: "/api/order/confirm");

  if (response != null) {
    print("$response");
  } else {
    print("failed to order");
  }
}
