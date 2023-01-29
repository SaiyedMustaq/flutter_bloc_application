import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/loginRepository.dart';
import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final UserRepository repository;
  bool checkValue = false;
  bool switchValue = false;
  bool isInternetAvailable = false;
  LoginBloc(this.repository) : super(InitialLoginState()) {
    on<LoginButtonClickEvent>((event, emit) async {
      emit(const LoginLoading());
      final response = await repository.signIn(
          email: event.name, password: event.password, url: event.url);
      if (response.status == 200) {
        emit(LoginSuccess(response));
      } else {
        emit(LoginFailed(response.message!));
      }
    });
    on<CheckBoxClickEvent>(
        (event, emit) => emit(RememberDone(event.checkValue)));
    on<LoginSwitchEvent>(
        (event, emit) => emit(SwitchChangeState(event.switchValue)));
  }
  // @override
  // LoginState get initialState => InitialLoginState();
  // Stream<LoginState> mapEventToState(
  //   LoginEvent event,
  // ) async* {
  //   try {
  //     if (event is LoginButtonClickEvent) {
  //       yield const LoginLoading();
  //       final response = await repository.signIn(
  //           email: event.name, password: event.password, url: event.url);
  //       if (response.status == 200) {
  //         yield LoginSuccess(response);
  //       } else {
  //         yield LoginFailed(response.message!);
  //       }
  //     } else if (event is CheckBoxClickEvent) {
  //       yield RememberDone(event.checkValue);
  //       debugPrint('${event.checkValue}');
  //     } else if (event is LoginSwitchEvent) {
  //       yield SwitchChangeState(event.switchValue);
  //       debugPrint('${event.switchValue}');
  //     }
  //   } catch (error) {
  //     yield LoginFailed(error.toString());
  //   }
  // }
}
