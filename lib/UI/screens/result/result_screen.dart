import 'package:decision_helper/UI/screens/result/widgets/body_page_view.dart';
import 'package:decision_helper/UI/screens/result/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void onPageChanged(pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  void onTap(pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
    _pageController.jumpToPage(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyPageView(
        onPageChanged: onPageChanged,
        pageController: _pageController,
      ),
      bottomNavigationBar: BottomBar(
        onTap: onTap,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
