import 'package:flutter/material.dart';

class ProsPage extends StatefulWidget {
  const ProsPage({Key? key}) : super(key: key);

  @override
  State<ProsPage> createState() => _ProsPageState();
}

class _ProsPageState extends State<ProsPage> {
  final prosController = TextEditingController();
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
                  const Text('add new pros'),
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
                          debugPrint('Add pros: $value');
                        }
                      },
                      // autofocus: true,
                      controller: prosController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        labelText: 'Pros',
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
                    title: Text('Pros $index'),
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
