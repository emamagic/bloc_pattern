import 'package:bloc_pattern/constants/enums.dart';
import 'package:bloc_pattern/ui/internet/internet_cubit.dart';
import 'package:bloc_pattern/ui/internet/internet_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter/counter_bloc.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected && state.connectionType == ConnectionType.Wifi) {
                    return Text('wifi');
                  } else if (state is InternetConnected && state.connectionType == ConnectionType.Mobile) {
                    return Text('mobile');
                  } else if (state is InternetDisconnected) {
                    return Text('disconnect');
                  }
                  return CircularProgressIndicator();
                }
            ),
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