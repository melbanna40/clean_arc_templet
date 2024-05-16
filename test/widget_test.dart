// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:posts_app/layers/presentation/pages/home/home_page.dart';
//
// class MockNavigationBar extends Mock implements NavigationBar {
//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
//     super.toString();
//     return 'NavigatorStateMock';
//   }
// }
//
// void main() {
//   group('HomePage Widget', () {
//     testWidgets('Check navigation', (WidgetTester tester) async {
//       // Create mock navigation bar
//       final mockNavigationBar = MockNavigationBar();
//
//       // Check if the third tab is selected
//       expect(find.text('Posts'), findsNothing);
//       expect(find.text('Tab2'), findsNothing);
//       expect(find.text('Tab3'), findsOneWidget);
//
//       // Build the home page widget
//       await tester.pumpWidget(
//         const MaterialApp(
//           home: HomePage(),
//         ),
//       );
//
//       // Set up mock behavior for navigation bar
//       when(mockNavigationBar.onDestinationSelected!(0))
//           .thenAnswer((realInvocation) {
//         log(realInvocation.toString());
//       });
//
//       // Tap on the second tab
//       when(mockNavigationBar.onDestinationSelected!(1))
//           .thenAnswer((realInvocation) {
//         log(realInvocation.toString());
//       });
//       // Rebuild the widget after tapping
//       await tester.pump();
//
//       // Tap on the third tab
//       when(mockNavigationBar.onDestinationSelected!(2))
//           .thenAnswer((realInvocation) {
//         log(realInvocation.toString());
//       });
//       // Rebuild the widget after tapping
//       await tester.pump();
//     });
//   });
// }
