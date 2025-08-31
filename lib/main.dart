import 'package:flutter/material.dart';
import 'api/dio.dart';
import 'di.dart';
import 'package:provider/provider.dart';
import 'package:foodgo/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(
    Provider(
      create: (_) => null,
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

