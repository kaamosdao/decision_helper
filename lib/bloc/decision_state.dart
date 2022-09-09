part of 'decision_bloc.dart';

class DecisionState {
  final String decision;
  List<Cons> cons;
  List<Pros> pros;
  DecisionState({
    this.decision = '',
    this.cons = const [],
    this.pros = const [],
  });

  DecisionState copyWith({
    String? decision,
    List<Cons>? cons,
    List<Pros>? pros,
  }) {
    return DecisionState(
      decision: decision ?? this.decision,
      cons: cons ?? this.cons,
      pros: pros ?? this.pros,
    );
  }
}
