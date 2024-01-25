import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/size_constants.dart';

final class LogoDIContainer {
  final Image _rawLogo = Image.asset('assets/icons/logo_w.png');
  final Image _logo = Image.asset('assets/icons/logo.png');
  final Image _burntLogo = Image.asset('assets/icons/logo_b.png');

  LogoDIContainer._();

  static final LogoDIContainer instance = LogoDIContainer._();

  Widget loginLogo() {
    final size = SizeConstants.loginLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _logo),
    );
  }

  Widget appBarLogo() {
    final size = SizeConstants.appbarLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _logo),
    );
  }

  Widget calendarRawLogo({required double opacity}) {
    final size = SizeConstants.calendarLogo.value;
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: FittedBox(child: _rawLogo),
      ),
    );
  }

  Widget calendarLogo() {
    final size = SizeConstants.calendarLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _logo),
    );
  }

  Widget calendarBurntLogo() {
    final size = SizeConstants.calendarLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _burntLogo),
    );
  }
}
