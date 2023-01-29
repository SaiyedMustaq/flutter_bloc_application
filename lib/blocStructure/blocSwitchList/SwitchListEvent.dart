import 'package:equatable/equatable.dart';

abstract class SwitchListEvent extends Equatable {
  const SwitchListEvent([List props = const []]);
}

class SwitchChangeEvent extends SwitchListEvent {
  final bool switchValue;

  SwitchChangeEvent(this.switchValue);
  @override
  List<Object> get props => [switchValue];
}
