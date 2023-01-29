import 'package:flutter_bloc/flutter_bloc.dart';

import 'SwitchListEvent.dart';
import 'SwitchListState.dart';

class SwitchListBloc extends Bloc<SwitchListEvent, SwitchListEventState> {
  SwitchListBloc(SwitchListEventState initialState) : super(initialState);

  @override
  SwitchListEventState get inittialState => InitialSwitchState(false);

  @override
  Stream<SwitchListEventState> mapEventToState(
    SwitchListEvent event,
  ) async* {
    try {
      if (event is SwitchChangeEvent) {
        print('SwitchChangeEvent ==>>  ${event.switchValue}');
        yield SwitchChangeState(switchValue: event.switchValue);
      }
    } catch (e) {
      print('$e');
    }
  }
}
