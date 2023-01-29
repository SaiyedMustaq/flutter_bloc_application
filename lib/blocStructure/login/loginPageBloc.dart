import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/blocStructure/login/repository/loginRepository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../utils/AppUtils.dart';
import 'LoginBlocForm.dart';
import 'loginBloc/LoginBloc.dart';
import 'loginBloc/LoginState.dart';

class LoginPage extends StatefulWidget {
  final UserRepository? userRepository;
  LoginPage({Key? key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  final UserRepository _repository = UserRepository();
  LoginBloc? signInBloc;
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  void initState() {
    signInBloc = LoginBloc(_repository);

    if (kDebugMode) {
      userNameController.text = 'admin@gmail.com';
      userPasswordController.text = '1234567';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    signInBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              //ANCHOR check the user is loading state
              EasyLoading.show(
                maskType: EasyLoadingMaskType.black,
                status: 'Loading...',
              );
            } else if (state is LoginFailed) {
              //ANCHOR check the user is login failed or some network error
              EasyLoading.dismiss();
              Constants.commonMethod.showSnack(
                  context: context, message: state.error, actionText: '');
            } else if (state is LoginSuccess) {
              //ANCHOR Check the user login success
              EasyLoading.dismiss();
              //ANCHOR After login success navigate to next screen
              Constants.commonMethod.showSnack(
                  context: context,
                  message: state.response!.message,
                  actionText: '');
            }
          },
          child: LoginBlocFormBloc(
              userNameController: userNameController,
              userPasswordController: userPasswordController,
              signInBloc: signInBloc),
        ));
  }

  @override
  void dispose() {
    super.dispose();

    //signInBloc.close();/
  }
}
