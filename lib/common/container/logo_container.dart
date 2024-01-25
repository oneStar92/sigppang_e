import 'package:flutter/material.dart';
import 'package:sigppang_e/common/container/size_container.dart';

final class LogoContainer {
  final Image _rawLogo = Image.asset('assets/icons/logo_w.png');
  final Image _logo = Image.asset('assets/icons/logo.png');
  final Image _burntLogo = Image.asset('assets/icons/logo_b.png');

  LogoContainer._();

  static final LogoContainer instance = LogoContainer._();

  Widget loginLogo() {
    final size = SizeContainer.loginLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _logo),
    );
  }

  Widget appBarLogo() {
    final size = SizeContainer.appbarLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _logo),
    );
  }

  Widget calendarRawLogo({required double opacity}) {
    final size = SizeContainer.calendarLogo.value;
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
    final size = SizeContainer.calendarLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _logo),
    );
  }

  Widget calendarBurntLogo() {
    final size = SizeContainer.calendarLogo.value;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _burntLogo),
    );
  }
}
