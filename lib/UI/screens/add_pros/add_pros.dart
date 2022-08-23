import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';

class AddProsScreen extends StatelessWidget {
  const AddProsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.of(context).pushNamed(AppRoutes.cons);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add Pros screen'),
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
