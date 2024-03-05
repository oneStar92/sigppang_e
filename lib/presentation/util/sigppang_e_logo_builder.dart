import 'package:flutter/material.dart';

enum ToDoState { ready, done, unfinished }

final class SigppangELogoBuilder {
  static final _rawLogo = Image.asset('assets/icons/logo_w.png');
  static final _logo = Image.asset('assets/icons/logo.png');
  static final _burntLogo = Image.asset('assets/icons/logo_b.png');

  SigppangELogoBuilder._();

  static Widget build({
    required Size size,
    ToDoState state = ToDoState.done,
  }) {
    final Image logo;
    switch (state) {
      case ToDoState.ready:
        logo = _rawLogo;
      case ToDoState.done:
        logo = _logo;
      case ToDoState.unfinished:
        logo = _burntLogo;
    }
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FittedBox(child: logo),
    );
  }
}
