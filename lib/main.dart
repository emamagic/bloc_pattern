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
  final _counterBloc = ;

  @override
  Widget build(BuildContext context) {
    //  final _bloc = BlocProvider.of<CounterBloc>(context);
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: CounterWidget(widget: widget),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class CounterWidget extends StatelessWidget {
  final Home widget;

  const CounterWidget({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<CounterBloc, int>(
        bloc: BlocProvider.of<CounterBloc>(context),
        builder: (BuildContext context, int counter) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("result"),
                Text("$counter"),
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
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).add(IncrementEvent())),
        SizedBox(
          width: 12,
        ),
        FloatingActionButton(
          child: Icon(Icons.remove),
          tooltip: "Decrement",
          onPressed: () =>
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent()),
        ),
      ]),
    );
  }
}
