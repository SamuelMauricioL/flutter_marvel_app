import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/core/theme/palette.dart';

class MarvelTextStyle {
  static TextStyle subtitle = const TextStyle(
    color: Palette.neutralDark,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  static TextStyle paragraph = const TextStyle(
    color: Palette.neutralDark,
    fontSize: 16,
    height: 1.5,
  );
}
