import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/cons_model.dart';
import '../models/pros_model.dart';

part 'decision_event.dart';
part 'decision_state.dart';

class DecisionBloc extends Bloc<DecisionEvent, DecisionState> {
  DecisionBloc() : super(DecisionState()) {
    on<AddDecisionEvent>((event, emit) {
      emit(state.copyWith(decision: event.decision));
    });
    on<AddProsEvent>((event, emit) {
      final List<Pros> newProsList = List.from(state.pros)
        ..insert(0, event.pros);
      emit(state.copyWith(pros: newProsList));
    });
    on<AddConsEvent>((event, emit) {
      final List<Cons> newConsList = List.from(state.cons)
        ..insert(0, event.cons);
      emit(state.copyWith(cons: newConsList));
    });
  }
}
