import 'package:flutter/cupertino.dart';

import 'res.dart';

class CommonPadding {
  /// SizeBox With Height
  static Widget sizeBoxWithHeight({
    required double height,
  }) {
    return SizedBox(
      height: sizes!.heightRatio * height,
    );
  }

  /// SizeBox with Width
  static Widget sizeBoxWithWidth({
    required double width,
  }) {
    return SizedBox(
      width: sizes!.widthRatio * width,
    );
  }
}
