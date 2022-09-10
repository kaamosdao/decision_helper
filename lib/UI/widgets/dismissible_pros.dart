import 'package:decision_helper/models/pros_model.dart';
import 'package:flutter/material.dart';

class DismissiblePros extends StatelessWidget {
  const DismissiblePros({
    Key? key,
    required this.pros,
    required this.onSwipeLeft,
    required this.onSwipeRight,
  }) : super(key: key);

  final Pros pros;
  final Function onSwipeLeft;
  final Function onSwipeRight;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(pros),
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.startToEnd:
            onSwipeRight();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Moved to Cons'),
              ),
            );
            break;
          case DismissDirection.endToStart:
            onSwipeLeft();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed'),
              ),
            );
            break;
          default:
            break;
        }
      },
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 15),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 15),
        child: const Icon(
          Icons.drive_file_move_rounded,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        title: Text(pros.name),
      ),
    );
  }
}
