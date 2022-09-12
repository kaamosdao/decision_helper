import 'package:equatable/equatable.dart';

class Pros extends Equatable {
  final String name;
  final String id;
  const Pros({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}
