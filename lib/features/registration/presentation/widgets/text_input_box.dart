import 'package:flutter/material.dart';
import 'package:demo_app/core/constants/app_colors.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';

class TextInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool readOnly;

  const TextInputBox({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.keyboardType = TextInputType.emailAddress,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputGrey,
        borderRadius: BorderRadius.circular(h * 1.2),
      ),
      padding: EdgeInsets.symmetric(horizontal: h * 1.2),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        readOnly: readOnly,
        style: TextStyle(
          color: Colors.white,
          fontSize: h * 2.1,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: h * 2,
            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: h * 1.8),
        ),
      ),
    );
  }
}
