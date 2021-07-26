import 'package:equatable/equatable.dart';

class CounterState extends Equatable {

  final int counter;
  CounterState({required this.counter});

  @override
  List<Object?> get props => [counter];

  CounterState copyWith({
    required int counter,
  }) {
    if ((identical(counter, this.counter))) {
      return this;
    }

    return new CounterState(
      counter: counter,
    );
  }
}