import 'package:decision_helper/models/cons_model.dart';
import 'package:flutter/material.dart';

class DismissibleCons extends StatelessWidget {
  const DismissibleCons({
    Key? key,
    required this.cons,
    required this.onSwipeLeft,
    required this.onSwipeRight,
  }) : super(key: key);

  final Cons cons;
  final Function onSwipeLeft;
  final Function onSwipeRight;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(cons),
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
          Icons.drive_file_move_rtl_rounded,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        title: Text(cons.name),
      ),
    );
  }
}
