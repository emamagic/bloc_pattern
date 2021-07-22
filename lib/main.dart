import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

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
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<CounterBloc, int>(
        bloc: _counterBloc,
        builder: (context, int c) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("result"),
                Text("$c"),
              ],
            ),
          );
        },
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Increment",
          onPressed: () => _counterBloc.add(IncrementEvent())
        ),
        SizedBox(
          width: 12,
        ),
        FloatingActionButton(
          child: Icon(Icons.remove),
          tooltip: "Decrement",
          onPressed: () => _counterBloc.add(DecrementEvent()),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
