import 'package:fibonacci_calculator/bloc/fib_calc_event.dart';
import 'package:fibonacci_calculator/bloc/fib_calc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FibCalcBloc extends Bloc<FibCalcEvent, FibCalcState> {
  FibCalcBloc() : super(const FibCalcInitial()) {
    on<CheckFibonacciNumber>(_checkFibonacciNumberHandler);
  }
  void _checkFibonacciNumberHandler(
      CheckFibonacciNumber event, Emitter<FibCalcState> emit) {
    final isFibonacci = _checkFibonacciNumber(event.number);
    emit(FibCalcResult(isFibonacci));
  }

  Stream<FibCalcState> mapEventToState(FibCalcEvent event) async* {
    if (event is CheckFibonacciNumber) {
      final isFibonacci = _checkFibonacciNumber(event.number);
      yield FibCalcResult(isFibonacci);
    }
  }

  bool _checkFibonacciNumber(value) {
    if (value == 0 || value == 1) {
      return true;
    }
    var a = 0;
    var b = 1;
    var c = 0;
    while (c < value) {
      c = a + b;
      a = b;
      b = c;
      if (c == value) {
        return true;
      }
    }
    return false;
  }
}
