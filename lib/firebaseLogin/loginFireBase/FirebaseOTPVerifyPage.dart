import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../main.dart';
import '../../utils/AppUtils.dart';
import '../bloc/mobileOtp/mobile_otp_bloc.dart';

class FirebaseOTPVerifyPage extends StatefulWidget {
  final String mobileNumber;

  const FirebaseOTPVerifyPage({Key? key, required this.mobileNumber})
      : super(key: key);
  @override
  State<FirebaseOTPVerifyPage> createState() => _FirebaseOTPVerifyState();
}

class _FirebaseOTPVerifyState extends State<FirebaseOTPVerifyPage> {
  final TextEditingController otpController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  late MobileOtpBloc mobileOtpBloc;
  late String verificationId;
  late AuthCredential _phoneAuthCredential;
  @override
  void initState() {
    debugPrint('+91${widget.mobileNumber}');
    mobileOtpBloc = MobileOtpBloc();

    //mobileOtpBloc.mobileOptSend('${widget.mobileNumber}');
    mobileOtpBloc.add(MobileSendingState(widget.mobileNumber.toString()));
    //verifyPhone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<MobileOtpBloc, MobileOtpState>(
                  builder: (context, state) {
                    if (state is MobileOtpInitial) {
                      //print('Mobile otp send ');
                    } else if (state is MobileSendingState) {
                      Constants.commonMethod.showSnack(
                          context: context,
                          message: state.message,
                          actionText: '');
                      //print('MobileSendingState');
                    } else if (state is MobileVerify) {
                      Constants.commonMethod.showSnack(
                          context: context,
                          message: state.message,
                          actionText: '');
                      debugPrint('MobileVerify');
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: otpController,
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
                            labelText: 'Otp',
                          ),
                        ),
                        const SizedBox(height: 30),
                        PrimaryButton(
                          buttonText: 'Verify',
                          buttonClick: () {
                            //mobileOtpBloc.add(EventMobileVerifyClick());
                            mobileOtpBloc.add(MobileVerify(otpController.text));
                          },
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone() async {
    EasyLoading.showToast('Otp sending',
        toastPosition: EasyLoadingToastPosition.bottom);

    final PhoneCodeSent smsOTPSent = (String? verId, [int? forceCodeResend]) {
      this.verificationId = verId!;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+91${widget.mobileNumber}', // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 120),
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            setState(() {
              //this._code.text = phoneAuthCredential.smsCode;
            });
          },
          verificationFailed: (FirebaseAuthException exception) {
            setState(() {
              print("HELOOOO!!0::::");
              print(exception.message);
              if (exception.message!.contains('not authorized')) {
                // Utils.showToastMessage(Constants.something_went_wrong);
              } else if (exception.message!.contains('Network')) {
                //Utils.showToastMessage(Constants.check_internet_connection);
              } else {
                //Utils.showToastMessage(Constants.something_went_wrong);
              }
            });
          });
    } catch (exception) {
      print("HELOOOO!!1::::");
      // print(exception.message);
      // handleError(exception);
    }
  }

  handleError(PlatformException error) {
    print(error.code);
    print(error.details);
    print('HANDLE ERROR $error');
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          // isVerify = false;
          // codeResendStatue = false;
          // sendButtonShow = false;
          // Utils.showToastMessage(Constants.invalid_code);
          // errorMessage = 'Invalid Code';
        });
        break;
      default:
        setState(() {
          // Utils.showToastMessage(Constants.invalid_code);
          // errorMessage = error.message;
          // sendButtonShow = false;
          // isVerify = false;
          // codeResendStatue = false;
        });
        break;
    }
  }

  void _submitOTP() {
    setState(() {});
    try {
      this._phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: this.verificationId, smsCode: otpController.text);
      _login();
      print('VERIFICATION ID');
    } catch (e) {
      //handleError(e);
      print('CATCH ERROR $e');
    }
  }

  Future<void> _login() async {
    print('LOGIN CALL');
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential);
      EasyLoading.showToast('OTP verify successfully',
          toastPosition: EasyLoadingToastPosition.bottom);
    } catch (e) {
      print('Error ${e.toString()}');
      EasyLoading.showToast('Invalid Code',
          toastPosition: EasyLoadingToastPosition.bottom);
      setState(() {});
    } finally {
      setState(() {});
    }
  }
}
