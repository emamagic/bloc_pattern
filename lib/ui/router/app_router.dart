import 'package:bloc_pattern/counter_bloc.dart';
import 'package:bloc_pattern/ui/screen/firs_screen.dart';
import 'package:bloc_pattern/ui/screen/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
                  builder: (_) => FirstScreen(),
                );
      case "/second_screen":
        return MaterialPageRoute(
          builder: (_) => SecondScreen()
        );
      default:
        throw Exception("no route found exception");
    }
  }

}
