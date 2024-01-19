import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sigppang_e/presentation/common/logo_widget.dart';
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
            Expanded(child: LogoWidget(logoHeight: 300.h, logoWidth: 300.w)),
            Expanded(child: SocialLoginButtons()),
          ],
        ),
      ),
    );
  }
}
