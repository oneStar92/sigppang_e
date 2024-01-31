import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';

final class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Guest',
      maxLines: 1,
      style: TextStyles.profileTitleTextStyle,
    );
  }
}
