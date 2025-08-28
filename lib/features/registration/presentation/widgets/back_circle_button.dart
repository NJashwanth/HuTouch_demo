import 'package:flutter/material.dart';
import 'package:demo_app/core/constants/app_colors.dart';

class BackCircleButton extends StatelessWidget {
  final VoidCallback onTap;
  const BackCircleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Material(
          color: AppColors.chipBlack,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: const Center(
              child: Icon(Icons.chevron_left, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
