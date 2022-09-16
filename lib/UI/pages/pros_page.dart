import 'package:decision_helper/UI/widgets/dismissible_pros.dart';
import 'package:decision_helper/UI/widgets/forms/add_pros_form.dart';
import 'package:decision_helper/UI/widgets/sliver_form_appbar.dart';
import 'package:decision_helper/UI/widgets/sliver_title_appbar.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:decision_helper/models/prosandcons_type_model.dart';
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
      child: CustomScrollView(
        slivers: [
          const SliverFormAppbar(form: AddProsForm(autofocus: false)),
          const SliverTitleAppbar(
            title: 'Decision pros',
            type: ProsAndConsType.pros,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<DecisionBloc, DecisionState>(
                  builder: (context, state) {
                    final prosLength = state.pros.length;
                    if (prosLength == 0) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'There is no pros yet..',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        ...(state.pros
                                .map((pros) => DismissiblePros(pros: pros)))
                            .toList()
                      ],
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
