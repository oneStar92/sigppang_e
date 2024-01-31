import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/login/widgets/policy_text_widget.dart';
import 'package:sigppang_e/presentation/login/widgets/social_login_button.dart';

final class SocialLoginButtons extends StatelessWidget {
  final _size = Sizes.socialLoginButtonSize;

  SocialLoginButtons({super.key});

  bool get isiOS => foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: _size.height,
            width: _size.width,
            child: SocialLoginButton(onTap: () {}, socialLogin: SocialLogin.google)),
        isiOS ? SizedBox(height: Sizes.defaultPaddingOfHeight * 2) : Container(),
        isiOS
            ? SizedBox(
                height: _size.height,
                width: _size.width,
                child: SocialLoginButton(onTap: () {}, socialLogin: SocialLogin.apple))
            : Container(),
        SizedBox(height: Sizes.defaultPaddingOfHeight),
        SizedBox(width: _size.width, child: const PolicyTextWidget()),
      ],
    );
  }
}
