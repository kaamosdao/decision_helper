import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final void Function() onPressed;
  const NextButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
      ),
      child: const Text('Next'),
    );
  }
}
