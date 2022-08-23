import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';

class AddDecisionScreen extends StatelessWidget {
  const AddDecisionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.of(context).pushNamed(AppRoutes.pros);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add Decision screen'),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
