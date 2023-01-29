abstract class LoginEvent {
  const LoginEvent([List props = const []]) : super();
}

class InternetCheckEvent extends LoginEvent {
  final bool? checkInternet;
  final String? message;
  InternetCheckEvent({this.checkInternet, this.message});
  List<Object> get props => [checkInternet!, message!];
}

class LoginButtonClickEvent extends LoginEvent {
  final String name;
  final String password;
  final String url;
  @override
  LoginButtonClickEvent(this.name, this.password, this.url);
  List<dynamic> get props => [name, password, url];
}

class CheckBoxClickEvent extends LoginEvent {
  bool checkValue;
  CheckBoxClickEvent(this.checkValue);
  List<bool> get props => [checkValue];
}

class LoginSwitchEvent extends LoginEvent {
  bool switchValue;
  LoginSwitchEvent(this.switchValue);
  List<bool> get props => [switchValue];
}
