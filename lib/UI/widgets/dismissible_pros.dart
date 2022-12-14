import 'package:decision_helper/UI/widgets/list_item.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/generate_id.dart';
import 'package:decision_helper/models/cons_model.dart';
import 'package:decision_helper/models/pros_model.dart';
import 'package:decision_helper/models/prosandcons_type_model.dart';
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
    Cons newCons = Cons(name: pros.name, id: generateId());
    bloc.add(AddConsEvent(cons: newCons));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ObjectKey(pros),
        onDismissed: (direction) {
          final decisionBloc = BlocProvider.of<DecisionBloc>(context);
          switch (direction) {
            case DismissDirection.startToEnd:
              onSwipeRight(pros, decisionBloc);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Moved to Cons'),
                  duration: Duration(seconds: 3),
                ),
              );
              break;
            case DismissDirection.endToStart:
              onSwipeLeft(pros, decisionBloc);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Removed'),
                  duration: Duration(seconds: 3),
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
          color: const Color.fromARGB(31, 7, 74, 119),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Icon(
            Icons.drive_file_move_rounded,
            color: Color.fromARGB(255, 236, 120, 240),
          ),
        ),
        child: ListItem(title: pros.name, type: ProsAndConsType.pros),
      ),
    );
  }
}
