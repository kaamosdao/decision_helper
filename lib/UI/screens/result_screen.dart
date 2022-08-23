import 'package:flutter/material.dart';
import 'package:decision_helper/UI//widgets/body_page_view.dart';
import 'package:decision_helper/UI//widgets/bottom_bar.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
