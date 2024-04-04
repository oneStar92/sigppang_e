import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/domain/model/daily_status.dart';

final class SigppangELogoBuilder {
  static final _readyLogo = Image.asset('assets/icons/logo_w.png');
  static final _doneLogo = Image.asset('assets/icons/logo.png');
  static final _unfinishedLogo = Image.asset('assets/icons/logo_b.png');

  SigppangELogoBuilder._();

  static Widget buildCalendarDayLogo({DailyStatus? status}) {
    final size = Sizes.calendarDayLogoSize;
    switch (status) {
      case Ready():
        return SizedBox(
          height: size.height,
          width: size.width,
          child: FittedBox(child: _readyLogo),
        );
      case InProgress():
        return ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Colors.white, Colors.transparent],
            stops: [status.progress, 1.0],
          ).createShader(rect),
          blendMode: BlendMode.softLight,
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: FittedBox(child: _doneLogo),
          ),
        );
      case Done():
        return SizedBox(
          height: size.height,
          width: size.width,
          child: FittedBox(child: _doneLogo),
        );
      case Unfinished():
        return SizedBox(
          height: size.height,
          width: size.width,
          child: FittedBox(child: _unfinishedLogo),
        );
      case null:
        return SizedBox(
          height: size.height,
          width: size.width,
          child: FittedBox(child: _readyLogo),
        );
    }
  }

  static Widget buildReadyLogo({required Size size}) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _readyLogo),
    );
  }

  static Widget buildDoneLogo({required Size size}) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _doneLogo),
    );
  }

  static Widget buildUnfinishedLogo({required Size size}) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: _unfinishedLogo),
    );
  }
}
