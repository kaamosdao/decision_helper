import 'package:flutter/material.dart';
import 'package:decision_helper/UI/pages/cons_page.dart';
import 'package:decision_helper/UI/pages/pros_page.dart';
import 'package:decision_helper/UI/pages/diagram_page.dart';

class BodyPageView extends StatelessWidget {
  final void Function(int) onPageChanged;
  final PageController pageController;
  const BodyPageView({
    Key? key,
    required this.onPageChanged,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: const [
        DiagramPage(),
        ProsPage(),
        ConsPage(),
      ],
    );
  }
}
