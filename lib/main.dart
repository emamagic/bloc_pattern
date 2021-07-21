import 'package:bloc_pattern/counter_bloc.dart';
import 'package:flutter/material.dart';

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
  int counter = 0;
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    /**
     * when you use stream the all tree widget not called.
     * */
    print("build is called");
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: StreamBuilder(
          stream: counterBloc.stream,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("result"),
                Text("${snapshot.data}"),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
        FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: "Increment",
          onPressed: () {
            counter += 1;
            counterBloc.sink.add(counter);
          },
        ),
        SizedBox(width: 12,),
        FloatingActionButton(
          child: Icon(Icons.remove),
          tooltip: "Decrement",
          onPressed: () {
            counter -= 1;
            counterBloc.sink.add(counter);
          },
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    counterBloc.dispose();
  }

}
