import 'package:flutter/material.dart';
import 'package:sigppang_e/presentation/common/sigppang_e_logo.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/common/tappable_widget.dart';

final class SigppangECheckbox extends TappableWidget {
  const SigppangECheckbox({
    super.key,
    required super.onTap,
  });

  @override
  Widget createContent(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: SigppangELogo.build(size: Sizes.toDoItemLogoSize),
    );
  }
}
