import 'package:equatable/equatable.dart';

class Pros extends Equatable {
  final String name;
  const Pros({required this.name});

  @override
  List<Object> get props => [name];
}