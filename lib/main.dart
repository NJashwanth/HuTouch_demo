import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_app/core/theme/app_theme.dart';
import 'package:demo_app/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.start,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
