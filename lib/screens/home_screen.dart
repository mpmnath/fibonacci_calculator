//Home Scren

import 'dart:math';

import 'package:fibonacci_calculator/bloc/fib_calc_bloc.dart';
import 'package:fibonacci_calculator/bloc/fib_calc_event.dart';
import 'package:fibonacci_calculator/bloc/fib_calc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _inputController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              builder: (context, state) => Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _inputController,
                      maxLength: 19,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Input",
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a number";
                        }
                        return null;
                      },
                    ),
                    const Divider(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final int value = int.parse(_inputController.text);
                          context
                              .read<FibCalcBloc>()
                              .add(CheckFibonacciNumber(value));
                        } else {
                          setState(() {
                            _inputController.text = "";
                          });
                        }
                      },
                      child: const Text("Is Fibonacci Number?"),
                    ),
                    const Divider(
                      height: 50,
                    ),
                    _inputController.text.isNotEmpty
                        ? state is FibCalcResult
                            ? Text(
                                state.result
                                    ? "The input is a Fibonacci number"
                                    : "The input is not a Fibonacci number",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox()
                        : const Text("Please enter a number"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
