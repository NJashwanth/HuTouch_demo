import 'package:equatable/equatable.dart';

class CreateAccountEmailState extends Equatable {
  final String email;
  final bool isValid;
  final bool isSubmitting;

  const CreateAccountEmailState({
    required this.email,
    required this.isValid,
    required this.isSubmitting,
  });

  factory CreateAccountEmailState.initial() => const CreateAccountEmailState(email: '', isValid: false, isSubmitting: false);

  CreateAccountEmailState copyWith({
    String? email,
    bool? isValid,
    bool? isSubmitting,
  }) {
    return CreateAccountEmailState(
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [email, isValid, isSubmitting];
}
