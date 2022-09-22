import 'package:decision_helper/UI/widgets/forms/add_cons_form.dart';
import 'package:decision_helper/UI/widgets/list_item.dart';
import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/prosandcons_type_model.dart';
import 'package:decision_helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddConsScreen extends StatelessWidget {
  const AddConsScreen({Key? key}) : super(key: key);

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
              child: AddConsForm(autofocus: true),
            ),
            NextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.result);
              },
            ),
            const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  'Added cons:',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: BlocBuilder<DecisionBloc, DecisionState>(
                builder: (context, state) {
                  final consLength = state.cons.length;
                  if (consLength == 0) {
                    return const Text(
                      'There is no cons yet..',
                      style: TextStyle(fontSize: 14),
                    );
                  }
                  return ListView.builder(
                    itemCount: consLength,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (context, index) {
                      final cons = state.cons[index];
                      return Card(
                        child: ListItem(
                            title: cons.name, type: ProsAndConsType.cons),
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
