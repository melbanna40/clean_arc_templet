import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posts_task/layers/presentation/base/app_root.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      await tester.pumpWidget(const AppRoot());
      final bottomNavigationBarFinder =
          find.byKey(const Key('bottomNavigationBar'));

      // Find the items in the bottom navigation bar
      final item1Finder = find.byKey(const Key('Posts'));
      final item2Finder = find.byKey(const Key('Tab2'));
      final item3Finder = find.byKey(const Key('Tab3'));

      // Tap on the second item

      await tester.tap(bottomNavigationBarFinder);
      await tester.pump();

      await tester.tap(item2Finder);
      await tester.pump();

      // Check if the second item is selected
      expect(find.text('Selected'), findsOneWidget);

      // Tap on the third item
      await tester.tap(item3Finder);
      await tester.pump();

      // Check if the third item is selected
      expect(find.text('Selected'), findsOneWidget);

      // Tap on the first item
      await tester.tap(item1Finder);
      await tester.pump();

      // Check if the first item is selected
      expect(find.text('Selected'), findsOneWidget);
    });
  });
}
