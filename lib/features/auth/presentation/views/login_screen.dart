import 'package:flutter/material.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(context.widthUnit * 6),
            child: const Text('Login Screen'),
          ),
        ),
      ),
    );
  }
}
