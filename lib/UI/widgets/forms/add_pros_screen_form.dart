import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/pros_model.dart';
import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProsScreenForm extends StatefulWidget {
  const AddProsScreenForm({Key? key}) : super(key: key);

  @override
  State<AddProsScreenForm> createState() => _AddProsScreenFormState();
}

class _AddProsScreenFormState extends State<AddProsScreenForm> {
  final prosController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FocusNode prosFocusNode;

  void onPressed() {
    Navigator.of(context).pushNamed(AppRoutes.cons);
  }

  void onFieldSubmitted(value) {
    final isValidForm = _formKey.currentState!.validate();
    if (isValidForm) {
      final decisionBloc = context.read<DecisionBloc>();
      decisionBloc.add(AddProsEvent(pros: Pros(name: value)));
      prosController.clear();
    }
    prosFocusNode.requestFocus();
  }

  @override
  void initState() {
    prosFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    prosFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('type your pros here'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              autofocus: true,
              focusNode: prosFocusNode,
              controller: prosController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Pros',
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
