import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';

final class NowDate extends StatelessWidget {
  final Widget _logo;
  final String _day;

  const NowDate({
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
          child: Container(
            decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: Center(
              child: Text(
                _day,
                textAlign: TextAlign.center,
                style: TextStyles.nowTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
