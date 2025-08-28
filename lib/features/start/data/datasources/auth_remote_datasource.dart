import 'dart:async';
import 'package:demo_app/features/start/domain/entities/auth_result.dart';

class AuthRemoteDataSource {
  Future<AuthResult> signUp() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return const AuthResult(success: true, message: 'Signed up');
  }

  Future<AuthResult> google() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return const AuthResult(success: true, message: 'Google auth success');
  }

  Future<AuthResult> facebook() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return const AuthResult(success: true, message: 'Facebook auth success');
  }

  Future<AuthResult> apple() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return const AuthResult(success: true, message: 'Apple auth success');
  }
}
