import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/policy/policy_view_model.dart';

final class PolicyScreen extends BaseView<PolicyViewModel> {
  const PolicyScreen({
    super.key,
    required super.viewModel,
  });

  @override
  BaseViewState<PolicyViewModel, PolicyScreen> createState() => _PolicyScreen();
}

final class _PolicyScreen extends BaseViewState<PolicyViewModel, PolicyScreen> {
  @override
  PreferredSizeWidget? createAppbar(BuildContext context) {
    return AppBar(title: Text(viewModel.title),);
  }

  @override
  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      padding: Sizes.defaultAppPadding,
      child: Text(viewModel.policy),
    );
  }
}
