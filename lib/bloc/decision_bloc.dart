import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'decision_event.dart';
part 'decision_state.dart';

class DecisionBloc extends Bloc<DecisionEvent, DecisionState> {
  DecisionBloc() : super(DecisionState()) {
    on<AddDecisionEvent>((event, emit) {
      emit(DecisionState(decision: event.decision));
    });
  }
}
