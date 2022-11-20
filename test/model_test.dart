// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:munchease/controllers/onboarding_cuisine_controller.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/utils/app_boxes.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    await MunchBox().openBoxes();
  });
  group('Onboarding Diet', () {
    test('Onboarding Diet Integration', () async {
      // Build our app and trigger a frame.
      // await tester.pumpWidget(const MainApp());

      OnboardingDietController d = OnboardingDietController();
      d.onInit();
      TestDiet().putDiet(0);
      // Verify that our counter starts at 0.
      expect(d.selectedIndex, 0);
      d.changeIndex(1);
      expect(d.selectedIndex, 1);
    });
  });

  group('Onboarding Cuisine', () {
    test('Onboarding Cuisine', () async {
      // Build our app and trigger a frame.
      // await tester.pumpWidget(const MainApp());
      var d = OnboardingCuisineController();
      d.onInit();
      TestCuisine().testPut(List<String>.empty());
      // Verify that our counter starts at 0.
      expect(d.selectedCuisines, []);

      d.handleMunchchip(cuisine: "Indian", isSelected: true);

      expect(d.selectedCuisines[0], "Indian");
    });
  });
}
