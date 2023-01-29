import 'package:flutter_bloc/flutter_bloc.dart';

import '../loginBloc/LoginState.dart';
import '../repository/loginRepository.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginState initialState) : super(InitialLoginState());
  UserRepository repository = UserRepository();

  void gotoLogin(String email, String password, String url) async {
    try {
      emit(const LoginLoading());
      final response =
          await repository.signIn(email: '', password: "", url: "");
      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}
