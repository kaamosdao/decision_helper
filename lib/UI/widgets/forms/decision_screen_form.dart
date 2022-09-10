import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecisionScreenForm extends StatefulWidget {
  const DecisionScreenForm({Key? key}) : super(key: key);

  @override
  State<DecisionScreenForm> createState() => _DecisionScreenFormState();
}

class _DecisionScreenFormState extends State<DecisionScreenForm> {
  final decisionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              onFieldSubmitted: (value) {
                final isValidForm = _formKey.currentState!.validate();
                final decisionBloc = context.read<DecisionBloc>();
                if (isValidForm) {
                  decisionBloc.add(AddDecisionEvent(decision: value));
                  Navigator.of(context).pushNamed(AppRoutes.pros);
                }
              },
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
