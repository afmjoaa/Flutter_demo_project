
import 'dart:async';
import 'package:untitled1/src/events/simple_bloc_events.dart';

class CounterBloc {
  int _myCounter = 0;

  //TODO StateController
  final _myCounterStateController = StreamController<int>();
  StreamSink<int> get _inMyCounter => _myCounterStateController.sink;
  //exposed integer output
  Stream<int> get myCounter => _myCounterStateController.stream;

  //TODO EventController
  final _myCounterEventController = StreamController<CounterEvent>();
  //exposed event input
  Sink<CounterEvent> get myCounterEventSink => _myCounterEventController.sink;


  CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    //giving just function reference
    _myCounterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _myCounter++;
    else
      _myCounter--;
    _inMyCounter.add(_myCounter);
  }

  void dispose() {
    _myCounterEventController.close();
    _myCounterStateController.close();
  }
}