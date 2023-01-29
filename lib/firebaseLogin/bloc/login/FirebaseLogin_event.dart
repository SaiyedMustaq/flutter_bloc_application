import 'package:equatable/equatable.dart';

abstract class FirebaseSignInEvent extends Equatable {
  const FirebaseSignInEvent();
}

class FirebaseLoginButtonEvent extends FirebaseSignInEvent {
  final String emailMobile;
  final String password;

  const FirebaseLoginButtonEvent({required this.emailMobile, required this.password});
  @override
  List<Object?> get props => [emailMobile,password];
}
