import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

extension BuildContextExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  NavigatorState get navigator => Navigator.of(this);
}

extension KeyIdExtension on Box {
  dynamic getKeyById(String id) {
    final Map deliveriesMap = toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value) {
      if (value.id == id) {
        desiredKey = key;
      }
    });
    return desiredKey;
  }
}
