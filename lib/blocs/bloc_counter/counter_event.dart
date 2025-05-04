

import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {}

class Increment extends CounterEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Decrement extends CounterEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
