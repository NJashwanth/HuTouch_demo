import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_app/features/start/domain/entities/auth_result.dart';
import 'package:demo_app/features/start/domain/repositories/auth_repository.dart';
import 'package:demo_app/features/start/data/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  AuthRepositoryImpl(this._remote);

  @override
  Future<AuthResult> signUp() => _remote.signUp();

  @override
  Future<AuthResult> signInWithApple() => _remote.apple();

  @override
  Future<AuthResult> signInWithFacebook() => _remote.facebook();

  @override
  Future<AuthResult> signInWithGoogle() => _remote.google();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(AuthRemoteDataSource());
});
