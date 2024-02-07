import 'package:fibonacci_calculator/bloc/fib_calc_bloc.dart';
import 'package:fibonacci_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fibonacci_calculator/main.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  testWidgets('Fibonacci Calculator smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  //Write widget test to check if given number is a Fibonacci number
  testWidgets('Given a number, check if the number is fibonacci',
      (WidgetTester tester) async {
    final bloc = FibCalcBloc();
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: const HomeScreen(),
        ),
      ),
    );

    // Enter valid input
    await tester.enterText(find.byType(TextFormField), '5');

    // Tap the "Is Fibonacci Number?" button
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget
    await tester.pump();

    // Verify the result is displayed
    expect(find.text("The input is a Fibonacci number"), findsOneWidget);

    // Clean up
    bloc.close();
  });

  //Write widget test to check if given number is not a Fibonacci number
  testWidgets('Given a number, check if the number is not fibonacci',
      (WidgetTester tester) async {
    final bloc = FibCalcBloc();
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: const HomeScreen(),
        ),
      ),
    );

    // Enter valid input
    await tester.enterText(find.byType(TextFormField), '4');

    // Tap the "Is Fibonacci Number?" button
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget
    await tester.pump();

    // Verify the result is displayed
    expect(find.text("The input is not a Fibonacci number"), findsOneWidget);

    // Clean up
    bloc.close();
  });
}
