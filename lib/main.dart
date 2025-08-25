import 'package:flutter/material.dart';
import 'package:foodgo/router/router.dart';

void main() {
  runApp(MyApp());
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