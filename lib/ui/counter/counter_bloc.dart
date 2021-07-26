import 'dart:async';

import 'package:bloc_pattern/constants/enums.dart';
import 'package:bloc_pattern/ui/counter/counter_event.dart';
import 'package:bloc_pattern/ui/counter/counter_state.dart';
import 'package:bloc_pattern/ui/internet/internet_cubit.dart';
import 'package:bloc_pattern/ui/internet/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  late final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterBloc({required this.internetCubit}) : super(0) {
    monitorInternetCubit();
  }

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

  void monitorInternetCubit() {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void dispose() {
    close();
  }

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
