import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/counter_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("result"),
                Text("${snapshot.data}"),
              ],
            );
          },
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
        FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Increment",
          onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
        ),
        SizedBox(width: 12,),
        FloatingActionButton(
          child: Icon(Icons.remove),
          tooltip: "Decrement",
          onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
