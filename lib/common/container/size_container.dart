import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SizeContainer {
  loginLogo,
  socialLoginButton,
  socialLogo,
  appbarLogo,
  calendarLogo,
  dayOfWeek,
  calendarRow;

  Size get value {
    switch (this) {
      case SizeContainer.loginLogo:
        return Size(300.w, 300.h);
      case SizeContainer.socialLoginButton:
        return Size(300.w, 60.h);
      case SizeContainer.socialLogo:
        return Size(40.h, 40.w);
      case SizeContainer.appbarLogo:
        return Size(50.w, 50.h);
      case SizeContainer.calendarLogo:
        return Size(double.infinity, 45.h);
      case SizeContainer.dayOfWeek:
        return Size(double.nan, 20.h);
      case SizeContainer.calendarRow:
        return Size(double.nan, 70.h);
    }
  }
}
