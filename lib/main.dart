import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firs_screen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// we should close it by our self
  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(value: bloc ,child: FirstScreen(),),
        '/second_screen': (context) => BlocProvider.value(value: bloc ,child: SecondScreen(),),
      },
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}



