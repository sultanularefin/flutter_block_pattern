import 'dart:async';

// bloc_vanilla_tut
import 'package:flutter_block_pattern/counter_event.dart';


class CounterBloc {
  int _counter = 0;


  // factory StreamController.dart file
  // // Controller for creating and adding events to a stream.


  //   this one is _counterStateController
  final _counterStateController = StreamController<int>();
  //  StreamController of type ints

  //   this one is _counterEventController
  final _counterEventController = StreamController<CounterEvent>();
  //  StreamController of type CounterEvents

  // For state, exposing only a stream which outputs data
  Stream<int> get counter => _counterStateController.stream;

  StreamSink<int> get _inCounter => _counterStateController.sink;

  // For events, exposing only a sink which is an input

  /* Sink.dart ::: doc say's ==>
   * A generic destination for data.
   *
   * Multiple data values can be put into a sink, and when no more data is
   * available, the sink should be closed.
   *
   * This is a generic interface that other data receivers can implement.
   */
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _counterEventController.stream.listen(_mapEventToState);
  }


  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;

    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}