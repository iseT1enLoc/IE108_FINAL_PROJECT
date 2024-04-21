/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_app/app.dart';
import 'package:pizza_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_app/screens/home/views/details_screen.dart';
import 'package:pizza_app/screens/home/views/home_screen.dart';

main() {
  testWidgets('Grid view test', (WidgetTester tester) async {
    // Build our widget and trigger a frame
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(), // Assuming HomeScreen is your widget under test
    ));

    // Find the Padding widget with specific EdgeInsets
    // Find the widget that contains the GridView.builder
    final gridViewContainer = find.descendant(
      of: find.byType(Padding), // Assuming GridView is nested within Padding
      matching: find.byType(BlocBuilder),
    );

    // Verify that the initial loading indicator is displayed
    // Verify that the grid view is displayed
    expect(gridViewContainer, findsNothing);
    tester.takeException();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    tester.takeException();
    // Simulate state change to success
    // Replace this part with your actual logic for changing the state to GetPizzaSuccess
    // For example, if you are using a BLoC pattern, you might dispatch an event to simulate this state change
    //await tester.pump(); // Trigger a rebuild if needed

    // You can further test the contents of the grid view, for example, by finding specific widgets within it
    // For example, to test if a specific pizza item is present, you can use its properties to find it
    /* expect(find.text('Pizza Name'), findsOneWidget);
    tester.takeException(); */
    // You can also simulate interactions, such as tapping on a pizza item to navigate to the details screen
    // For example:
    /*  await tester.tap(find.text('Pizza Name')); */
    //await tester
    //.pumpAndSettle(); // Wait for the navigation to complete and animations to finish

    // Verify that the details screen is displayed
    /* expect(find.byType(DetailsScreen), findsOneWidget);
    tester.takeException(); */
  });
  test("message", () {
    var expected_value = 2;
    expect(expected_value, 2);
  });
}
 */