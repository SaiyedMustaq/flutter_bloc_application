import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FirebaseSignUpEvent extends Equatable {
  const FirebaseSignUpEvent();
}

class FirebaseSignUpLoadingEvent extends FirebaseSignUpEvent {
  const FirebaseSignUpLoadingEvent();
  @override
  List<Object?> get props => [];
}

class FirebaseVerifyButtonClick extends FirebaseSignUpEvent {
  final String emailMobile;
  final String password;
  FirebaseVerifyButtonClick(
      {required this.emailMobile, required this.password});
  @override
  List<Object?> get props => [emailMobile, password];
}

class FirebaseSignUpSuccessfully extends FirebaseSignUpEvent {
  final String message;
  FirebaseSignUpSuccessfully(this.message);
  @override
  List<Object?> get props => [message];
}

class FirebaseSignUpFailed extends FirebaseSignUpEvent {
  final String message;
  FirebaseSignUpFailed(this.message);
  @override
  List<Object?> get props => [message];
}
