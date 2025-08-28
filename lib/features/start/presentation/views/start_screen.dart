import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';
import 'package:demo_app/core/constants/app_strings.dart';
import 'package:demo_app/core/constants/app_colors.dart';
import 'package:demo_app/features/start/presentation/widgets/branded_header.dart';
import 'package:demo_app/features/start/presentation/widgets/primary_button.dart';
import 'package:demo_app/features/start/presentation/widgets/social_button.dart';
import 'package:demo_app/features/start/presentation/viewmodels/start_view_model.dart';
import 'package:demo_app/routing/app_router.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(startViewModelProvider);
    final notifier = ref.read(startViewModelProvider.notifier);
    final paddingH = context.widthUnit * 7.0;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BrandedHeader(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final content = _Content(
                    loading: vm.loading,
                    onSignUp: () async {
                      final res = await notifier.signUpFree();
                      if (context.mounted) {
                        if (res.success) {
                          Navigator.of(context).pushNamed(AppRouter.signup);
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(res.message)));
                        }
                      }
                    },
                    onGoogle: () async {
                      final res = await notifier.continueWithGoogle();
                      if (context.mounted) {
                        if (res.success) {
                          Navigator.of(context).pushNamed(AppRouter.signup);
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(res.message)));
                        }
                      }
                    },
                    onFacebook: () async {
                      final res = await notifier.continueWithFacebook();
                      if (context.mounted) {
                        if (res.success) {
                          Navigator.of(context).pushNamed(AppRouter.signup);
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(res.message)));
                        }
                      }
                    },
                    onApple: () async {
                      final res = await notifier.continueWithApple();
                      if (context.mounted) {
                        if (res.success) {
                          Navigator.of(context).pushNamed(AppRouter.signup);
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(res.message)));
                        }
                      }
                    },
                    onLogin: () {
                      Navigator.of(context).pushNamed(AppRouter.login);
                    },
                  );

                  final needsScroll =
                      constraints.maxHeight < context.screenHeight * 0.44;
                  if (needsScroll) {
                    return Scrollbar(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: paddingH),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: content,
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingH),
                    child: content,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final bool loading;
  final VoidCallback onLogin;
  final VoidCallback onSignUp;
  final VoidCallback onGoogle;
  final VoidCallback onFacebook;
  final VoidCallback onApple;

  const _Content({
    required this.loading,
    required this.onLogin,
    required this.onSignUp,
    required this.onGoogle,
    required this.onFacebook,
    required this.onApple,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.heightUnit * 2.2;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: context.heightUnit * 2.0),
        PrimaryPillButton(
          label: AppStrings.signUpFree,
          onTap: onSignUp,
          loading: loading,
        ),
        SizedBox(height: spacing),
        SocialButton(
          leading: const GoogleMark(),
          label: AppStrings.continueWithGoogle,
          onTap: onGoogle,
          loading: loading,
        ),
        SizedBox(height: spacing),
        SocialButton(
          leading: const FacebookMark(),
          label: AppStrings.continueWithFacebook,
          onTap: onFacebook,
          loading: loading,
        ),
        SizedBox(height: spacing),
        SocialButton(
          leading: const AppleMark(),
          label: AppStrings.continueWithApple,
          onTap: onApple,
          loading: loading,
        ),
        SizedBox(height: context.heightUnit * 2.4),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onLogin,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: context.heightUnit * 1.0),
              child: Text(
                AppStrings.logIn,
                style: TextStyle(
                  color: AppColors.onBg,
                  fontWeight: FontWeight.w800,
                  fontSize: context.screenHeight * 0.020,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: context.heightUnit * 1.0),
      ],
    );
  }
}
