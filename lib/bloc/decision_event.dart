part of 'decision_bloc.dart';

abstract class DecisionEvent extends Equatable {
  const DecisionEvent();

  @override
  List<Object> get props => [];
}

class AddDecisionEvent extends DecisionEvent {
  final String decision;
  const AddDecisionEvent({required this.decision});

  @override
  List<Object> get props => [decision];
}

class AddProsEvent extends DecisionEvent {
  final Pros pros;
  const AddProsEvent({required this.pros});

  @override
  List<Object> get props => [pros];
}

class AddConsEvent extends DecisionEvent {
  final Cons cons;
  const AddConsEvent({required this.cons});

  @override
  List<Object> get props => [cons];
}
