import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/di/router.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/login/login_action.dart';
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
        Expanded(child: SigppangELogoBuilder.buildDoneLogo(size: Sizes.loginLogoSize)),
        Expanded(child: _socialLoginButtons()),
      ],
    );
  }

  Widget _socialLoginButtons() {
    return Padding(
      padding: Sizes.defaultHorizontalPadding * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SocialLoginButton.google(onTap: () => viewModel.act(LoginScreenAction.googleLogin())),
          Platform.isIOS ? SizedBox(height: Sizes.defaultPaddingOfHeight * 2) : Container(),
          Platform.isIOS ? SocialLoginButton.apple(onTap: () => viewModel.act(LoginScreenAction.appleLogin())) : Container(),
          SizedBox(height: Sizes.defaultPaddingOfHeight),
          _policyText(),
          const Spacer(),
          SocialLoginButton.guest(onTap: () => viewModel.act(LoginScreenAction.guestLogin())),
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
            recognizer: TapGestureRecognizer()..onTap = () => context.goNamed(termsAndConditionsScreenPath),
          ),
          const TextSpan(
            text: '과 ',
          ),
          TextSpan(
            text: '개인정보처리방침',
            style: const TextStyle(
              color: Colors.blueAccent,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.goNamed(personalInformationProcessingPolicyScreenPath),
          ),
          const TextSpan(
            text: '에 동의합니다.',
          ),
        ],
      ),
    );
  }
}
