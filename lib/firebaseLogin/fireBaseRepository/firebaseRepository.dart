import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseRepository {
  late String verificationId;
  late PhoneAuthCredential _phoneAuthCredential;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future signUpWithEmailPassword(
      {required String emailMobile, required String password}) async {
    EasyLoading.show(status: '', maskType: EasyLoadingMaskType.black);
    final authUser = await _auth
        .createUserWithEmailAndPassword(email: emailMobile, password: password)
        .then((value) {
      EasyLoading.dismiss();
      print('Sign Up Result $value');
    });
    return authUser;
  }

  Future signInWithEmailMobile(
      {required String emailMobile, required String password}) async {
    EasyLoading.show(status: '', maskType: EasyLoadingMaskType.black);
    await _auth
        .signInWithEmailAndPassword(
      email: emailMobile,
      password: password,
    )
        .then((value) {
      EasyLoading.dismiss();
      print('SING IN RESPONSE ===>>>>>  $value');
    });
  }

  Future<dynamic> verifyPhone(String mobileNumber) async {
    EasyLoading.showToast('Otp sending',
        toastPosition: EasyLoadingToastPosition.bottom);

    final PhoneCodeSent smsOTPSent = (String? verId, [int? forceCodeResend]) {
      this.verificationId = verId!;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+91$mobileNumber', // PHONE NUMBER TO SEND OTP
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
            // setState(() {
            //   //this._code.text = phoneAuthCredential.smsCode;
            // });
          },
          verificationFailed: (FirebaseAuthException exception) {
            print("HELOOOO!!0::::");
            print(exception.message);
            if (exception.message!.contains('not authorized')) {
              EasyLoading.showToast('not authorized',
                  toastPosition: EasyLoadingToastPosition.bottom);
            } else if (exception.message!.contains('Network')) {
              EasyLoading.showToast('Network',
                  toastPosition: EasyLoadingToastPosition.bottom);
            } else {
              EasyLoading.showToast('Something Went Wrong',
                  toastPosition: EasyLoadingToastPosition.bottom);
            }
          });
    } catch (exception) {
      print("HELOOOO!!1::::");
      return exception.toString();
      // print(exception.message);
      // handleError(exception);
    }
  }

  Future<UserCredential> submitOtp(String otp) async {
    var authResult;
    this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otp);
    try {
      authResult = await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential);
      print('AUTH RESULT $authResult');
      EasyLoading.showToast('OTP verify successfully',
          toastPosition: EasyLoadingToastPosition.bottom);
      return authResult;
    } catch (e) {
      print('Error ${e.toString()}');
      EasyLoading.showToast('Invalid Code',
          toastPosition: EasyLoadingToastPosition.bottom);
      return authResult;
    }
  }
}
