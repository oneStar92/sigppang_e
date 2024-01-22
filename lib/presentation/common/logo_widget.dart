import 'dart:math';

import 'package:flutter/material.dart';

enum Logo { white, basic, black }

final class LogoWidget extends StatelessWidget {
  static final Image _whiteLogo = Image.asset('assets/icons/logo_w.png');
  static final Image _basicLogo = Image.asset('assets/icons/logo.png');
  static final Image _blackLogo = Image.asset('assets/icons/logo_b.png');

  final Logo _logo;
  final double _logoHeight;
  final double _logoWidth;

  Image get _logoImage {
    switch (_logo) {
      case Logo.white:
        return _whiteLogo;
      case Logo.basic:
        return _basicLogo;
      case Logo.black:
        return _blackLogo;
    }
  }

  const LogoWidget({
    super.key,
    Logo logo = Logo.basic,
    required double logoHeight,
    required double logoWidth,
  })  : _logo = logo,
        _logoHeight = logoHeight,
        _logoWidth = logoWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            height: min(constraints.maxHeight, _logoHeight),
            width: min(constraints.maxWidth, _logoWidth),
            child: FittedBox(
              child: _logoImage,
            ),
          ),
        );
      },
    );
  }
}
