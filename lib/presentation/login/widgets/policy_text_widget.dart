import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/text_style_constants.dart';

final class PolicyTextWidget extends StatelessWidget {
  const PolicyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyleConstants.policy.value,
        children: <TextSpan>[
          TextSpan(
            text: '이용약관',
            style: const TextStyle(
              color: Colors.blueAccent,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(
            text: '과 ',
          ),
          TextSpan(
            text: '개인정보처리방침',
            style: const TextStyle(
              color: Colors.blueAccent,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(
            text: '에 동의합니다.',
          ),
        ],
      ),
    );
  }
}
