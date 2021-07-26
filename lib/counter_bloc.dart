import 'dart:async';

import 'package:bloc_pattern/counter_event.dart';
import 'package:bloc_pattern/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent ,CounterState> {

  CounterBloc() : super(CounterState(counter: 0));
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    print('$event');
    if (event is IncrementEvent) {
      yield state.copyWith(counter: state.counter+1);
    } else if (event is DecrementEvent) {
    yield state.copyWith(counter: state.counter-1);
    }
  }

  void increment() {
    add(IncrementEvent());
  }

  void decrement() {
    add(DecrementEvent());
  }

}