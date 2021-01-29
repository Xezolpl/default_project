import 'package:default_project/presentation/common/widgets/app_bar.dart';
import 'package:default_project/presentation/common/widgets/scaffold.dart';
import 'package:flutter/material.dart';

const INIT_TAB_INDEX = 1;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabPages = [];

  var bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      label: "Main page",
    ),
  ];

  int _currentTabIndex = INIT_TAB_INDEX;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: INIT_TAB_INDEX, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: _buildAppBar(),
      bottomNavBar: _buildBottomNavigationBar(),
      body: PageView(
        children: tabPages,
        onPageChanged: _onPageChanged,
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      this._currentTabIndex = page;
    });
  }

  void _onTabTapped(int index) {
    this._pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.easeInOut,
        );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: bottomNavItems,
      type: BottomNavigationBarType.fixed,
      onTap: _onTabTapped,
      currentIndex: _currentTabIndex,
    );
  }

  AppBar _buildAppBar() {
    switch (_currentTabIndex) {
      default:
        return AppBarBuilder.buildAppBar(
          "Title",
          actions: [],
        );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
