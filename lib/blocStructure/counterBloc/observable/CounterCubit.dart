import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<dynamic> {
  int toggleCall = 0;

  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() {
    print('INC');
    emit(state + 1);
  }

  /// Subtract 1 from the current state.
  void decrement() {
    if (state != 0) {
      emit(state - 1);
    }
  }

  void toggle(bool val) {
    print('TOGGLE CALL ${toggleCall++} $state');
    emit(val);
  }

  @override
  void onChange(Change change) {
    print('Counter Cubit onChange $change');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('Counter Cubit onError $error  $stackTrace');
    super.onError(error, stackTrace);
  }
}
