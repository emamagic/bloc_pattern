import 'package:bloc_pattern/ui/counter/counter_bloc.dart';
import 'package:bloc_pattern/ui/counter/counter_state.dart';
import 'package:bloc_pattern/ui/internet/internet_cubit.dart';
import 'package:bloc_pattern/ui/router/app_router.dart';
import 'package:bloc_pattern/ui/screen/second_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/screen/firs_screen.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
              create: (context) => InternetCubit(connectivity: connectivity),
          ),
          BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(internetCubit: BlocProvider.of<InternetCubit>(context))
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: appRouter.onGenerateRoute,
        ));
  }
}
