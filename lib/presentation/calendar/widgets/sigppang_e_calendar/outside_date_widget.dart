import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';

final class OutsideDateWidget extends StatelessWidget {
  final Widget _logo;
  final String _day;

  const OutsideDateWidget({
    super.key,
    required Widget logo,
    required String day,
  })  : _logo = logo,
        _day = day;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _logo,
          Expanded(
            child: Text(
              _day,
              textAlign: TextAlign.center,
              style: TextStyles.dayTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
