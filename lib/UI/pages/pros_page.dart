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
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            toolbarHeight: 150,
            expandedHeight: 200,
            pinned: true,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.all(25),
              child: AddProsForm(autofocus: false),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              expandedTitleScale: 1.5,
              title: Text(
                'Your pros here',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              // background: AddProsForm(autofocus: false),
            ),
          ),
          // const SizedBox(height: 25),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocBuilder<DecisionBloc, DecisionState>(
                  builder: (context, state) {
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
