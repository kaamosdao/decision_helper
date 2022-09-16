import 'package:decision_helper/UI/widgets/forms/add_pros_form.dart';
import 'package:decision_helper/UI/widgets/list_item.dart';
import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/prosandcons_type_model.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 250, left: 50, right: 50),
              child: AddProsForm(autofocus: true),
            ),
            NextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cons);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'Added pros:',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Expanded(
              child: BlocBuilder<DecisionBloc, DecisionState>(
                builder: (context, state) {
                  final prosLength = state.pros.length;
                  if (prosLength == 0) {
                    return const Text(
                      'There is no pros yet..',
                      style: TextStyle(fontSize: 14),
                    );
                  }
                  return ListView.builder(
                    itemCount: prosLength,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (context, index) {
                      final pros = state.pros[index];
                      return Card(
                        child: ListItem(
                            title: pros.name, type: ProsAndConsType.pros),
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
