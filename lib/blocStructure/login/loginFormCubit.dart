import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginBloc/LoginState.dart';
import 'loginCubit/LoginCubit.dart';

// ignore: must_be_immutable
class LoginBlocFormCubit extends StatelessWidget {
  LoginBlocFormCubit({
    Key? key,
    @required this.userNameController,
    @required this.userPasswordController,
    @required this.loginCubit,
  });

  final TextEditingController? userNameController;
  final TextEditingController? userPasswordController;
  final LoginCubit? loginCubit;
  GlobalKey<FormState> fomKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fomKey,
      child: BlocBuilder<LoginCubit, LoginState>(
        bloc: loginCubit,
        buildWhen: (previous, current) {
          return false;
        },
        builder: (BuildContext context, LoginState state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(left: 12, right: 12)),
                  TextFieldEmail(userNameController: userNameController),
                  Padding(padding: EdgeInsets.only(left: 12, right: 12)),
                  TextFieldPassword(
                      userPasswordController: userPasswordController),
                  Padding(padding: EdgeInsets.all(12)),
                  LoginButton(
                      fomKey: fomKey,
                      loginCubit: loginCubit,
                      userNameController: userNameController,
                      userPasswordController: userPasswordController),
                  SizedBox(height: 15.0),
                  SizedBox(height: 15),
                  Container(height: 1, color: Colors.black.withOpacity(0.1)),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password ?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.fomKey,
    required this.loginCubit,
    required this.userNameController,
    required this.userPasswordController,
  }) : super(key: key);

  final GlobalKey<FormState> fomKey;
  final LoginCubit? loginCubit;
  final TextEditingController? userNameController;
  final TextEditingController? userPasswordController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: () {
        if (fomKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          loginCubit!.gotoLogin(
              userNameController!.text.trim(),
              userPasswordController!.text.trim(),
              'http://synergy.imperoserver.in/api/login');
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Processing Data')),
          // );

        }
      },
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key? key,
    required this.userNameController,
  }) : super(key: key);

  final TextEditingController? userNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Email';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "Enter valid email";
        }
        return null;
      },
      controller: userNameController,
      decoration: InputDecoration(hintText: 'Enter Email', labelText: 'Email'),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  TextFieldPassword({
    Key? key,
    required this.userPasswordController,
  }) : super(key: key);

  final TextEditingController? userPasswordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Password';
        }
        if (value.length < 7) {
          return 'Password should be 8 digits';
        }
        return null;
      },
      controller: userPasswordController,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        labelText: 'Password',
      ),
    );
  }
}
