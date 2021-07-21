

import 'dart:async';

class CounterBloc {

  final _streamController = StreamController<int>();

  StreamSink<int> get sink => _streamController.sink;
  Stream<int> get stream => _streamController.stream;


}