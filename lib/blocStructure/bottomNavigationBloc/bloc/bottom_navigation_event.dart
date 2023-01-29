import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
  @override
  List<Object?> get props => [];
}

class AppStarted extends BottomNavigationEvent {
  @override
  String toString() => 'AppStarted';
}

class PageTapped extends BottomNavigationEvent {
  final int index;
  const PageTapped(this.index);
  @override
  String toString() => 'PageTapped: $index';
  @override
  List<Object?> get props => [index];
}
