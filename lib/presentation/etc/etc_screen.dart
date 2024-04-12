import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/common/custom_alert_dialog.dart';
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
                  onTap: () => _showSignInDialog(context),
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
                  onTap: () => _showLogoutDialog(context),
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
                  onTap: () => _showSignOutDialog(context),
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
        Text(
          viewModel.email,
          maxLines: 1,
          style: TextStyles.profileTitleTextStyle,
        ),
      ],
    );
  }

  _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          title: '로그아웃',
          content: '정말로 로그아웃 하시겠습니까?',
          okTitle: '로그아웃',
          okTextColor: Colors.red,
          okAction: () => viewModel.act(ETCScreenAction.logout()),
        );
      },
    );
  }

  _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          title: '회원 탈퇴',
          content: '정말로 탈퇴 하시겠습니까?\n저장된 데이터는 모두 삭제됩니다.',
          okTitle: '회원 탈퇴',
          okTextColor: Colors.red,
          okAction: () => viewModel.act(ETCScreenAction.signOut()),
        );
      },
    );
  }

  _showSignInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          title: '회원가입',
          content: '로그인 화면으로 가시겠습니까?',
          okTitle: '확인',
          okTextColor: Colors.indigoAccent,
          okAction: () => viewModel.act(ETCScreenAction.signIn()),
        );
      },
    );
  }
}
