import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/common/tappable_widget.dart';

final class SocialLoginButton extends TappableWidget {
  final Color _backgroundColor;
  final Color _borderColor;
  final Widget? _logo;
  final String _text;
  final TextStyle _textStyle;
  final TextAlign _textAlign;

  const SocialLoginButton({
    super.key,
    required super.onTap,
    required Color backgroundColor,
    Color borderColor = Colors.grey,
    Widget? logo,
    required String text,
    required TextStyle textStyle,
    TextAlign textAlign = TextAlign.left,
  })  : _backgroundColor = backgroundColor, _borderColor = borderColor,
        _logo = logo,
        _text = text,
        _textStyle = textStyle,
        _textAlign = textAlign;

  @override
  Widget createContent(BuildContext context) {
    final size = Sizes.socialLoginButtonSize;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: Sizes.defaultBorderRadius,
        border: Border.all(color: _borderColor),
        color: _backgroundColor,
      ),
      padding: Sizes.defaultHorizontalPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo ?? Container(),
          _logo != null ? const SizedBox(width: 24.0) : Container(),
          Expanded(child: Text(_text, style: _textStyle, textAlign: _textAlign)),
        ],
      ),
    );
  }

  factory SocialLoginButton.apple({required Function() onTap}) => SocialLoginButton(
        onTap: onTap,
        backgroundColor: Colors.black,
        logo: SvgPicture.asset(
          'assets/icons/apple.svg',
          fit: BoxFit.cover,
          height: Sizes.socialLoginLogoSize.height,
          width: Sizes.socialLoginLogoSize.width,
        ),
        text: 'Apple로 로그인',
        textStyle: TextStyles.socialLoginButtonTextStyle.copyWith(color: Colors.white),
      );

  factory SocialLoginButton.google({required Function() onTap}) => SocialLoginButton(
        onTap: onTap,
        backgroundColor: Colors.white,
        logo: SvgPicture.asset(
          'assets/icons/google.svg',
          fit: BoxFit.cover,
          height: Sizes.socialLoginLogoSize.height,
          width: Sizes.socialLoginLogoSize.width,
        ),
        text: 'Google로 로그인',
        textStyle: TextStyles.socialLoginButtonTextStyle.copyWith(color: Colors.black),
      );

  factory SocialLoginButton.guest({required Function() onTap}) => SocialLoginButton(
        onTap: onTap,
        backgroundColor: Colors.white,
        borderColor: Colors.transparent,
        text: '둘러보기',
        textStyle: TextStyles.socialLoginButtonTextStyle.copyWith(color: Colors.black),
        textAlign: TextAlign.center,
      );
}
