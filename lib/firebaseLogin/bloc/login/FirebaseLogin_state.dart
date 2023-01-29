import 'package:equatable/equatable.dart';

abstract class FirebaseSignInState extends Equatable {
  FirebaseSignInState();
}

class FirebaseLoginInitState extends FirebaseSignInState {
  @override
  List<Object?> get props => [];
}

class FirebaseSingInSuccessfullyState extends FirebaseSignInState {
  final String message;
  FirebaseSingInSuccessfullyState(this.message);
  @override
  List<Object?> get props => [message];
}

class FirebaseSingInErrorState extends FirebaseSignInState {
  final String message;
  FirebaseSingInErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

class FirebaseSingInFailedState extends FirebaseSignInState {
  final String message;
  FirebaseSingInFailedState(this.message);
  @override
  List<Object?> get props => [message];
}
