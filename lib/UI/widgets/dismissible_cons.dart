import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/generate_id.dart';
import 'package:decision_helper/models/cons_model.dart';
import 'package:decision_helper/models/pros_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DismissibleCons extends StatelessWidget {
  final Cons cons;

  const DismissibleCons({
    Key? key,
    required this.cons,
  }) : super(key: key);

  void onSwipeLeft(Cons cons, DecisionBloc bloc) {
    bloc.add(RemoveConsEvent(cons: cons));
  }

  void onSwipeRight(Cons cons, DecisionBloc bloc) {
    bloc.add(RemoveConsEvent(cons: cons));
    Pros newPros = Pros(name: cons.name, id: generateId());
    bloc.add(AddProsEvent(pros: newPros));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ObjectKey(cons),
        onDismissed: (direction) {
          final decisionBloc = BlocProvider.of<DecisionBloc>(context);
          switch (direction) {
            case DismissDirection.startToEnd:
              onSwipeRight(cons, decisionBloc);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Moved to Cons'),
                ),
              );
              break;
            case DismissDirection.endToStart:
              onSwipeLeft(cons, decisionBloc);
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
          color: const Color.fromARGB(31, 7, 74, 119),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Icon(
            Icons.drive_file_move_rtl_rounded,
            color: Color.fromARGB(255, 99, 217, 238),
          ),
        ),
        child: ListTile(
          title: Text(cons.name),
          minLeadingWidth: 10,
          leading: Container(
            width: 15,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.remove,
              size: 15,
              color: Color.fromARGB(255, 236, 120, 240),
            ),
          ),
        ),
      ),
    );
  }
}
