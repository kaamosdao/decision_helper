import 'package:equatable/equatable.dart';

class Cons extends Equatable {
  final String name;
  const Cons({required this.name});

  @override
  List<Object> get props => [name];
}
