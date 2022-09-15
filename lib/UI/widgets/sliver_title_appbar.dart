import 'package:decision_helper/models/prosandcons_type_model.dart';
import 'package:flutter/material.dart';

class SliverTitleAppbar extends StatelessWidget {
  final String title;
  final ProsAndConsType type;
  const SliverTitleAppbar({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 45,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        expandedTitleScale: 1.1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              type == ProsAndConsType.pros ? Icons.add : Icons.remove,
              size: 15,
              color: type == ProsAndConsType.pros
                  ? const Color.fromARGB(255, 99, 217, 238)
                  : const Color.fromARGB(255, 236, 120, 240),
            )
          ],
        ),
      ),
    );
  }
}
