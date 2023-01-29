import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../utils/AppUtils.dart';
import '../bloc/singUp/FirebaseSignUp_bloc.dart';
import '../bloc/singUp/FirebaseSignUp_event.dart';
import '../bloc/singUp/FirebaseSignUp_state.dart';

class FirebaseSignUpPage extends StatefulWidget {
  @override
  _FirebaseSignUpPageState createState() => _FirebaseSignUpPageState();
}

class _FirebaseSignUpPageState extends State<FirebaseSignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late FirebaseAuth firebaseAuth;
  late FirebaseSignUpBloc signUpBloc;

  @override
  void initState() {
    super.initState();
    firebaseAuth = FirebaseAuth.instance;
    signUpBloc = FirebaseSignUpBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(child: BlocBuilder<FirebaseSignUpBloc, FirebaseSignUpState>(
        builder: (context, state) {
          if (state is FirebaseSignUpSuccessState) {
            Constants.commonMethod.showSnack(
                context: context, message: state.message, actionText: '');
            Navigator.pop(context);
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //FirebaseLogo(),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),

                PrimaryButton(
                  buttonText: 'Sign Up',
                  buttonClick: () async {
                    signUpBloc.add(FirebaseVerifyButtonClick(
                        emailMobile: emailController.text,
                        password: passwordController.text));
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text('Login'),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
