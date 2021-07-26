
import 'package:equatable/equatable.dart';

class MyClass extends Equatable{

  late final int a;

  MyClass({required this.a});

  @override
  List<Object?> get props => [a];
  

}