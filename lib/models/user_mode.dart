import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int counter ;

  const UserModel(this.counter);

  @override
  // TODO: implement props
  List<Object?> get props => [counter];

}