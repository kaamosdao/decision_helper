import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDecisionScreenForm extends StatefulWidget {
  const AddDecisionScreenForm({Key? key}) : super(key: key);

  @override
  State<AddDecisionScreenForm> createState() => _AddDecisionScreenFormState();
}

class _AddDecisionScreenFormState extends State<AddDecisionScreenForm> {
  final decisionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void onFieldSubmitted(value) {
    final isValidForm = _formKey.currentState!.validate();
    final decisionBloc = context.read<DecisionBloc>();
    if (isValidForm) {
      decisionBloc.add(AddDecisionEvent(decision: value));
      Navigator.of(context).pushNamed(AppRoutes.pros);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('type your decision here'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 80,
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              autofocus: true,
              controller: decisionController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Decision',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == '' ? 'Should not be empty' : null,
            ),
          ),
        ],
      ),
    );
  }
}
