part of 'mobile_otp_bloc.dart';

@immutable
abstract class MobileOtpState extends Equatable {
  @override
  List<Object> get props => [];
}

class MobileOtpInitial extends MobileOtpState {}

class MobileSendingState extends MobileOtpState {
  final String message;
  MobileSendingState(this.message);
}

class MobileVerify extends MobileOtpState {
  final String message;
  MobileVerify(this.message);
}

class MobileVerifyFailed extends MobileOtpState {
  final String errorMessage;
  MobileVerifyFailed(this.errorMessage);
}
