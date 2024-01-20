import 'package:equatable/equatable.dart';

abstract class FibCalcState extends Equatable {
  const FibCalcState();

  @override
  List<Object> get props => [];
}

class FibCalcInitial extends FibCalcState {
  const FibCalcInitial();
}

class FibCalcResult extends FibCalcState {
  final bool result;

  const FibCalcResult(this.result);

  @override
  List<Object> get props => [result];
}
