import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../main.dart';
import '../bloc/login/FirebaseLogin_bloc.dart';
import '../bloc/login/FirebaseLogin_event.dart';
import '../bloc/login/FirebaseLogin_state.dart';
import '../widget/FirebaseLogo.dart';
import 'FirebaseSignUpPage.dart';

class FirebaseLogin extends StatefulWidget {
  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late FirebaseAuth firebaseAuth;
  late FirebaseSignInBloc firebaseSignInBloc;

  @override
  void initState() {
    firebaseSignInBloc = FirebaseSignInBloc();
    firebaseAuth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: BlocBuilder<FirebaseSignInBloc, FirebaseSignInState>(
              builder: (context, state) {
                if (state is FirebaseSingInFailedState) {
                } else if (state is FirebaseSingInErrorState) {
                } else if (state is FirebaseSingInSuccessfullyState) {
                  EasyLoading.showInfo(state.message);
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FirebaseLogo(),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: nameController,
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
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 10),
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
                    SizedBox(height: 30),
                    PrimaryButton(
                      buttonText: 'Login',
                      buttonClick: () {
                        firebaseSignInBloc.add(FirebaseLoginButtonEvent(
                            emailMobile: nameController.text,
                            password: passwordController.text));
                      },
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(_createRoute(FirebaseSignUpPage()));
                        //Get.to(FirebaseSignUpPage());
                      },
                      child: const Text('Sign Up?'),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(5.0, 5.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

// class FirebaseEditText extends StatelessWidget {
//   FirebaseEditText({
//     Key? key,
//     required this.nameController,
//     required this.hintText,
//   }) : super(key: key);

//   final TextEditingController nameController;
//   final String hintText;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: nameController,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.amber,
//           ),
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(12.0),
//             bottomRight: Radius.circular(12.0),
//             topLeft: Radius.circular(12.0),
//             topRight: Radius.circular(12.0),
//           ),
//         ),
//         labelText: '$hintText',
//       ),
//     );
//   }
// }

// errorMessage() {
//   return 'please enter email';
// }

// validate() {
//   return '';
// }

// class FirebaseLogo extends StatelessWidget {
//   const FirebaseLogo({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset('assert/logo-standard.png');
//   }
// }

// class PrimaryButton extends StatefulWidget {
//   final String buttonName;
//   final Function onClickFunction;
//   const PrimaryButton({
//     Key? key,
//     required this.buttonName,
//     required this.onClickFunction,
//   }) : super(key: key);
//   @override
//   _PrimaryButtonState createState() => _PrimaryButtonState();
// }

// class _PrimaryButtonState extends State<PrimaryButton> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         widget.onClickFunction();
//       },
//       child: Container(
//         alignment: Alignment.center,
//         width: double.infinity,
//         padding: EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//             color: Colors.amber, borderRadius: BorderRadius.circular(30.0)),
//         child: Text(
//           widget.buttonName,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18.0,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }
// }
