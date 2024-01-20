import 'package:fibonacci_calculator/bloc/fib_calc_bloc.dart';
import 'package:fibonacci_calculator/bloc/fib_calc_event.dart';
import 'package:fibonacci_calculator/bloc/fib_calc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fibonacci Calculator"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<FibCalcBloc, FibCalcState>(
              builder: (context, state) => Column(
                children: [
                  TextFormField(
                    controller: _inputController,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Input",
                    ),
                    keyboardType: TextInputType.number,
                    /* validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please input a number";
                      }
                      if (int.tryParse(value) == null) {
                        return "Please enter a valid number";
                      }
                      return null;
                    }, */
                  ),
                  const Divider(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final int value = int.parse(_inputController.text);
                      context
                          .read<FibCalcBloc>()
                          .add(CheckFibonacciNumber(value));
                      _inputController.clear();
                    },
                    child: const Text("Is Fibonacci Number?"),
                  ),
                  const Divider(
                    height: 50,
                  ),
                  state is FibCalcResult
                      ? Text(
                          state.result
                              ? "The input is a Fibonacci number"
                              : "The input is not a Fibonacci number",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
