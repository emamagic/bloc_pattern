import 'dart:async';

import 'package:bloc_pattern/constants/enums.dart';
import 'package:bloc_pattern/ui/counter/counter_event.dart';
import 'package:bloc_pattern/ui/counter/counter_state.dart';
import 'package:bloc_pattern/ui/internet/internet_cubit.dart';
import 'package:bloc_pattern/ui/internet/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> with HydratedMixin{

  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield state + 1;
    } else if (event is DecrementEvent) {
      yield state - 1;
    }
  }

  void increment() {
    add(IncrementEvent());
  }

  void decrement() {
    add(DecrementEvent());
  }


  void dispose() {
    close();
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}
