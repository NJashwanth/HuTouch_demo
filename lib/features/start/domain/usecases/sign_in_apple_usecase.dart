import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_app/features/start/domain/entities/auth_result.dart';
import 'package:demo_app/features/start/domain/repositories/auth_repository.dart';
import 'package:demo_app/features/start/data/repositories/auth_repository_impl.dart';

typedef SignInAppleUseCase = Future<AuthResult> Function();

final signInAppleUseCaseProvider = Provider<SignInAppleUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return () => repo.signInWithApple();
});
