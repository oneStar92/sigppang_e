import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class Sizes {
  static final defaultAppPadding = REdgeInsets.fromLTRB(16, 16, 16, 0);
  static final defaultHorizontalPadding = REdgeInsets.symmetric(horizontal: 8);
  static final defaultBorderRadius = const BorderRadius.all(Radius.circular(10)).r;
  static const appBarHeight = 50.0;
  static const bottomNavigationBarHeight = 50.0;
  static final defaultPaddingOfWidth = 8.w;
  static final defaultPaddingOfHeight = 8.h;
  static final separatorHeight = 4.h;
  static final loginLogoSize = Size(300.w, 300.h);
  static final socialLoginButtonSize = Size(300.w, 60.h);
  static final socialLoginLogoSize = Size(40.w, 40.h);
  static final appbarLogoSize = Size(50.w, 50.h);
  static final calendarHeaderSize = Size(double.infinity, 50.h);
  static final calendarDayLogoSize = Size(double.infinity, 45.h);
  static final dayOfWeekSize = Size(double.nan, 20.h);
  static final calendarRowSize = Size(double.nan, 70.h);
  static final toDoTitleSize = Size(double.infinity, 40.h);
  static final toDoItemSize = Size(double.infinity, 35.h);
  static final toDoItemLogoSize = Size(35.w, 35.h);
  static final settingButtonSize = Size(double.infinity, 60.h);

  Sizes._();
}