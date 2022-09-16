import 'package:decision_helper/models/prosandcons_type_model.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final ProsAndConsType type;
  const ListItem({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      minLeadingWidth: 10,
      leading: Container(
        width: 15,
        alignment: Alignment.centerLeft,
        child: Icon(
          type == ProsAndConsType.pros ? Icons.add : Icons.remove,
          size: 15,
          color: type == ProsAndConsType.pros
              ? const Color.fromARGB(255, 99, 217, 238)
              : const Color.fromARGB(255, 236, 120, 240),
        ),
      ),
    );
  }
}
