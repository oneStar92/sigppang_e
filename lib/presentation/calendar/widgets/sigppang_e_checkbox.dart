import 'package:flutter/material.dart';
import 'package:sigppang_e/presentation/common/tappable_widget.dart';

final class SigppangECheckbox extends TappableWidget {
  final Widget _child;
  const SigppangECheckbox({
    super.key,
    required super.onTap,
    required Widget child,
  }) : _child = child;

  @override
  Widget createContent(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: _child,
    );
  }
}
