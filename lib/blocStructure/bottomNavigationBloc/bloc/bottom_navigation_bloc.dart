// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottomNavigationPageRepo/pageOneRepo.dart';
import '../bottomNavigationPageRepo/pageTwoRepo.dart';
import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final FirstPageRepository? firstPageRepository;
  final SecondPageRepository? secondPageRepository;
  int currentIndex = 0;

  BottomNavigationBloc({this.firstPageRepository, this.secondPageRepository})
      : super(const PageLoading()) {
    on<PageTapped>((event, emit) {
      currentIndex == event.index;
      emit(CurrentIndexChange(currentIndex));
    });
  }

  // Stream<BottomNavigationState> mapEventToState(
  //     BottomNavigationEvent event) async* {
  //   if (event is PageTapped) {
  //     currentIndex = event.index;
  //     yield CurrentIndexChange(currentIndex);
  //     if (event.index == 0) {
  //       yield FirstPageLoaded('First Page');
  //     }
  //     if (event.index == 1) {
  //       yield SecondPageLoaded('Second Page');
  //     }
  //   }
  // }
}
