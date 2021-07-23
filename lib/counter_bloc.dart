import 'dart:async';

import 'package:bloc_pattern/counter_event.dart';
import 'package:bloc_pattern/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent ,int> {

  CounterBloc() : super(0);
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield state+1;
    } else if (event is DecrementEvent) {
    yield state-1;
    }
  }

  void increment() {
    add(IncrementEvent());
  }

  void decrement() {
    add(DecrementEvent());
  }

}