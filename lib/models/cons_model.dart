import 'package:equatable/equatable.dart';

class Cons extends Equatable {
  final String name;
  final String id;
  const Cons({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}
