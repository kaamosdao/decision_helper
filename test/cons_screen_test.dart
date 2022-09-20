import 'package:decision_helper/UI/screens/add_cons_screen.dart';
import 'package:decision_helper/UI/widgets/forms/add_cons_form.dart';
import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createConsScreen() => BlocProvider<DecisionBloc>(
      create: (context) => DecisionBloc(),
      child: MaterialApp(
        title: 'Decision Helper',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Catamaran',
        ),
        home: const AddConsScreen(),
      ),
    );

void main() {
  testWidgets('Add Cons Screen', (tester) async {
    await tester.pumpWidget(createConsScreen());

    expect(find.byType(AddConsForm), findsOneWidget);
    expect(find.byType(NextButton), findsOneWidget);
    expect(find.text('There is no cons yet..'), findsOneWidget);

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('Should not be empty'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'expensive gas');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('expensive gas'), findsOneWidget);
  });
}
