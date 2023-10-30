import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'res.dart';

class TextView {
  /// Get Generic Text with Italic
  static Text getGenericTextWithItalic({
    required String text,
    required String fontFamily,
    required int fontSize,
    required FontWeight fontWeight,
    required Color color,
    final TextAlign textAlign = TextAlign.start,
    required int lines,
    required FontStyle fontStyle,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      style: TextStyle(
        fontSize: sizes!.fontRatio * fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
}
