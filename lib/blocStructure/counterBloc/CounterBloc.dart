import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterEvent.dart';
import 'CounterState.dart';

class SwitchModel {
  bool switchValue;
  SwitchModel(this.switchValue);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(CounterState(counter: 0)) {
    on<IncrementEvent>(
        (event, emit) => emit(CounterState(counter: state.counter + 1)));
    on<DecrementEvent>((event, emit) {
      if (state.counter == 0) {
        return;
      }
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
