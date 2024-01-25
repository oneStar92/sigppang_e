import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextStyleContainer {
  googleLoginButton,
  appleLoginButton,
  policy,
  calendarHeader,
  sunday,
  saturday,
  defaultDayOfWeek,
  day,
  now,
  selectedDay;

  TextStyle get value {
    switch (this) {
      case TextStyleContainer.calendarHeader:
        return TextStyle();
      case TextStyleContainer.day:
        return TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w500);
      case TextStyleContainer.now:
        return TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w900);
      case TextStyleContainer.selectedDay:
        return TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w900);
      case TextStyleContainer.googleLoginButton:
        return TextStyle(fontSize: 20.sp, color: Colors.black);
      case TextStyleContainer.appleLoginButton:
        return TextStyle(fontSize: 20.sp, color: Colors.white);
      case TextStyleContainer.policy:
        return TextStyle(fontSize: 14.sp, color: Colors.grey);
      case TextStyleContainer.sunday:
        return TextStyle(fontSize: 13.sp, color: Colors.red, fontWeight: FontWeight.w600);
      case TextStyleContainer.saturday:
        return TextStyle(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.w600);
      case TextStyleContainer.defaultDayOfWeek:
        return TextStyle(fontSize: 13.sp, color: Colors.black, fontWeight: FontWeight.w600);
    }
  }
}
