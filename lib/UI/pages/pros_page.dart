import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/pros_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProsPage extends StatefulWidget {
  const ProsPage({Key? key}) : super(key: key);

  @override
  State<ProsPage> createState() => _ProsPageState();
}

class _ProsPageState extends State<ProsPage> {
  final prosController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late FocusNode prosFocusNode;

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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 150, left: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('add new pros'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: TextFormField(
                      onFieldSubmitted: onFieldSubmitted,
                      // autofocus: true,
                      focusNode: prosFocusNode,
                      controller: prosController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        labelText: 'Pros',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == '' ? 'Should not be empty' : null,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<DecisionBloc, DecisionState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.pros.length,
                    itemBuilder: (context, index) {
                      final pros = state.pros[index];
                      return ListTile(
                        title: Text(pros.name),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
