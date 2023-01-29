import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../fireBaseRepository/firebaseRepository.dart';

part 'mobile_otp_event.dart';
part 'mobile_otp_state.dart';

class MobileOtpBloc extends Bloc<MobileOtpState, MobileOtpState> {
  FirebaseRepository firebaseRepository = FirebaseRepository();
  MobileOtpBloc() : super(MobileOtpInitial());

  @override
  Stream<MobileOtpState> mapEventToState(MobileOtpState event) async* {
    if (event is MobileSendingState) {
      print('Mobile Otp Initial');
    } else if (event is MobileVerify) {
      print('Mobile Verify');
    }
  }

// void mobileOptSend(String mobileNumber) async {
  //   var rep = await firebaseRepository.verifyPhone(mobileNumber);
  //   MobileSendingState('Opt send on mobile number $rep');
  // }
  //
  // void mobileOtpVerify(String otpCode) async {
  //   try {
  //     var response = await firebaseRepository.submitOtp(otpCode);
  //     // ignore: invalid_use_of_visible_for_testing_member
  //     emit(MobileVerify('$response'));
  //   } catch (e) {
  //     MobileVerifyFailed(e.toString());
  //     print(e);
  //   }
  // }
}
