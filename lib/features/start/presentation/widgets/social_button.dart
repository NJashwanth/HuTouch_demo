import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';
import 'package:demo_app/core/constants/app_colors.dart';

class SocialButton extends StatelessWidget {
  final Widget leading;
  final String label;
  final VoidCallback? onTap;
  final bool loading;
  const SocialButton({
    super.key,
    required this.leading,
    required this.label,
    this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight * 0.058;
    return FractionallySizedBox(
      widthFactor: 0.86,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(height),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: loading ? null : onTap,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height),
              border: Border.all(color: AppColors.outline, width: 1.1),
              color: Colors.transparent,
            ),
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 4.2),
            child: Row(
              children: [
                SizedBox(
                  width: height * 0.65,
                  height: height * 0.65,
                  child: Center(child: leading),
                ),
                Expanded(
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 180),
                      child: loading
                          ? SizedBox(
                              key: const ValueKey('loader'),
                              height: height * 0.5,
                              width: height * 0.5,
                              child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : Text(
                              label,
                              key: const ValueKey('label'),
                              style: TextStyle(
                                color: AppColors.onBg,
                                fontWeight: FontWeight.w800,
                                fontSize: height * 0.38,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ),
                SizedBox(width: height * 0.65),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleMark extends StatelessWidget {
  const GoogleMark({super.key});
  @override
  Widget build(BuildContext context) {
    final size = context.screenHeight * 0.022;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(width: size * 0.62, height: size * 0.24, color: AppColors.googleBlue),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(width: size * 0.92, height: size * 0.2, color: AppColors.googleGreen),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(width: size * 0.28, height: size * 0.24, color: AppColors.googleYellow),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(width: size * 0.92, height: size * 0.2, color: AppColors.googleRed),
          ),
        ],
      ),
    );
  }
}

class FacebookMark extends StatelessWidget {
  const FacebookMark({super.key});
  @override
  Widget build(BuildContext context) {
    final size = context.screenHeight * 0.022;
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.facebookBlue),
      alignment: Alignment.center,
      child: Text(
        'f',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: size * 0.8,
          height: 1,
        ),
      ),
    );
  }
}

class AppleMark extends StatelessWidget {
  const AppleMark({super.key});
  @override
  Widget build(BuildContext context) {
    final size = context.screenHeight * 0.022;
    return Icon(CupertinoIcons.app, color: Colors.white, size: size);
  }
}
