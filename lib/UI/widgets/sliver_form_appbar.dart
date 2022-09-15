import 'package:flutter/material.dart';

class SliverFormAppbar extends StatelessWidget {
  final Widget form;
  const SliverFormAppbar({Key? key, required this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        expandedTitleScale: 1.5,
        background: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 25, right: 25),
            child: form,
          ),
        ),
      ),
    );
  }
}
