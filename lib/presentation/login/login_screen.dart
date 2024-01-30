import 'package:flutter/material.dart';
import 'package:sigppang_e/presentation/common/sigppang_e_logo.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/login/widgets/social_login_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: SigppangELogo.build(size: Sizes.socialLoginLogoSize)),
            Expanded(child: SocialLoginButtons()),
          ],
        ),
      ),
    );
  }
}
