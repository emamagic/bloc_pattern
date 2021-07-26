
import 'package:equatable/equatable.dart';

class MyClass extends Equatable{

  late final int a;

  MyClass({required this.a});

  @override
  List<Object?> get props => [a];

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is MyClass && runtimeType == other.runtimeType && a == other.a;
  //
  // @override
  // int get hashCode => a.hashCode;


}