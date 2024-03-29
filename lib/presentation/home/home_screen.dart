import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigppang_e/common/constants/sizes.dart';

final class HomeScreen extends StatelessWidget {
  final StatefulNavigationShell _navigationShell;

  const HomeScreen({
    super.key,
    required StatefulNavigationShell navigationShell,
  }) : _navigationShell = navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Sizes.defaultAppPadding,
          child: _navigationShell,
        ),
      ),
      bottomNavigationBar: SafeArea(
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
              currentIndex: _navigationShell.currentIndex,
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
              onTap: (int index) => _navigationShell.goBranch(index),
            ),
          ),
        ),
      ),
    );
  }
}
