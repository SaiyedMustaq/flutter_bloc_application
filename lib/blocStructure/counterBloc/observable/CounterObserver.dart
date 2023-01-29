import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
//ANCHOR In this case, we're only overriding onChange to see all state changes that occur.
//ANCHOR Note: onChange works the same way for both Bloc and Cubit instances