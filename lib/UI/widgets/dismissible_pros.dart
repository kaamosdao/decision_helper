import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/pros_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DismissiblePros extends StatelessWidget {
  final Pros pros;

  const DismissiblePros({
    Key? key,
    required this.pros,
  }) : super(key: key);

  void onSwipeLeft(Pros pros, DecisionBloc bloc) {
    bloc.add(RemoveProsEvent(pros: pros));
  }

  void onSwipeRight(Pros pros, DecisionBloc bloc) {
    bloc.add(RemoveProsEvent(pros: pros));
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(pros),
      onDismissed: (direction) {
        final decisionBloc = BlocProvider.of<DecisionBloc>(context);
        switch (direction) {
          case DismissDirection.startToEnd:
            onSwipeRight(pros, decisionBloc);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Moved to Cons'),
              ),
            );
            break;
          case DismissDirection.endToStart:
            onSwipeLeft(pros, decisionBloc);
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
