import 'package:flutter/material.dart';
import 'package:sigppang_e/common/di/logo_container.dart';
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
            Expanded(child: LogoDIContainer.instance.loginLogo()),
            Expanded(child: SocialLoginButtons()),
          ],
        ),
      ),
    );
  }
}
