import 'package:flutter/material.dart';

mixin ProjectColors {
  static Color get background => const Color.fromRGBO(247, 247, 248, 1);
  static Color get disableBackground => const Color.fromRGBO(226, 226, 226, 1);
  static Color get error => const Color.fromRGBO(231, 58, 64, 1);
  static List<Color> get buttonGradient => const [
        Color.fromRGBO(251, 114, 76, 1),
        Color.fromRGBO(254, 144, 75, 1),
      ];
  static Color get numberBackground => const Color.fromRGBO(64, 64, 64, 1);
  static Color get unselectedNavBarItem =>
      const Color.fromRGBO(174, 174, 174, 1);
  static Color get selectedNavBarItem => const Color.fromRGBO(43, 43, 43, 1);
  static Color get greyBackground => const Color.fromRGBO(240, 240, 240, 1);
  static Color get icon => const Color.fromRGBO(32, 32, 32, 1);
  static Color get primaryText => const Color.fromRGBO(43, 43, 43, 1);

  static Color get secondaryText => const Color.fromRGBO(161, 161, 162, 1);
  static Color get yellow => const Color.fromRGBO(255, 203, 85, 1);
  static Color get shadow => const Color.fromRGBO(161, 161, 162, 1);
}
