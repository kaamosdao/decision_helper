import 'package:flutter/material.dart';

class ConsPage extends StatefulWidget {
  const ConsPage({Key? key}) : super(key: key);

  @override
  State<ConsPage> createState() => _ConsPageState();
}

class _ConsPageState extends State<ConsPage> {
  final consController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 150, left: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('add new cons'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          debugPrint('Add cons: $value');
                        }
                      },
                      // autofocus: true,
                      controller: consController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        labelText: 'Cons',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == '' ? 'Should not be empty' : null,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Cons $index'),
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
