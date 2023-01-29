import 'package:equatable/equatable.dart';

abstract class SwitchListEventState extends Equatable {
  const SwitchListEventState();
}

class InitialSwitchState extends SwitchListEventState {
  final bool switchInitValue;

  InitialSwitchState(this.switchInitValue);
  @override
  List<Object?> get props => [switchInitValue];
}

class SwitchChangeState extends SwitchListEventState {
  final bool switchValue;
  const SwitchChangeState({required this.switchValue});
  @override
  List<dynamic> get props => [switchValue];
}
