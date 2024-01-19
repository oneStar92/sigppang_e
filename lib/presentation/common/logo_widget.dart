import 'dart:math';

import 'package:flutter/material.dart';

final class LogoWidget extends StatelessWidget {
  final double _logoHeight;
  final double _logoWidth;

  const LogoWidget({
    super.key,
    required double logoHeight,
    required double logoWidth,
  })  : _logoHeight = logoHeight,
        _logoWidth = logoWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SizedBox(
            height: min(constraints.maxHeight, _logoHeight),
            width: min(constraints.maxWidth, _logoWidth),
            child: const FittedBox(
              child: Icon(Icons.breakfast_dining),
            ),
          ),
        );
      },
    );
  }
}
