import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/models/product.dart';
import 'themes.dart';

import 'router/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  await Hive.openBox<Product>("product_box");

  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      onGenerateRoute: _appRouter.generateRoute,
      theme: lightMode,
      //darkTheme: darkMode,
    );
  }
}
