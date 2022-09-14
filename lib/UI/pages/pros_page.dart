import 'package:decision_helper/UI/widgets/dismissible_pros.dart';
import 'package:decision_helper/UI/widgets/forms/add_pros_form.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProsPage extends StatelessWidget {
  const ProsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150, left: 50, right: 50),
            child: AddProsForm(autofocus: false),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<DecisionBloc, DecisionState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.pros.length,
                    itemBuilder: (context, index) {
                      final pros = state.pros[index];
                      return DismissiblePros(pros: pros);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
