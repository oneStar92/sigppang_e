import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigppang_e/presentation/common/tappable_widget.dart';

enum SocialLogin { google, apple }

final class SocialLoginButton extends TappableWidget {
  final double _logoHeight = 40.h;
  final double _fontSize = 20.sp;
  final SocialLogin _socialLogin;

  SocialLoginButton({
    super.key,
    required super.onTap,
    required SocialLogin socialLogin,
  }) : _socialLogin = socialLogin;

  @override
  Widget createContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)).r,
        border: Border.all(color: Colors.grey),
        color: _socialLogin == SocialLogin.apple ? Colors.black : Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo(),
          const SizedBox(width: 24.0),
          Expanded(child: _text()),
        ],
      ),
    );
  }

  Widget _logo() {
    switch (_socialLogin) {
      case SocialLogin.google:
        return SvgPicture.asset('assets/icons/google.svg', fit: BoxFit.cover, height: _logoHeight, width: _logoHeight,);
      case SocialLogin.apple:
        return SvgPicture.asset('assets/icons/apple.svg', fit: BoxFit.cover, height: _logoHeight, width: _logoHeight,);
    }
  }

  Widget _text() {
    switch (_socialLogin) {
      case SocialLogin.google:
        return Text('Google로 로그인', style: TextStyle(fontSize: _fontSize, color: Colors.black), );
      case SocialLogin.apple:
        return Text('Apple로 로그인', style: TextStyle(fontSize: _fontSize, color: Colors.white),);
    }
  }
}
