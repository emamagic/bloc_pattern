import 'dart:async';

import 'package:bloc_pattern/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  /// streamController can handle multi subscription by default, but
  /// you can change it by setting broadcast -->
  ///  final _counterStateController = StreamController<int>.broadcast();

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _setState => _counterStateController.sink;
  Stream<int> get getState => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get setEvent => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if(event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _setState.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }

}