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
