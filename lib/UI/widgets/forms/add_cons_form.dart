import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/generate_id.dart';
import 'package:decision_helper/models/cons_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddConsForm extends StatefulWidget {
  const AddConsForm({
    Key? key,
    required this.autofocus,
  }) : super(key: key);

  final bool autofocus;

  @override
  State<AddConsForm> createState() => _AddConsFormState();
}

class _AddConsFormState extends State<AddConsForm> {
  final consController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FocusNode consFocusNode;

  void onFieldSubmitted(value) {
    final isValidForm = _formKey.currentState!.validate();
    if (isValidForm) {
      final decisionBloc = context.read<DecisionBloc>();
      decisionBloc.add(AddConsEvent(cons: Cons(name: value, id: generateId())));
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 80,
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              autofocus: widget.autofocus,
              focusNode: consFocusNode,
              controller: consController,
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Cons',
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
