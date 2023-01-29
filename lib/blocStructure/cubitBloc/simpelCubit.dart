import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}

abstract class SimpleState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class InitialState extends SimpleState {}

class NewState extends SimpleState {
  String newState;
  NewState({
    required this.newState,
  });
}

abstract class SimpleEvent extends Equatable {
  const SimpleEvent();
}

class SimpleEven1 extends SimpleEvent {
  @override
  List<Object?> get props => [];
}
class SimpleEven2 extends SimpleEvent {
  @override
  List<Object?> get props => [];
}
