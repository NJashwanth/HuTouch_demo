import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_app/features/start/domain/usecases/sign_up_usecase.dart';
import 'package:demo_app/features/start/domain/usecases/sign_in_google_usecase.dart';
import 'package:demo_app/features/start/domain/usecases/sign_in_facebook_usecase.dart';
import 'package:demo_app/features/start/domain/usecases/sign_in_apple_usecase.dart';
import 'package:demo_app/features/start/domain/entities/auth_result.dart';

class StartViewState {
  final bool loading;
  final AuthResult? lastResult;
  const StartViewState({this.loading = false, this.lastResult});
  StartViewState copyWith({bool? loading, AuthResult? lastResult}) =>
      StartViewState(loading: loading ?? this.loading, lastResult: lastResult ?? this.lastResult);
}

class StartViewModel extends StateNotifier<StartViewState> {
  final SignUpUseCase _signUp;
  final SignInGoogleUseCase _google;
  final SignInFacebookUseCase _facebook;
  final SignInAppleUseCase _apple;
  StartViewModel(this._signUp, this._google, this._facebook, this._apple) : super(const StartViewState());

  Future<AuthResult> signUpFree() async {
    state = state.copyWith(loading: true);
    final res = await _signUp();
    state = state.copyWith(loading: false, lastResult: res);
    return res;
  }

  Future<AuthResult> continueWithGoogle() async {
    state = state.copyWith(loading: true);
    final res = await _google();
    state = state.copyWith(loading: false, lastResult: res);
    return res;
  }

  Future<AuthResult> continueWithFacebook() async {
    state = state.copyWith(loading: true);
    final res = await _facebook();
    state = state.copyWith(loading: false, lastResult: res);
    return res;
  }

  Future<AuthResult> continueWithApple() async {
    state = state.copyWith(loading: true);
    final res = await _apple();
    state = state.copyWith(loading: false, lastResult: res);
    return res;
  }
}

final startViewModelProvider = StateNotifierProvider<StartViewModel, StartViewState>((ref) {
  final signUp = ref.watch(signUpUseCaseProvider);
  final google = ref.watch(signInGoogleUseCaseProvider);
  final facebook = ref.watch(signInFacebookUseCaseProvider);
  final apple = ref.watch(signInAppleUseCaseProvider);
  return StartViewModel(signUp, google, facebook, apple);
});
