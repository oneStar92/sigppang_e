import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextStyleConstants {
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
      case TextStyleConstants.calendarHeader:
        return TextStyle();
      case TextStyleConstants.day:
        return TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w500);
      case TextStyleConstants.now:
        return TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w900);
      case TextStyleConstants.selectedDay:
        return TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w900);
      case TextStyleConstants.googleLoginButton:
        return TextStyle(fontSize: 20.sp, color: Colors.black);
      case TextStyleConstants.appleLoginButton:
        return TextStyle(fontSize: 20.sp, color: Colors.white);
      case TextStyleConstants.policy:
        return TextStyle(fontSize: 14.sp, color: Colors.grey);
      case TextStyleConstants.sunday:
        return TextStyle(fontSize: 13.sp, color: Colors.red, fontWeight: FontWeight.w600);
      case TextStyleConstants.saturday:
        return TextStyle(fontSize: 13.sp, color: Colors.blue, fontWeight: FontWeight.w600);
      case TextStyleConstants.defaultDayOfWeek:
        return TextStyle(fontSize: 13.sp, color: Colors.black, fontWeight: FontWeight.w600);
    }
  }
}
