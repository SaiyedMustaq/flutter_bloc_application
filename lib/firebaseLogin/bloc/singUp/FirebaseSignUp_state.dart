import 'package:equatable/equatable.dart';

abstract class FirebaseSignUpState extends Equatable {
  FirebaseSignUpState();
}

class FirebaseSignUpInitialState extends FirebaseSignUpState {
  FirebaseSignUpInitialState();
  @override
  List<Object?> get props => [];
}

class FirebaseSignUpLoadingState extends FirebaseSignUpState {
  @override
  List<Object?> get props => [];
}

class FirebaseSignUpSuccessState extends FirebaseSignUpState {
  final String message;
  FirebaseSignUpSuccessState({required this.message});
  @override
  String toString() => 'FirebaseSignUpSuccessState';
  @override
  List<Object?> get props => [message];
}

class ErrorFirebaseSignUpState extends FirebaseSignUpState {
  ErrorFirebaseSignUpState(this.errorMessage);

  final String errorMessage;

  @override
  String toString() => 'ErrorFirebaseSignUpState';
  @override
  List<Object> get props => [errorMessage];
}
