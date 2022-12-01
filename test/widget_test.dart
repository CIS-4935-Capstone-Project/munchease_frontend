import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';
import 'package:hive_test/hive_test.dart';
import 'package:munchease/main.dart';
import 'package:munchease/screens/onboarding_diet_screen.dart';
import 'package:munchease/utils/app_bindings.dart';
import 'package:munchease/utils/app_boxes.dart';
import 'package:munchease/widgets/me_filterchip.dart';
import 'package:munchease/widgets/me_text_button.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    await MunchBox().openBoxes();
    WidgetsFlutterBinding.ensureInitialized();
  });
  group('Onboarding Cuisine', () {
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

    testWidgets(
        'Test if clicking on the button changes the state of the button',
        (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(const MainApp());
          await tester.pumpAndSettle();
          var indianButton = find.widgetWithText(MunchChip, "Indian");
          await tester.tap(indianButton);
          await tester.pumpAndSettle();
          var munchChipWidget =
              indianButton.evaluate().first.widget as MunchChip;
          expect(munchChipWidget.selected, true);
        },
      );
    });
  });

  group('Onboarding Diet', () {
    testWidgets('Test if button shows on screen', (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(GetMaterialApp(
              initialBinding: AppBinding(), home: OnboardingDietScreen()));
          await tester.pumpAndSettle();
          final indianButton = find.text("None");
          expect(indianButton, findsOneWidget);
        },
      );
    });

    testWidgets(
        'Test if clicking on the button changes the state of the button',
        (WidgetTester tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(GetMaterialApp(
              initialBinding: AppBinding(), home: OnboardingDietScreen()));
          await tester.pumpAndSettle();
          var noneButton = find.widgetWithText(MunchChip, "None");
          await tester.pumpAndSettle();
          await tester.tap(noneButton);
          await tester.pumpAndSettle();
          var munchChipWidget = noneButton.evaluate().first.widget as MunchChip;
          expect(munchChipWidget.selected, true);
        },
      );
    });
  });
}
