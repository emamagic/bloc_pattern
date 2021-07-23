import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/ui/screen/firs_screen.dart';
import 'package:bloc_pattern/ui/screen/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final bloc = CounterBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: bloc,
                  child: FirstScreen(),
                ));
        break;
      case "/second_screen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: bloc,
                  child: SecondScreen(),
                ));
        break;
      default:
        throw Exception("no route found exception");
    }
  }

  void dispose() {
    bloc.close();
  }
}
