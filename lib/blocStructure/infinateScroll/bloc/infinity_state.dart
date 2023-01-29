part of 'infinity_bloc.dart';

abstract class InfinityState extends Equatable {
  const InfinityState();
}

class InfinityInitial extends InfinityState {
  @override
  List<Object> get props => [];
}
