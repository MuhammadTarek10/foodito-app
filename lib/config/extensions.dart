import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get hight => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
