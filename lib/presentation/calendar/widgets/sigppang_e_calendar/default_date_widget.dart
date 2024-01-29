import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/text_style_constants.dart';

final class DefaultDate extends StatelessWidget {
  final Widget _logo;
  final String _day;

  const DefaultDate({
    super.key,
    required Widget logo,
    required String day,
  })  : _logo = logo,
        _day = day;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _logo,
        Expanded(
          child: Text(
            _day,
            textAlign: TextAlign.center,
            style: TextStyleConstants.day.value,
          ),
        ),
      ],
    );
  }
}
