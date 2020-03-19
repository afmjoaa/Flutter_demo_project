import 'package:flutter/material.dart';
import 'package:untitled1/src/blocs/simple_bloc_bloc.dart';
import 'package:untitled1/src/events/simple_bloc_events.dart';

class Joaa extends StatefulWidget {
  @override
  _JoaaState createState() => _JoaaState();
}

class _JoaaState extends State<Joaa> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Bloc"),
      ),
      body: Center(
          child: StreamBuilder(
            stream: _bloc.myCounter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => _bloc.myCounterEventSink.add(IncrementEvent()) ,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => _bloc..myCounterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }


}