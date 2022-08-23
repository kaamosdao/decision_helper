import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';

class AddConsScreen extends StatelessWidget {
  const AddConsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.of(context).pushNamed(AppRoutes.result);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add Cons screen'),
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
