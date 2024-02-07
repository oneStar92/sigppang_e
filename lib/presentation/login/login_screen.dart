import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/common/sigppang_e_logo_builder.dart';
import 'package:sigppang_e/presentation/login/widgets/social_login_button.dart';

final class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: SigppangELogoBuilder.build(size: Sizes.socialLoginLogoSize)),
            Expanded(child: _socialLoginButtons()),
          ],
        ),
      ),
    );
  }

  Widget _socialLoginButtons() {
    final size = Sizes.socialLoginButtonSize;
    final isiOS = foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: size.height,
            width: size.width,
            child: SocialLoginButton(onTap: () {}, socialLogin: SocialLogin.google)),
        isiOS ? SizedBox(height: Sizes.defaultPaddingOfHeight * 2) : Container(),
        isiOS
            ? SizedBox(
            height: size.height,
            width: size.width,
            child: SocialLoginButton(onTap: () {}, socialLogin: SocialLogin.apple))
            : Container(),
        SizedBox(height: Sizes.defaultPaddingOfHeight),
        SizedBox(width: size.width, child: _policyText()),
      ],
    );
  }

  Widget _policyText() {
    return RichText(
      text: TextSpan(
        style: TextStyles.policyTextStyle,
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
