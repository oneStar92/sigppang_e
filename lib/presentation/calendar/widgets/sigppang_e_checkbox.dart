import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/common/tappable_widget.dart';
import 'package:sigppang_e/presentation/util/sigppang_e_logo_builder.dart';

final class SigppangECheckbox extends TappableWidget {
  final bool _isChecked;
  final _checkedIcon = SigppangELogoBuilder.buildDoneLogo(size: Sizes.toDoItemLogoSize);
  final _unCheckedIcon = SigppangELogoBuilder.buildReadyLogo(size: Sizes.toDoItemLogoSize);
  
  SigppangECheckbox({
    super.key,
    required super.onTap,
    required bool isChecked,
  }) : _isChecked = isChecked;

  @override
  Widget createContent(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: _isChecked ? _checkedIcon : _unCheckedIcon,
    );
  }
}
