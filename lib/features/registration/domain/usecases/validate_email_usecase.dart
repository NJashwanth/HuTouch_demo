class ValidateEmailUseCase {
  const ValidateEmailUseCase();

  bool call(String email) {
    final value = email.trim();
    if (value.isEmpty) return false;
    final regex = RegExp(r"^[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$", caseSensitive: false);
    return regex.hasMatch(value);
  }
}
