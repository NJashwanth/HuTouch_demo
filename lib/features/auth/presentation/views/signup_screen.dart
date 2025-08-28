import 'package:flutter/material.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(context.widthUnit * 6),
            child: const Text('Signup Screen'),
          ),
        ),
      ),
    );
  }
}
