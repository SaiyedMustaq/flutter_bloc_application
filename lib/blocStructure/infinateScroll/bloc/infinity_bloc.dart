import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repo/infinityRepo.dart';

part 'infinity_event.dart';
part 'infinity_state.dart';

class InfinityBloc extends Bloc<InfinityEvent, InfinityState> {
  InfinityBloc(this._repo) : super(InfinityInitial());
  final infinityRepo _repo;

  @override
  Stream<InfinityState> mapEventToState(InfinityEvent event) async* {}
}
