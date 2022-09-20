import 'package:decision_helper/UI/widgets/forms/add_cons_form.dart';
import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:decision_helper/main.dart' as app;

import 'package:decision_helper/UI/widgets/forms/add_decision_form.dart';
import 'package:decision_helper/UI/widgets/forms/add_pros_form.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('first 3 screens: add decision, add pros, add cons',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.byType(AddDecisionForm), findsOneWidget);

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('Should not be empty'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'buy a car');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.byType(AddProsForm), findsOneWidget);
    expect(find.byType(NextButton), findsOneWidget);
    expect(find.text('There is no pros yet..'), findsOneWidget);

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('Should not be empty'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'can travel');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('can travel'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'fast locomotion');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('fast locomotion'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'comfort');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('comfort'), findsOneWidget);

    await tester.tap(find.byType(NextButton));
    await tester.pumpAndSettle();
    expect(find.byType(AddConsForm), findsOneWidget);
    expect(find.byType(NextButton), findsOneWidget);
    expect(find.text('There is no cons yet..'), findsOneWidget);

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('Should not be empty'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'expensive gas');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('comfort'), findsOneWidget);

    await tester.tap(find.byType(NextButton));
    await tester.pumpAndSettle();
    expect(find.text('buy a car'), findsOneWidget);
  });
}
