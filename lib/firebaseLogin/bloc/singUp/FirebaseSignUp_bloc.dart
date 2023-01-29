import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import '../../fireBaseRepository/firebaseRepository.dart';
import '../signUpBloc.dart';

class FirebaseSignUpBloc
    extends Bloc<FirebaseSignUpEvent, FirebaseSignUpState> {
  FirebaseRepository firebaseRepository = FirebaseRepository();
  FirebaseSignUpBloc() : super(FirebaseSignUpInitialState());

  @override
  Stream<FirebaseSignUpState> mapEventToState(
    FirebaseSignUpEvent event,
  ) async* {
    try {
      if (event is FirebaseVerifyButtonClick) {
        var response = await firebaseRepository.signUpWithEmailPassword(
            emailMobile: event.emailMobile, password: event.password);
        print('FirebaseVerify Response $response');
        yield FirebaseSignUpSuccessState(
            message: 'Create account successfully');
      }
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'FirebaseSignUpBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
