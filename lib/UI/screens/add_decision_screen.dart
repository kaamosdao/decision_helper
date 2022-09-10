import 'package:decision_helper/UI/widgets/forms/add_decision_screen_form.dart';
import 'package:flutter/material.dart';

class AddDecisionScreen extends StatelessWidget {
  const AddDecisionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Center(
          child: AddDecisionScreenForm(),
        ),
      ),
    );
  }
}
