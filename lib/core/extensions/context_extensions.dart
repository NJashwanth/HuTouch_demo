import 'package:flutter/material.dart';

extension ContextDimensions on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get widthUnit => screenWidth / 100;
  double get heightUnit => screenHeight / 100;
}

class ContextExtensionss {
  final BuildContext context;
  const ContextExtensionss(this.context);
  bool get isPortrait => MediaQuery.orientationOf(context) == Orientation.portrait;
  bool get isLandscape => !isPortrait;
}
