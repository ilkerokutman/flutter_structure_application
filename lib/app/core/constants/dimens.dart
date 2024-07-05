import 'package:flutter/material.dart';

class UiDimens {
  static const double padding = 16.0;
  static const double margin = 16.0;
  static const double borderRadius = 8.0;

  static const BorderRadius radius =
      BorderRadius.all(Radius.circular(borderRadius));

  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: padding);

  static const EdgeInsets contentPadding = EdgeInsets.all(20.0);
}
