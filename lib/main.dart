import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/ui/router/app_router.dart';
import 'package:bloc_pattern/ui/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/screen/firs_screen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    appRouter.dispose();
    super.dispose();
  }
}



