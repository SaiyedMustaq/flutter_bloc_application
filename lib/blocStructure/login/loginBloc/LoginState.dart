import 'package:equatable/equatable.dart';

import '../model/loginResponse.dart';


abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<dynamic> get props => [];
}

class InterNetState extends LoginState {
  bool? isInternetAvailable;
  @override
  List<Object> get props => [isInternetAvailable!];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<dynamic> get props => [];
}

class LoginSuccess extends LoginState {
  final ModelLoginResponse? response;
  const LoginSuccess(this.response);
  @override
  List<dynamic> get props => [response];
}

class LoginFailed extends LoginState {
  final String error;
  const LoginFailed(this.error);
  List<dynamic> get props => [error];
}

class RememberDone extends LoginState {
  final bool remember;
  const RememberDone(this.remember);
  @override
  List<dynamic> get props => [remember];
}

class SwitchChangeState extends LoginState {
  final bool switchValue;
  const SwitchChangeState(this.switchValue);
  @override
  List<dynamic> get props => [switchValue];
}

class InternetCheckState extends LoginState {
  final String message;
  const InternetCheckState(this.message);
  @override
  List<Object> get props => [message];
}
