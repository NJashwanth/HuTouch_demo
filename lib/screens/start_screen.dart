import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
}

onSignUp: () async {
  try {
    final res = await notifier.signUpFree();
    if (context.mounted) {
      if (res.success) {
        Navigator.of(context).pushNamed(AppRouter.signup);
      } else {
        showErrorSnackbar(context, res.message);
      }
    }
  } catch (e) {
    if (context.mounted) {
      showErrorSnackbar(context, 'An error occurred: $e');
    }
  }
},

onGoogle: () async {
  try {
    final res = await notifier.continueWithGoogle();
    if (context.mounted) {
      if (res.success) {
        Navigator.of(context).pushNamed(AppRouter.signup);
      } else {
        showErrorSnackbar(context, res.message);
      }
    }
  } catch (e) {
    if (context.mounted) {
      showErrorSnackbar(context, 'An error occurred: $e');
    }
  }
},

onFacebook: () async {
  try {
    final res = await notifier.continueWithFacebook();
    if (context.mounted) {
      if (res.success) {
        Navigator.of(context).pushNamed(AppRouter.signup);
      } else {
        showErrorSnackbar(context, res.message);
      }
    }
  } catch (e) {
    if (context.mounted) {
      showErrorSnackbar(context, 'An error occurred: $e');
    }
  }
},

onApple: () async {
  try {
    final res = await notifier.continueWithApple();
    if (context.mounted) {
      if (res.success) {
        Navigator.of(context).pushNamed(AppRouter.signup);
      } else {
        showErrorSnackbar(context, res.message);
      }
    }
  } catch (e) {
    if (context.mounted) {
      showErrorSnackbar(context, 'An error occurred: $e');
    }
  }
},