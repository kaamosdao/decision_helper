import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/cons_model.dart';
import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddConsScreenForm extends StatefulWidget {
  const AddConsScreenForm({Key? key}) : super(key: key);

  @override
  State<AddConsScreenForm> createState() => _AddConsScreenFormState();
}

class _AddConsScreenFormState extends State<AddConsScreenForm> {
  final consController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FocusNode consFocusNode;

  void onPressed() {
    Navigator.of(context).pushNamed(AppRoutes.result);
  }

  void onFieldSubmitted(value) {
    final isValidForm = _formKey.currentState!.validate();
    if (isValidForm) {
      final decisionBloc = context.read<DecisionBloc>();
      decisionBloc.add(AddConsEvent(cons: Cons(name: value)));
      consController.clear();
    }
    consFocusNode.requestFocus();
  }

  @override
  void initState() {
    consFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    consFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('type your cons here'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              autofocus: true,
              focusNode: consFocusNode,
              controller: consController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Cons',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == '' ? 'Should not be empty' : null,
            ),
          ),
          NextButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
