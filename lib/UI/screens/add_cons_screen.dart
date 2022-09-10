import 'package:decision_helper/UI/widgets/forms/add_cons_screen_form.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(top: 250, left: 50, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AddConsScreenForm(),
              Expanded(
                child: BlocBuilder<DecisionBloc, DecisionState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.cons.length,
                      itemBuilder: (context, index) {
                        final cons = state.cons[index];
                        return ListTile(
                          title: Text(cons.name),
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
