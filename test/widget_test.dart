// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stringcalulatorapp/main.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify if the app starts correctly with the title
    expect(find.text('String Number Addition'), findsOneWidget);

    // Find the TextField and enter some values
    final textField = find.byType(TextField);
    await tester.enterText(textField, '1,2,3');

    // Calculate Sum' button
    final calculateButton = find.text('Calculate Sum');
    await tester.tap(calculateButton);

    await tester.pump();

    // Verify the sum text is displayed
    expect(find.text('Sum: 6'), findsOneWidget);
  });
}
