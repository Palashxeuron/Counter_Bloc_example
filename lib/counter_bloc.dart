import 'dart:async';

// enum CounterAction {Inc,Dec,Res}

class CounterBloc
{
  int _counter = 0;
  final _counterStreamController = StreamController<String>();

  StreamSink<String> get counterSink => _counterStreamController.sink;
  Stream<String> get counterStream => _counterStreamController.stream;

  final _eventStreamController = StreamController<String>();

  StreamSink<String> get eventSink => _eventStreamController.sink;
  Stream<String> get eventStream => _eventStreamController.stream;

  //constructor
  CounterBloc() {
    //initialize counter whenever a counterBloc is created
    counterStream.listen((event){
      if (event == 'increment') {_counter++;}
      else if (event == 'decrement') {_counter--;}
      else if (event == 'reset') {_counter=0;}

      eventSink.add('$_counter');
    });
  }
}