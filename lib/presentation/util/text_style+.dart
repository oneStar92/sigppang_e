import 'package:flutter/material.dart';

extension TextStyleCopyWith on TextStyle {
  TextStyle copyWith({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
    );
  }
}
