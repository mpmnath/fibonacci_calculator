import 'package:equatable/equatable.dart';

abstract class FibCalcEvent extends Equatable {
  const FibCalcEvent();
}

class CheckFibonacciNumber extends FibCalcEvent {
  final int number;

  const CheckFibonacciNumber(this.number);

  @override
  List<Object> get props => [number];
}
