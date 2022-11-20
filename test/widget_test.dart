import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:munchease/main.dart';
import 'package:munchease/utils/app_boxes.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    await MunchBox().openBoxes();
    WidgetsFlutterBinding.ensureInitialized();
  });
  group('Onboarding Diet', () {
    testWidgets('Test if button shows on screen', (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(const MainApp());
          await tester.pumpAndSettle();
          final indianButton = find.text("Indian");
          expect(indianButton, findsOneWidget);
        },
      );
    });

    testWidgets('Test if clicking on the button adds to the ',
        (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(const MainApp());
          await tester.pumpAndSettle();
          final indianButton = find.text("Indian");
          expect(indianButton, findsOneWidget);
        },
      );
    });
  });
}
