import 'package:flutter_bloc/flutter_bloc.dart';

class SwithCubit extends Cubit<dynamic> {
  int toggleCall = 0;
  SwithCubit() : super(false);

  void toggle(bool val) {
    print('TOGGLE CALL ${toggleCall++} $state');
    emit(val);
  }
}
