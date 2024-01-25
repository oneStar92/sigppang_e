import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SizeConstants {
  loginLogo,
  socialLoginButton,
  socialLogo,
  appbarLogo,
  calendarLogo,
  dayOfWeek,
  calendarRow;

  Size get value {
    switch (this) {
      case SizeConstants.loginLogo:
        return Size(300.w, 300.h);
      case SizeConstants.socialLoginButton:
        return Size(300.w, 60.h);
      case SizeConstants.socialLogo:
        return Size(40.h, 40.w);
      case SizeConstants.appbarLogo:
        return Size(50.w, 50.h);
      case SizeConstants.calendarLogo:
        return Size(double.infinity, 45.h);
      case SizeConstants.dayOfWeek:
        return Size(double.nan, 20.h);
      case SizeConstants.calendarRow:
        return Size(double.nan, 70.h);
    }
  }
}
