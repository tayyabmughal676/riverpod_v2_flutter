import 'package:flutter/material.dart';

class AppColors {
  /// Primary
  static const primary900 = Color.fromRGBO(16, 95, 211, 1);
  static const primary800 = Color.fromRGBO(251, 244, 244, 1);
  static const primary700 = Color.fromRGBO(85, 140, 221, 1);
  static const primary600 = Color.fromRGBO(19, 22, 34, 1);
  static const primary500 = Color.fromRGBO(19, 22, 34, 1);

  static const bgCanvas = Color.fromRGBO(252, 252, 252, 1);
  static const containerBg900 = Color.fromRGBO(236, 237, 237, 1);
  static const primaryShades50 = Color.fromRGBO(220, 230, 250, 1);

  static const primaryShades100 = Color.fromRGBO(200, 216, 244, 1);
  static const containerShadow = Color.fromRGBO(128, 132, 174, 0.25);
  static const primaryShades200 = Color.fromRGBO(140, 175, 227, 1);
  static const primaryShades500 = Color.fromRGBO(16, 95, 211, 1);
  static const primaryShades400 = Color.fromRGBO(140, 175, 227, 1);
  static const primaryShades600 = Color.fromRGBO(60, 127, 226, 1);

  //
  static const progressIndictorBg = Color.fromRGBO(217, 217, 217, 1);
  static const progressIndictorAnxiety = Color.fromRGBO(220, 113, 80, 1);
  static const progressIndictorMood = Color.fromRGBO(106, 209, 57, 1);
  static const progressIndictorCognition = Color.fromRGBO(232, 106, 106, 1);
  static const progressIndictorLife = Color.fromRGBO(33, 150, 83, 1);
  static const progressIndictorQALife = Color.fromRGBO(237, 18, 18, 1);

  static const sliderColor100 = Color.fromRGBO(237, 18, 18, 1);
  static const sliderColor200 = Color.fromRGBO(232, 106, 106, 1);
  static const sliderColor300 = Color.fromRGBO(220, 113, 80, 1);
  static const sliderColor400 = Color.fromRGBO(106, 209, 57, 1);
  static const sliderColor500 = Color.fromRGBO(33, 150, 83, 1);

  static const lifeSeriesColor = Color.fromRGBO(127, 89, 176, 1);
  static const anxietySeriesColor = Color.fromRGBO(99, 197, 234, 1);
  static const moodSeriesColor = Color.fromRGBO(234, 75, 139, 1);
  static const cognitionSeriesColor = Color.fromRGBO(252, 180, 36, 1);

  ///Secondary
  static const secondary900 = Color.fromRGBO(194, 146, 146, 1);
  static const secondary800 = Color.fromRGBO(204, 166, 166, 1);
  static const secondary700 = Color.fromRGBO(211, 178, 178, 1);
  static const secondary600 = Color.fromRGBO(218, 197, 197, 1);
  static const secondary500 = Color.fromRGBO(219, 208, 208, 1);

  /// GreyScale
  static const greyScale900 = Color.fromRGBO(19, 22, 34, 1);

  static const greyScale800 = Color.fromRGBO(236, 237, 237, 1);
  static const greyScale700 = Color.fromRGBO(111, 116, 135, 1);
  static const greyScale600 = Color.fromRGBO(161, 164, 172, 1);
  static const greyScale500 = Color.fromRGBO(19, 22, 34, 1);
  static const greyScale400 = Color.fromRGBO(69, 74, 93, 1);
  static const greyScale200 = Color.fromRGBO(161, 164, 172, 1);
  static const greyScale100 = Color.fromRGBO(202, 203, 206, 1);

  static const inputTextBorder = Color.fromRGBO(69, 74, 93, 1);

  /// Status Colors
  static const statusColor100 = Color.fromRGBO(23, 220, 102, 1);
  static const statusColor200 = Color.fromRGBO(242, 176, 76, 1);
  static const statusColor300 = Color.fromRGBO(236, 69, 69, 1);
  static const statusColor400 = Color.fromRGBO(238, 97, 18, 1);
  static const statusColor500 = Color.fromRGBO(235, 87, 87, 1);
  static const statusModerateColor = Color.fromRGBO(255, 122, 0, 1);
  static const statusSuccessColor = Color.fromRGBO(15, 186, 22, 1);
  static const errorColor = Color.fromRGBO(242, 52, 52, 1);

  /// Black Color
  static const blackMain = Color.fromRGBO(0, 0, 0, 1);

  /// White Color
  static const whiteMain = Color.fromRGBO(249, 249, 249, 1);
  static const whiteMain100 = Color.fromRGBO(249, 249, 249, 0.25);
  static const white100 = Color.fromRGBO(217, 217, 217, 1);

  static const shadowColor = Color.fromRGBO(48, 100, 233, 0.11);
  static const drawerSelectorColor = Color.fromRGBO(0, 43, 87, 0.3);

  /// Drawer Background Colors
  /// rgba(1, 82, 164, 1)
  /// rgba(31, 149, 211, 1)
  static const linearColorOne = Color.fromRGBO(1, 82, 164, 1);
  static const linearColorTwo = Color.fromRGBO(31, 149, 211, 1);
  static const linearColorThree = Color.fromRGBO(14, 110, 183, 1);

  /// Home Screen Container Color
  static const linearHomeColorOne = Color.fromRGBO(31, 149, 211, 1);
  static const linearHomeColorTwo = Color.fromRGBO(0, 67, 134, 1);

  /// Tasks Shadow
  static const inProgressShadowColor = Color.fromRGBO(1, 82, 164, 1);
  static const inCompletedShadowColor = Color.fromRGBO(31, 149, 211, 1);
  static const inClosedShadowColor = Color.fromRGBO(52, 195, 242, 1);
}

class HexColor extends Color {
  HexColor({required final String hexColor})
      : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
