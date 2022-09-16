import 'package:decision_helper/UI/widgets/dismissible_cons.dart';
import 'package:decision_helper/UI/widgets/forms/add_cons_form.dart';
import 'package:decision_helper/UI/widgets/sliver_form_appbar.dart';
import 'package:decision_helper/UI/widgets/sliver_title_appbar.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/prosandcons_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsPage extends StatelessWidget {
  const ConsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CustomScrollView(
        slivers: [
          const SliverFormAppbar(form: AddConsForm(autofocus: false)),
          const SliverTitleAppbar(
            title: 'Decision cons',
            type: ProsAndConsType.cons,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<DecisionBloc, DecisionState>(
                  builder: (context, state) {
                    final consLength = state.cons.length;
                    if (consLength == 0) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'There is no cons yet..',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        ...(state.cons
                                .map((cons) => DismissibleCons(cons: cons)))
                            .toList()
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
