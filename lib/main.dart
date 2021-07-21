import 'dart:async';
import 'package:bloc_pattern/timer_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
        create: (context) => TimerInfo(),
        child: Home()),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      /**
       * if you use Provider of side of widget tree, you should set listen to false other wise else
       * */
      var timeInfo = Provider.of<TimerInfo>(context, listen: false);
      timeInfo.updateRemainingTime();
    });
    super.initState();
  }

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
          Consumer<TimerInfo>(
              builder: (context, data, child) {
                  return Text("${data.getRemainingTime()}");
              },
          ),
        ],
      )),
    );
  }
}
