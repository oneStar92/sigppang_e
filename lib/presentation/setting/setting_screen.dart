import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/setting/widgets/icon_text_button.dart';
import 'package:sigppang_e/presentation/setting/widgets/profile_widget.dart';

final class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonSize = Sizes.settingButtonSize;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ProfileWidget(),
        SizedBox(
          height: buttonSize.height,
          width: buttonSize.width,
          child: IconTextButton(
            icon: const Icon(Icons.person, color: Colors.black),
            title: '회원가입',
            color: Colors.black,
            onTap: () {},
          ),
        ),
        SizedBox(
          height: buttonSize.height,
          width: buttonSize.width,
          child: IconTextButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            title: '로그아웃',
            color: Colors.red,
            onTap: () {},
          ),
        ),
        SizedBox(
          height: buttonSize.height,
          width: buttonSize.width,
          child: IconTextButton(
            icon: const Icon(Icons.person_remove, color: Colors.red),
            title: '회원 탈퇴',
            color: Colors.red,
            onTap: () {},
          ),
        ),
        const Spacer(),
        SizedBox(
          height: buttonSize.height,
          width: buttonSize.width,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '버전',
                  textAlign: TextAlign.left,
                  style: TextStyles.settingButtonTextStyle.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Text(
                  '1.0.0',
                  textAlign: TextAlign.right,
                  style: TextStyles.settingButtonTextStyle.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
