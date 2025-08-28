import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_app/features/registration/domain/usecases/validate_email_usecase.dart';
import 'package:demo_app/features/registration/presentation/viewmodels/create_account_email_state.dart';

final validateEmailUseCaseProvider = Provider<ValidateEmailUseCase>((ref) => const ValidateEmailUseCase());

final createAccountEmailViewModelProvider = AutoDisposeStateNotifierProvider<CreateAccountEmailViewModel, CreateAccountEmailState>((ref) {
  final validator = ref.read(validateEmailUseCaseProvider);
  return CreateAccountEmailViewModel(validator);
});

class CreateAccountEmailViewModel extends StateNotifier<CreateAccountEmailState> {
  CreateAccountEmailViewModel(this._validate) : super(CreateAccountEmailState.initial());

  final ValidateEmailUseCase _validate;

  void updateEmail(String email) {
    state = state.copyWith(email: email, isValid: _validate(email));
  }

  Future<bool> submit() async {
    if (!state.isValid) return false;
    state = state.copyWith(isSubmitting: true);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(isSubmitting: false);
    return true;
  }

  void clear() => updateEmail('');
}
