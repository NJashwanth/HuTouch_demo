import 'package:demo_app/features/start/domain/entities/auth_result.dart';

abstract class AuthRepository {
  Future<AuthResult> signUp();
  Future<AuthResult> signInWithGoogle();
  Future<AuthResult> signInWithFacebook();
  Future<AuthResult> signInWithApple();
}
