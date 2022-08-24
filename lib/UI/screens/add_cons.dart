import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:decision_helper/routes.dart';

class AddConsScreen extends StatefulWidget {
  const AddConsScreen({Key? key}) : super(key: key);

  @override
  State<AddConsScreen> createState() => _AddConsScreenState();
}

class _AddConsScreenState extends State<AddConsScreen> {
  final consController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void onPressed() {
    Navigator.of(context).pushNamed(AppRoutes.result);
  }

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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('type your cons here'),
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
                        autofocus: true,
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
                    NextButton(
                      onPressed: onPressed,
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
      ),
    );
  }
}
