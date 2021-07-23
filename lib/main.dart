import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  /**
   * we should close it by our self
   * */
  var bloc = CounterBloc();

  runApp(MaterialApp(
    routes: {
      '/': (context) => BlocProvider.value(value: bloc ,child: CounterWidget(),),
      '/second_screen': (context) => BlocProvider.value(value: bloc ,child: SecondScreen(),),
    },
  ));
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
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
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text("$state");
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
          onPressed: () => BlocProvider.of<CounterBloc>(context).increment(),
        ),
        SizedBox(
          width: 12,
        ),
        FloatingActionButton(
          child: Icon(Icons.remove),
          tooltip: "Decrement",
          onPressed: () => BlocProvider.of<CounterBloc>(context).decrement(),
        ),
        SizedBox(
          width: 12,
        ),
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/second_screen");
          },
          child: Text('second screen'),
        )
      ]),
    );
  }
}
