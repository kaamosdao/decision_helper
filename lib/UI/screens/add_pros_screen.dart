import 'package:decision_helper/UI/widgets/forms/add_pros_form.dart';
import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProsScreen extends StatelessWidget {
  const AddProsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 250, left: 50, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AddProsForm(autofocus: true),
              NextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.cons);
                },
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
      ),
    );
  }
}
