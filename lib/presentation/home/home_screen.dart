import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/presentation/calendar/calendar_screen.dart';
import 'package:sigppang_e/presentation/setting/setting_screen.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final List<Widget> _pages = [const CalendarScreen(), const SettingScreen()];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Sizes.defaultAppPadding,
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: Sizes.bottomNavigationBarHeight,
          child: TabBar(
            controller: _tabController,
            padding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: false,
            tabs: const [
              Tab(icon: Icon(Icons.calendar_month)),
              Tab(icon: Icon(Icons.more_horiz)),
            ],
          ),
        ),
      ),
    );
  }
}
