import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate {
  onTransition(Transition transition) {
    print(transition);
  }
}
