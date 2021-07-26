import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/counter_event.dart';
import 'package:bloc_pattern/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => CounterBloc(),
      child: CounterWidget(),
    ),
  ));
}

class CounterWidget extends StatelessWidget {

  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("result"),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text("${state.counter}");
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Increment",
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).increment(),
        ),
        SizedBox(
          width: 12,
        ),
        FloatingActionButton(
          child: Icon(Icons.remove),
          tooltip: "Decrement",
          onPressed: () =>
              BlocProvider.of<CounterBloc>(context).decrement(),
        ),
      ]),
    );
  }
}
