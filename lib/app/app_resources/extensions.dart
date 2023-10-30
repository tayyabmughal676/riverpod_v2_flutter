import 'package:flutter/material.dart';

import 'res.dart';

extension ConsoleDebugPrint on String {
  consoleMessage() {
    return debugPrint(this);
  }
}

extension AlignExtension on Widget {
  Widget getAlign() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Widget getAlignRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  Widget get30HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 30.0),
      child: this,
    );
  }

  Widget get32HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 32.0),
      child: this,
    );
  }

  Widget get35HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 35.0),
      child: this,
    );
  }

  Widget get25HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 25.0),
      child: this,
    );
  }

  Widget get20HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 20.0),
      child: this,
    );
  }

  Widget get20VerticalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizes!.heightRatio * 20.0),
      child: this,
    );
  }

  Widget get16HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 16.0),
      child: this,
    );
  }

  Widget get10HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10.0),
      child: this,
    );
  }

  Widget get10VerticalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizes!.heightRatio * 10.0),
      child: this,
    );
  }

  Widget get5VerticalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizes!.heightRatio * 5.0),
      child: this,
    );
  }

  Widget get5HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 5.0),
      child: this,
    );
  }

  Widget get8VerticalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizes!.heightRatio * 8.0),
      child: this,
    );
  }

  Widget get24HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 24.0),
      child: this,
    );
  }

  Widget get15HorizontalPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 15.0),
      child: this,
    );
  }

  Widget getChildCenter() {
    return Center(
      child: this,
    );
  }
}

extension Paddings on Widget {
  SizedBox getPaddingHeight({required double height}) {
    return SizedBox(
      height: sizes!.heightRatio * height,
    );
  }

  SizedBox getPaddingWidth({required double width}) {
    return SizedBox(
      width: sizes!.widthRatio * width,
    );
  }
}

extension StringExtension on String {
  /// Truncate a string if it's longer than [maxLength] and add an [ellipsis].
  String getShortString(int maxLength, [String ellipsis = "…"]) =>
      length > maxLength
          ? '${substring(0, maxLength - ellipsis.length)}$ellipsis'
          : this;

  String getShortStringWithoutDots(int maxLength, [String ellipsis = ""]) =>
      length > maxLength ? substring(0, maxLength - ellipsis.length) : this;

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool validatePassword() {
    return RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
        .hasMatch(this);
  }

  bool validatePhoneNumber() {
    return RegExp(
            r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
        .hasMatch(this);
  }

  bool validateUserName() {
    return RegExp(r"^[a-zA-Z-]{4,15}$").hasMatch(this);
  }
}
