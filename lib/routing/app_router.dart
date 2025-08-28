import 'package:flutter/material.dart';
import 'package:demo_app/features/start/presentation/views/start_screen.dart';
import 'package:demo_app/features/auth/presentation/views/login_screen.dart';
import 'package:demo_app/features/auth/presentation/views/signup_screen.dart';

class AppRouter {
  static const start = '/';
  static const login = '/login';
  static const signup = '/signup';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case start:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      default:
        return MaterialPageRoute(builder: (_) => const StartScreen());
    }
  }
}
