import 'package:flutter/material.dart';

final class SigppangELogoBuilder {
  static final _readyLogo = Image.asset('assets/icons/logo_w.png');
  static final _doneLogo = Image.asset('assets/icons/logo.png');
  static final _unfinishedLogo = Image.asset('assets/icons/logo_b.png');

  SigppangELogoBuilder._();

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
