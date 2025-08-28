import 'package:flutter/material.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';
import 'package:demo_app/core/constants/app_colors.dart';

class PrimaryPillButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool loading;
  const PrimaryPillButton({super.key, required this.label, this.onTap, this.loading = false});

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight * 0.062;
    return FractionallySizedBox(
      widthFactor: 0.86,
      child: Material(
        color: AppColors.spotifyGreen,
        borderRadius: BorderRadius.circular(height),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: loading ? null : onTap,
          child: SizedBox(
            height: height,
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: loading
                    ? SizedBox(
                        key: const ValueKey('loader'),
                        height: height * 0.5,
                        width: height * 0.5,
                        child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                      )
                    : Text(
                        label,
                        key: const ValueKey('label'),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: height * 0.40,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
