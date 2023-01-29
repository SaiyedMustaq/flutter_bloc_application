part of 'mobile_otp_bloc.dart';

@immutable
abstract class MobileOtpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EventMobileVerificationInit extends MobileOtpEvent {
  final String mobileNumber;
  EventMobileVerificationInit(this.mobileNumber);
}

class EventMobileVerifyClick extends MobileOtpEvent {
  final String otp;
  EventMobileVerifyClick(this.otp);
}
