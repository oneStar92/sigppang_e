import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/util/sigppang_e_logo_builder.dart';
import 'package:sigppang_e/presentation/login/login_view_model.dart';
import 'package:sigppang_e/presentation/login/widgets/social_login_button.dart';

final class LoginScreen extends BaseView<LoginViewModel> {
  const LoginScreen({
    super.key,
    required super.viewModel,
  });

  @override
  BaseViewState<LoginViewModel, LoginScreen> createState() => _LoginScreenState();
}

final class _LoginScreenState extends BaseViewState<LoginViewModel, LoginScreen> {
  @override
  Widget createBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: SigppangELogoBuilder.buildDoneLogo(size: Sizes.socialLoginLogoSize)),
        Expanded(child: _socialLoginButtons()),
      ],
    );
  }

  Widget _socialLoginButtons() {
    final size = Sizes.socialLoginButtonSize;
    final isiOS = foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;
    return Padding(
      padding: Sizes.defaultHorizontalPadding * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height,
            child: SocialLoginButton(
              onTap: () => viewModel.act(LoginScreenAction.googleLogin()),
              socialLogin: SocialLogin.google,
            ),
          ),
          isiOS ? SizedBox(height: Sizes.defaultPaddingOfHeight * 2) : Container(),
          isiOS
              ? SizedBox(
                  height: size.height,
                  child: SocialLoginButton(
                    onTap: () => viewModel.act(LoginScreenAction.appleLogin()),
                    socialLogin: SocialLogin.apple,
                  ),
                )
              : Container(),
          SizedBox(height: Sizes.defaultPaddingOfHeight),
          _policyText(),
        ],
      ),
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
