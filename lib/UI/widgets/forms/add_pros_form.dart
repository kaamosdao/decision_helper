import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/generate_id.dart';
import 'package:decision_helper/models/pros_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProsForm extends StatefulWidget {
  const AddProsForm({
    Key? key,
    required this.autofocus,
  }) : super(key: key);

  final bool autofocus;

  @override
  State<AddProsForm> createState() => _AddProsFormState();
}

class _AddProsFormState extends State<AddProsForm> {
  final prosController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FocusNode prosFocusNode;

  void onFieldSubmitted(value) {
    final isValidForm = _formKey.currentState!.validate();
    if (isValidForm) {
      final decisionBloc = context.read<DecisionBloc>();
      decisionBloc.add(AddProsEvent(pros: Pros(name: value, id: generateId())));
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              autofocus: widget.autofocus,
              focusNode: prosFocusNode,
              controller: prosController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Pros',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              validator: (value) => value == '' ? 'Should not be empty' : null,
            ),
          ),
        ],
      ),
    );
  }
}
