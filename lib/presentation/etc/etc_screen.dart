import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/etc/etc_view_model.dart';
import 'package:sigppang_e/presentation/etc/widgets/icon_text_button.dart';

final class ETCScreen extends BaseView<ETCViewModel> {
  const ETCScreen({
    super.key,
    required super.viewModel,
  });

  @override
  BaseViewState<ETCViewModel, ETCScreen> createState() => _ETCScreenState();
}

final class _ETCScreenState extends BaseViewState<ETCViewModel, ETCScreen> {
  @override
  Widget createBody(BuildContext context) {
    final buttonSize = Sizes.settingButtonSize;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildProfile(),
        viewModel.isGuest
            ? SizedBox(
                height: buttonSize.height,
                width: buttonSize.width,
                child: IconTextButton(
                  icon: const Icon(Icons.person, color: Colors.black),
                  title: '회원가입',
                  color: Colors.black,
                  onTap: () {},
                ),
              )
            : Container(),
        viewModel.isGuest
            ? Container()
            : SizedBox(
                height: buttonSize.height,
                width: buttonSize.width,
                child: IconTextButton(
                  icon: const Icon(Icons.logout, color: Colors.red),
                  title: '로그아웃',
                  color: Colors.red,
                  onTap: () => viewModel.act(ETCScreenAction.logout()),
                ),
              ),
        viewModel.isGuest
            ? Container()
            : SizedBox(
                height: buttonSize.height,
                width: buttonSize.width,
                child: IconTextButton(
                  icon: const Icon(Icons.person_remove, color: Colors.red),
                  title: '회원 탈퇴',
                  color: Colors.red,
                  onTap: () => viewModel.act(ETCScreenAction.signOut()),
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

  Widget _buildProfile() {
    return Row(
      children: [
        Icon(Icons.person),
        Text(
          viewModel.email,
          maxLines: 1,
          style: TextStyles.profileTitleTextStyle,
        ),
      ],
    );
  }
}
