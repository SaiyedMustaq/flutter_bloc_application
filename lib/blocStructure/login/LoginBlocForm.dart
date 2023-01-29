import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginBloc/LoginBloc.dart';
import 'loginBloc/LoginEvent.dart';
import 'loginBloc/LoginState.dart';

class LoginBlocFormBloc extends StatelessWidget {
  LoginBlocFormBloc({
    Key? key,
    @required this.userNameController,
    @required this.userPasswordController,
    @required this.signInBloc,
  });

  final TextEditingController? userNameController;
  final TextEditingController? userPasswordController;
  final LoginBloc? signInBloc;
  GlobalKey<FormState> fomKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: fomKey,
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: signInBloc,
          buildWhen: (previous, current) {
            return false;
          },
          builder: (BuildContext context, LoginState state) {
            return SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 12, right: 12)),
                        TextFieldEmail(userNameController: userNameController),
                        const Padding(
                            padding: EdgeInsets.only(left: 12, right: 12)),
                        TextFieldPassword(
                            userPasswordController: userPasswordController),
                        const Padding(padding: EdgeInsets.all(12)),
                        LoginButton(
                            fomKey: fomKey,
                            signInBloc: signInBloc,
                            userNameController: userNameController,
                            userPasswordController: userPasswordController),
                        const SizedBox(height: 15.0),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, LoginState state) {
                            print('List $state');
                          },
                          builder: (context, LoginState state) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Checkbox(
                                    value: signInBloc!.checkValue,
                                    onChanged: (vale) {
                                      signInBloc!
                                          .add(CheckBoxClickEvent(vale!));
                                    }),
                                const Text('Remember me?')
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        Container(
                            height: 1, color: Colors.black.withOpacity(0.1)),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.only(right: 5),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Forgot password ?',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Switch(
                                value: signInBloc!.switchValue,
                                onChanged: (val) {
                                  signInBloc!.add(LoginSwitchEvent(val));
                                });
                          },
                        ),
                      ],
                    )));
          },
        ));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.fomKey,
    required this.signInBloc,
    required this.userNameController,
    required this.userPasswordController,
  }) : super(key: key);

  final GlobalKey<FormState> fomKey;
  final LoginBloc? signInBloc;
  final TextEditingController? userNameController;
  final TextEditingController? userPasswordController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: () {
        if (fomKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          signInBloc!.add(LoginButtonClickEvent(
              userNameController!.text.trim(),
              userPasswordController!.text.trim(),
              'http://synergy.imperoserver.in/api/login'));
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Processing Data')),
          // );
        }
      },
      child: const Text(
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
      decoration:
          const InputDecoration(hintText: 'Enter Email', labelText: 'Email'),
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
      decoration: const InputDecoration(
        hintText: 'Enter Password',
        labelText: 'Password',
      ),
    );
  }
}
