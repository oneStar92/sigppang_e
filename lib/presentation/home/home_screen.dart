import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/common/base_view.dart';
import 'package:sigppang_e/presentation/home/home_view_model.dart';

final class HomeScreen extends BaseView<HomeViewModel> {
  final StatefulNavigationShell _navigationShell;

  const HomeScreen({
    super.key,
    required super.viewModel,
    required StatefulNavigationShell navigationShell,
  }) : _navigationShell = navigationShell;

  @override
  BaseViewState<HomeViewModel, HomeScreen> createState() => _HomeScreen();
}

final class _HomeScreen extends BaseViewState<HomeViewModel, HomeScreen> {
  @override
  Widget createBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Sizes.defaultAppPadding,
        child: widget._navigationShell,
      ),
    );
  }

  @override
  Widget? createBottomNavigationBar(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          child: BottomNavigationBar(
            currentIndex: widget._navigationShell.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: '홈'),
              BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: '기타')
            ],
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: false,
            onTap: (int index) => widget._navigationShell.goBranch(index),
          ),
        ),
      ),
    );
  }
}
