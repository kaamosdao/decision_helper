import 'package:decision_helper/UI/widgets/forms/add_cons_form.dart';
import 'package:decision_helper/UI/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:decision_helper/main.dart' as app;

import 'package:decision_helper/UI/widgets/forms/add_pros_form.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


addItemToList(itemsCount, tester) async {
  await tester.tap(find.byType(TextField));
  for (var i = 1; i <= itemsCount; i++) {
    await tester.enterText(find.byType(TextField), 'item $i for slivers test');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }
}

hideKeyboard(elementTofind, tester) async {
  await tester.tap(elementTofind);
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Result screen with 3 pages: diagramm, pros, cons',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'buy a car');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'can travel anywhere');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'fast locomotion');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'comfort');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(NextButton));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField), 'expensive gas');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(NextButton));
    await tester.pumpAndSettle();

    // result screen, diagamm page
    expect(find.text('buy a car'), findsOneWidget);
    expect(find.byType(SfCircularChart), findsOneWidget);

    // result screen, bottom bar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add_circle_outline));
    await tester.pumpAndSettle();
    expect(find.byType(AddProsForm), findsOneWidget);
    expect(find.text('can travel anywhere'), findsOneWidget);
    expect(find.text('fast locomotion'), findsOneWidget);
    expect(find.text('comfort'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove_red_eye_outlined));
    await tester.pumpAndSettle();
    expect(find.text('buy a car'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pumpAndSettle();
    expect(find.byType(AddConsForm), findsOneWidget);
    expect(find.text('expensive gas'), findsOneWidget);

    // result screen, cons page
    await tester.enterText(find.byType(TextField), 'need a parking');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('need a parking'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'cons to be moved to pros');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('cons to be moved to pros'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'cons for deleting');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('cons for deleting'), findsOneWidget);

    //hideKeyboard
    await hideKeyboard(find.text('Decision cons'), tester);

    await tester.drag(
      find.text('cons to be moved to pros'),
      const Offset(500.0, 0.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('cons to be moved to pros'), findsNothing);
    expect(find.text('Moved to Pros'), findsOneWidget);
    await tester.drag(
      find.text('Moved to Pros'),
      const Offset(0.0, 500.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('Moved to Pros'), findsNothing);

    await tester.drag(
      find.text('cons for deleting'),
      const Offset(-500.0, 0.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('cons for deleting'), findsNothing);
    expect(find.text('Removed'), findsOneWidget);
    await tester.drag(
      find.text('Removed'),
      const Offset(0.0, 500.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('Removed'), findsNothing);

    // cons scroll test
    await addItemToList(15, tester);
    //hideKeyboard
    await hideKeyboard(find.text('Decision cons'), tester);

    await tester.dragUntilVisible(
      find.text('expensive gas'),
      find.byType(CustomScrollView),
      const Offset(0, -500),
      duration: const Duration(milliseconds: 2000),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AddConsForm), findsNothing);

    await tester.dragUntilVisible(
      find.byType(AddConsForm),
      find.byType(CustomScrollView),
      const Offset(0, 500),
      duration: const Duration(milliseconds: 2000),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AddConsForm), findsOneWidget);

    await tester.drag(
      find.text('Decision cons'),
      const Offset(500.0, 0.0),
    );
    await tester.pumpAndSettle();

    // result screen, pros page
    expect(find.byType(AddProsForm), findsOneWidget);
    expect(find.text('cons to be moved to pros'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'pros to be moved to cons');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('pros to be moved to cons'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'pros for deleting');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.text('pros for deleting'), findsOneWidget);

    //hideKeyboard
    await hideKeyboard(find.text('Decision pros'), tester);
  
    await tester.drag(
      find.text('pros to be moved to cons'),
      const Offset(500.0, 0.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('pros to be moved to cons'), findsNothing);
    expect(find.text('Moved to Cons'), findsOneWidget);
    await tester.drag(
      find.text('Moved to Cons'),
      const Offset(0.0, 500.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('Moved to Cons'), findsNothing);

    await tester.drag(
      find.text('pros for deleting'),
      const Offset(-500.0, 0.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('pros for deleting'), findsNothing);
    expect(find.text('Removed'), findsOneWidget);
    await tester.drag(
      find.text('Removed'),
      const Offset(0.0, 500.0),
    );
    await tester.pumpAndSettle();
    expect(find.text('Removed'), findsNothing);

    // pros scroll test
    await addItemToList(15, tester);
    //hideKeyboard
    await hideKeyboard(find.text('Decision pros'), tester);

    await tester.dragUntilVisible(
      find.text('can travel anywhere'),
      find.byType(CustomScrollView),
      const Offset(0, -500),
      duration: const Duration(milliseconds: 2000),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AddProsForm), findsNothing);

    await tester.dragUntilVisible(
      find.byType(AddProsForm),
      find.byType(CustomScrollView),
      const Offset(0, 500),
      duration: const Duration(milliseconds: 2000),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AddProsForm), findsOneWidget);

    await tester.drag(
      find.text('Decision pros'),
      const Offset(500.0, 0.0),
    );
    await tester.pumpAndSettle();
  });
}
