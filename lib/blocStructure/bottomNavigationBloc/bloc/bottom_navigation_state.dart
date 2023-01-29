import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState() : super();
}

class CurrentIndexChange extends BottomNavigationState {
  final int index;
  CurrentIndexChange(this.index);
  @override
  String toString() => 'Current Index : $index';
  @override
  List<Object> get props => [index];
}

class PageLoading extends BottomNavigationState {
  final String? text;
  const PageLoading({this.text});
  @override
  String toString() => 'PageLoading with text: $text';
  @override
  List<Object?> get props => [text];
}

class FirstPageLoaded extends BottomNavigationState {
  final String text;

  FirstPageLoaded(this.text);

  @override
  String toString() => 'FirstPageLoaded with text: $text';

  @override
  List<Object?> get props => [text];
}

class SecondPageLoaded extends BottomNavigationState {
  final String text;

  SecondPageLoaded(this.text);

  @override
  String toString() => 'SecondPageLoaded with text: $text';

  @override
  List<Object?> get props => [text];
}
